package com.logus.controller;

import java.util.ArrayList;
import java.util.List;

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

import com.logus.dailystory.model.DailystoryVO;
import com.logus.dailystory.service.IDailystoryService;
import com.logus.reply.model.ReplyVO;
import com.logus.reply.service.IReplyService;
import com.logus.tag.model.TagVO;
import com.logus.tag.service.ITagService;
import com.logus.util.constant.TagCategory;
import com.logus.util.constant.url.DailystoryURL;
import com.logus.util.constant.url.RedirURLMaker;
import com.logus.util.redirectencoder.RedirEncoder;

@Controller
// 일일 스토리 서비스 제어하는 컨트롤러 클래스
public class DailystoryController {
	@Autowired
	IDailystoryService dailystoryService;	// 일일 스토리 서비스 객체
	@Autowired
	IReplyService replyService;				// 댓글 서비스 객체
	@Autowired
	ITagService tagService;					// 태그 서비스 객체
	
	private static Logger logger = LoggerFactory.getLogger(DailystoryController.class);	// logger 객체
	
	@GetMapping(value="/lib")
	// 서재 메인으로 이동
	public String libMain(HttpSession session) {
		//session.setAttribute("user", "회원닉네임테스트01");
		return "redirect:/library";
	}
	
	@GetMapping(value="/error")
	// 에러(404, 500) 시 index 페이지로 redirect
	public String errorLog() {
		logger.debug("error");
		return RedirURLMaker.REDIR_INDEX_URL;
	}
	
	@GetMapping(value=DailystoryURL.INSERT_URL)
	// 일일 스토리 작성 폼으로 이동
	public String insertDailystory() {
		return DailystoryURL.INSERT_VIEWNAME;		// 스토리 작성 view로 이동
	}
	
	@PostMapping(value=DailystoryURL.INSERT_URL)
	// 일일 스토리 작성
	public String insertDailystory(DailystoryVO vo, @RequestParam("tagNames") String tagNames, HttpSession session) {
		vo.setMemberNickname((String)session.getAttribute("memberNickname"));	// 세션으로부터 받은 닉네임 정보로 저장
		dailystoryService.insertDailystory(vo, 
				tagService.makeTagList(tagNames, TagCategory.DAILY_STORY, vo.getDailystoryCode()));	// DB insert
		return RedirURLMaker.makeRedirURLStoryList(vo.getMemberNickname());		// 스토리 목록 페이지로 redirect
	}

	@GetMapping(value=DailystoryURL.UPDATE_FORM_URL)
	// 일일 스토리 수정 폼으로 이동
	public String updateDailystory(@PathVariable int dailystoryCode, Model model) {
		DailystoryVO vo = dailystoryService.selectDailystoryInfo(dailystoryCode);	// 해당 스토리의 상세 정보 select(폼에 출력하기 위함)
		List<TagVO> tagList = tagService.selectTagList(TagCategory.DAILY_STORY, dailystoryCode);	// 해당 스토리의 태그 목록 select
		String tags = tagService.makeTagString(tagList);											// 태그 나열된 문자열 생성
		// 받아온 데이터를 model에 저장
		model.addAttribute("dsVO", vo);
		model.addAttribute("tagList", tagList);
		model.addAttribute("tags", tags);
		return DailystoryURL.UPDATE_VIEWNAME;		// 스토리 수정 view로 이동
	}
	
	@PostMapping(value=DailystoryURL.UPDATE_URL)
	// 일일 스토리 수정
	public String updateDailystory(DailystoryVO vo, @RequestParam("tagNames") String tagNames, 
								@RequestParam("tagCodes") List<Integer> tagCodes) {
		dailystoryService.updateDailystory(vo, tagService.makeTagList(tagNames, TagCategory.DAILY_STORY, 
																	vo.getDailystoryCode()), tagCodes);								// DB update
		return "redirect:/" + RedirEncoder.encode(vo.getMemberNickname()) + "/library/story/" + vo.getDailystoryCode();		// 해당 스토리 상세 보기로 redirect
	}

	@PostMapping(value=DailystoryURL.DELETE_URL)
	@ResponseBody
	// 일일 스토리 삭제
	public String deletePostDailystory(@PathVariable String memberNickname, @PathVariable int dailystoryCode, 
									int tagCount, int replyCount) {
		dailystoryService.deleteDailystory(dailystoryCode, tagCount, replyCount);	// 해당 스토리 삭제
		return "/" + memberNickname + "/library/main";			// 삭제 후 AJax로 닉네임 리턴
	}

	@GetMapping(value=DailystoryURL.INFO_URL)
	// 일일 스토리 상세 내용 조회
	public String selectDailystoryInfo(@PathVariable int dailystoryCode, Model model) {
		DailystoryVO vo = dailystoryService.selectDailystoryInfo(dailystoryCode);					// 해당 스토리 상세 내용 조회
		List<ReplyVO> rpList = replyService.selectReplyList(dailystoryCode);						// 해당 스토리의 댓글 목록 조회
		List<TagVO> tagList = tagService.selectTagList(TagCategory.DAILY_STORY, dailystoryCode);	// 해당 스토리의 태그 목록 조회
		// 모델에 조회한 데이터 저장
		model.addAttribute("dsVO", vo);
		model.addAttribute("rpList", rpList);
		model.addAttribute("tagList", tagList);
		return DailystoryURL.INFO_VIEWNAME;	// 스토리 상세 보기 view로 이동
	}

	@GetMapping(value=DailystoryURL.LIST_URL)
	// 일일 스토리 목록 조회(내 서재 메인)
	public String selectDailystoryList(@PathVariable String memberNickname, Model model) {
		List<DailystoryVO> dsList = dailystoryService.selectDailystoryList(memberNickname);	// 해당 닉네임의 일일 스토리 목록 조회
		List<Integer> rpCount = replyService.countReplyDailystoryList(memberNickname);		// 각 스토리별 댓글 수 조회
		// 모델에 조회한 데이터 저장
		model.addAttribute("memberNickname", memberNickname);
		model.addAttribute("dsList", dsList);
		model.addAttribute("rpCount", rpCount);
		return DailystoryURL.LIST_VIEWNAME;		// 스토리 목록 보기 view(서재 메인 페이지)로 이동
	}
	
	@GetMapping(value="library/search")
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
		model.addAttribute("dsList", dsList);
		return DailystoryURL.LIST_VIEWNAME;
	}
}
