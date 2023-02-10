package com.logus.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.logus.dailystory.model.DailystoryVO;
import com.logus.dailystory.service.IDailystoryService;
import com.logus.reply.model.ReplyVO;
import com.logus.reply.service.IReplyService;
import com.logus.tag.model.TagVO;
import com.logus.tag.service.ITagService;
import com.logus.util.constant.TagCategory;
import com.logus.util.filemanager.FileManager;
import com.logus.util.redirectencoder.RedirEncoder;

@Controller
// 일일 스토리 서비스 제어하는 컨트롤러 클래스
public class DailystoryController {
	@Autowired
	private IDailystoryService dailystoryService;	// 일일 스토리 서비스 객체
	@Autowired
	private IReplyService replyService;				// 댓글 서비스 객체
	@Autowired
	private ITagService tagService;					// 태그 서비스 객체
	
	@Autowired
	private FileManager fm;							// 파일 관리 클래스 객체
	
	private static Logger logger = LoggerFactory.getLogger(DailystoryController.class);	// logger 객체
	
	private String serviceName = "dailystory";		// 서비스 이름(이미지 저장 폴더명)
	
	@GetMapping(value="/{memberNickname}/library/story/insert")
	// 일일 스토리 작성 폼으로 이동
	public String insertDailystory() {
		return "dailystory/insertform";		// 스토리 작성 view로 이동
	}
	
	@PostMapping(value="/{memberNickname}/library/story/insert")
	// 일일 스토리 작성
	public String insertDailystory(DailystoryVO vo, @RequestParam("tagNames") String tagNames,
								@RequestParam("thumbnail") MultipartFile thumbnail, HttpSession session) {
		try{
			String fileName = fm.uploadFile(serviceName, thumbnail, session);
			vo.setDailystoryImage(fileName);
		} catch (IOException e) {
			logger.info("^ dailystory file upload failed");
		}
		vo.setMemberNickname((String)session.getAttribute("memberNickname"));	// 세션으로부터 받은 닉네임 정보로 저장
		dailystoryService.insertDailystory(vo, 
				tagService.makeTagList(tagNames, TagCategory.DAILY_STORY, vo.getDailystoryCode()));	// DB insert
		return "redirect:/" + RedirEncoder.encode(vo.getMemberNickname()) + "/library/dailystorylist";		// 일일 스토리 목록 페이지로 redirect
	}

	@GetMapping(value="/{memberNickname}/library/story/{dailystoryCode}/update")
	// 일일 스토리 수정 폼으로 이동
	public String updateDailystory(@PathVariable int dailystoryCode, Model model) {
		DailystoryVO vo = dailystoryService.selectDailystoryInfo(dailystoryCode);	// 해당 스토리의 상세 정보 select(폼에 출력하기 위함)
		List<TagVO> tagList = tagService.selectTagList(TagCategory.DAILY_STORY, dailystoryCode);	// 해당 스토리의 태그 목록 select
		String tags = tagService.makeTagString(tagList);											// 태그 나열된 문자열 생성
		// 받아온 데이터를 model에 저장
		model.addAttribute("dsVO", vo);
		model.addAttribute("tagList", tagList);
		model.addAttribute("tags", tags);
		return "dailystory/updateform";		// 스토리 수정 view로 이동
	}
	
	@PostMapping(value="/{memberNickname}/library/story/update")
	// 일일 스토리 수정
	public String updateDailystory(DailystoryVO vo, @RequestParam("tagNames") String tagNames, @RequestParam(value="tagCodes", required=false, defaultValue="-1" ) List<Integer> tagCodes, 
								@RequestParam("thumbnail") MultipartFile thumbnail, HttpSession session) {
		logger.info("태그 수:"+tagCodes.size()+"/태그내용"+tagCodes.get(0));
		try{
			String beforeThumbnail = vo.getDailystoryImage();
			// 기존에 썸네일이 있었을 경우
			if(beforeThumbnail != null && !beforeThumbnail.equals("")) {
				if(thumbnail != null && thumbnail.getSize() != 0) {					
					if(fm.getFile(serviceName, beforeThumbnail, session).delete()) {
					} else {
						logger.info("^ dailystory update file change failed");
					}				
					String fileName = fm.uploadFile(serviceName, thumbnail, session);
					vo.setDailystoryImage(fileName);
				}
			} else {
				String fileName = fm.uploadFile(serviceName, thumbnail, session);
				vo.setDailystoryImage(fileName);
			}
		} catch (IOException e) {
			logger.info("^ dailystory file update failed");
		}
		dailystoryService.updateDailystory(vo, tagService.makeTagList(tagNames, TagCategory.DAILY_STORY, 
																	vo.getDailystoryCode()), tagCodes);						// DB update
		return "redirect:/" + RedirEncoder.encode(vo.getMemberNickname()) + "/library/story/" + vo.getDailystoryCode();		// 해당 스토리 상세 보기로 redirect
	}

	@PostMapping(value="/{memberNickname}/library/story/{dailystoryCode}/delete")
	@ResponseBody
	// 일일 스토리 삭제
	public String deleteDailystory(@PathVariable String memberNickname, @PathVariable int dailystoryCode, 
									int tagCount, int replyCount, String dailystoryImage, HttpSession session) {
		File file = null;
		if(!dailystoryImage.equals("preview_thumbnail_img")) {			// 기본 이미지가 아닌 경우(사용자가 올린 썸네일이 있는 경우)
			file = fm.getFile(serviceName, dailystoryImage, session);	// 파일 객체 참조
		}
		dailystoryService.deleteDailystory(dailystoryCode, tagCount, replyCount, file);		// 해당 스토리 삭제
		return memberNickname;																// 삭제 후 AJax로 닉네임 리턴
	}

	@GetMapping(value="/{memberNickname}/library/story/{dailystoryCode}")
	// 일일 스토리 상세 내용 조회
	public String selectDailystoryInfo(@PathVariable int dailystoryCode, Model model) {
		DailystoryVO vo = dailystoryService.selectDailystoryInfo(dailystoryCode);					// 해당 스토리 상세 내용 조회
		List<ReplyVO> rpList = replyService.selectReplyList(dailystoryCode);						// 해당 스토리의 댓글 목록 조회
		List<TagVO> tagList = tagService.selectTagList(TagCategory.DAILY_STORY, dailystoryCode);	// 해당 스토리의 태그 목록 조회
		// 모델에 조회한 데이터 저장
		model.addAttribute("dsVO", vo);
		model.addAttribute("rpList", rpList);
		model.addAttribute("tagList", tagList);
		return "dailystory/storydetail";	// 스토리 상세 보기 view로 이동
	}

	@GetMapping(value="/{memberNickname}/library/dailystorylist")
	// 일일 스토리 목록 조회(내 서재 메인)
	public String selectDailystoryList(@PathVariable String memberNickname, Model model) {
		List<DailystoryVO> dsList = dailystoryService.selectDailystoryList(memberNickname);	// 해당 닉네임의 일일 스토리 목록 조회
		// select한 일일 스토리 코드 목록 생성
		List<Integer> codeList = new ArrayList<Integer>();
		for(DailystoryVO vo : dsList) {
			codeList.add(vo.getDailystoryCode());
		}
		List<Integer> rpCount = replyService.countReplyDailystoryList(memberNickname);		// 각 스토리별 댓글 수 조회
		Map<Integer, List<TagVO>> tagList = tagService.makeTagListMap(TagCategory.DAILY_STORY, codeList);
		// 모델에 조회한 데이터 저장
		model.addAttribute("memberNickname", memberNickname);
		model.addAttribute("dsList", dsList);
		model.addAttribute("rpCount", rpCount);
		model.addAttribute("tagList", tagList);
		return "dailystory/storylist";		// 스토리 목록 보기 view(서재 메인 페이지)로 이동
	}
	
	@GetMapping(value="/library/search")
	// 일일 스토리 검색(myNickname이 있으면 서재 내 검색, 없으면 전체 검색)
	public String findDailystoryList(@RequestParam(value="option") String option, @RequestParam(value="search") String search, 
							@RequestParam(value="myNickname", required=false, defaultValue="!@#$\r\t\t\n") String myNickname,
							Model model) {
		List<DailystoryVO> dsList = new ArrayList<DailystoryVO>();
		search = "%" + search + "%";
		if(myNickname.equals("!@#$\r\t\t\n")) {
			dsList = dailystoryService.findDailystoryList(option, search);
		} else {
			dsList = dailystoryService.findDailystoryList(option, search, myNickname);			
		}
		// select한 일일 스토리 코드 목록 생성
		List<Integer> codeList = new ArrayList<Integer>();
		for(DailystoryVO vo : dsList) {
			codeList.add(vo.getDailystoryCode());
			logger.info("코드:" + vo.getDailystoryCode());
		}
		List<Integer> rpCount = replyService.countReplyEach(codeList);		// 각 스토리별 댓글 수 조회
		for(Integer i : rpCount) {
			logger.info("댓글 수:" + i);
		}
		Map<Integer, List<TagVO>> tagList = tagService.makeTagListMap(TagCategory.DAILY_STORY, codeList);
		// 모델에 조회한 데이터 저장
		model.addAttribute("dsList", dsList);
		model.addAttribute("rpCount", rpCount);			
		model.addAttribute("tagList", tagList);
		return "dailystory/storylist";
	}
}
