package com.logus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.logus.dailycheck.model.DailycheckVO;
import com.logus.dailycheck.service.IDailycheckService;
import com.logus.dailyroutine.model.DailyroutineVO;
import com.logus.dailyroutine.service.IDailyroutineService;

@Controller
public class LibraryController {
	@Autowired
	private IDailyroutineService DailyroutineService;	
	@Autowired
	private IDailycheckService DailycheckService;
	
	private String view_ref ="library/";	//뷰 위치
	
	DailyroutineVO dailyroutineVO = new DailyroutineVO();	//루틴 정보 VO 객체 생성
	
	DailycheckVO dailycheckVO = new DailycheckVO();			//루틴 상세 VO 객체 생성
	
	@GetMapping(value="/library")	//서재 내용-화면용
	public String selectLibrary(HttpSession session) {
		return view_ref+"library";
	}
}
