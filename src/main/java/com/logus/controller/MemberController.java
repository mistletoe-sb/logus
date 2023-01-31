package com.logus.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.logus.member.model.MemberVO;
import com.logus.member.service.IMemberService;
import com.logus.member.service.MemberService;

@Controller
// 회원정보 서비스 컨트롤러 클래스
public class MemberController {
	@Autowired
	private IMemberService memberService;	// MemberService 객체
	
	private String view_pos = "member/";		// 뷰 저장 위치
	
	@RequestMapping(value="/test/count")
	public String empCount(Model model) {
		model.addAttribute("count", memberService.countMember());
		return view_pos + "count";
	}
	
	@RequestMapping(value="/loginform")
	public String memberLoginform() {
		return  view_pos + "loginform";
	}
	

	
	@RequestMapping(value="/memberLogin", method=RequestMethod.POST)
	public String memberLogin(String memberId, String memberPassword, HttpSession session, Model model) {
		MemberVO vo = memberService.loginCheck(memberId, memberPassword);
		if(vo == null) {
			model.addAttribute("message", "존재 하지 않는 아이디 입니다.");
			return "redirect:"+  "loginform";
			// 존재하지 않는 ID입니다. >> 예외처리
		} else {
			if(memberPassword.equals(vo.getMemberPassword())) {
				model.addAttribute("message", vo.getMemberNickname()+"님 로그인에 성공 했습니다.");
				session.setAttribute("memberId", memberId);
				session.setAttribute("memberNickname", vo.getMemberNickname());
				return "index";	
			} else {
				model.addAttribute("message", "비밀번호를 다시 확인하세요.");
				return "redirect:"+  "loginform";
				// 비밀번호가 일치하지 않습니다. >> 예외처리
			}
		}
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String memberLogout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		return  "index";
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
		return "redirect:"+  "loginform";
	}
	
	//아이디 중복체크
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {				
		int cnt = memberService.ckeckId(id);
		return cnt;		
	}
	
	@PostMapping("/nicknameCheck")
	@ResponseBody
	public int nicknameCheck(@RequestParam("nickname") String nickname) {				
		int cnt = memberService.ckeckId(nickname);
		return cnt;		
	}


}
