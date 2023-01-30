package com.logus.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.logus.dailystory.model.DailystoryVO;
import com.logus.dailystory.service.IDailystoryService;
import com.logus.util.redirectencoder.RedirEncoder;

@Controller
// 일일 스토리 서비스 제어하는 컨트롤러 클래스
public class DailystoryController {
	@Autowired
	IDailystoryService dailystoryService;	// 일일 스토리 서비스 객체
	
	private static Logger logger = LoggerFactory.getLogger(DailystoryController.class);	// logger 객체

	@GetMapping(value="/lib")
	// 테스트용 서재 메인으로 이동
	public String libMain() {
		return "redirect:/" + RedirEncoder.encode("회원닉네임테스트01") + "/library/main";
	}
	
	@GetMapping(value="/error")
	public String errorLog() {
		logger.debug("error");
		return "redirect:/";
	}
	
	@GetMapping(value="/{memberNickname}/library/story/insert")
	// 일일 스토리 작성
	public String insertDailystory() {
		return "dailystory/insertform";
	}
	
	@PostMapping(value="/{memberNickname}/library/story/insert")
	// 일일 스토리 작성
	public String insertDailystory(DailystoryVO vo) {
		dailystoryService.insertDailystory(vo);
		return "redirect:/" + RedirEncoder.encode(vo.getMemberNickname()) + "/library/main";
	}

	// 일일 스토리 수정
	public String updateDailystory(DailystoryVO vo) {
		dailystoryService.updateDailystory(vo);
		return null;
	}

	// 일일 스토리 삭제
	public String deleteDailystory(int dailystoryCode, int tagCount, int replyCount) {
		dailystoryService.deleteDailystory(dailystoryCode, tagCount, replyCount);
		return null;
	}

	// 일일 스토리 상세 내용 조회
	public String selectDailystoryInfo(int dailystoryCode) {
		dailystoryService.selectDailystoryInfo(dailystoryCode);
		return null;
	}

	@GetMapping(value="{memberNickname}/library/main")
	// 일일 스토리 목록 조회(내 서재 메인)
	public String selectDailystoryList(@PathVariable String memberNickname, Model model) {
		List<DailystoryVO> dsList = dailystoryService.selectDailystoryList(memberNickname);	// 해당 닉네임의 일일 스토리 목록 조회
		model.addAttribute("dsList", dsList);												// 모델에 조회한 목록 저장
		return "dailystory/storylist";
	}
}
