package com.logus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.logus.dailystory.model.DailystoryVO;
import com.logus.dailystory.service.IDailystoryService;

@Controller
// 일일 스토리 서비스 제어하는 컨트롤러 클래스
public class DailystoryController {
	@Autowired
	IDailystoryService dailystoryService;	// 일일 스토리 서비스 객체

	@GetMapping(value="/{memberNickname}/dailystory/insert")
	// 일일 스토리 작성
	public String insertDailystory() {
		return "dailystory/insertform";
	}
	
	@PostMapping(value="/{memberNickname}/dailystory/insert")
	// 일일 스토리 작성
	public String insertDailystory(DailystoryVO vo) {
		dailystoryService.insertDailystory(vo);
		return null;
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

	// 일일 스토리 목록 조회(내 서재)
	public String selectDailystoryList(String memberNickname) {
		dailystoryService.selectDailystoryList(memberNickname);
		return null;
	}
}
