package com.logus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.logus.member.model.MemberVO;
import com.logus.member.service.IMemberService;
import com.logus.member.service.MemberService;

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
	
	@RequestMapping(value="/login")
	public String memberLogin() {
		return  view_pos + "login";
	}
	
	@RequestMapping(value="/insertform")
	public String memberInsertform() {
		return  view_pos + "insertform";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String memberInsert(MemberVO vo, RedirectAttributes redirectAttributes) {
		try {
			memberService.insertMember(vo);
			redirectAttributes.addFlashAttribute("message", vo.getMemberId()+"님 회원가입이 완료 되었습니다.");
		}catch(RuntimeException e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:"+  "login";
	}

}
