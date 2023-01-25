package com.logus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.logus.member.service.IMemberService;

@Controller
// 회원정보 서비스 컨트롤러 클래스
public class MemberController {
	@Autowired
	private IMemberService memberService;	// MemberService 객체
	
	private String view_pos = "logus/";		// 뷰 저장 위치
	
	@RequestMapping(value="/test/count")
	public String empCount(Model model) {
		model.addAttribute("count", memberService.countMember());
		return view_pos + "count";
	}

}
