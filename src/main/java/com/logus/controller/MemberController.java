package com.logus.controller;

import java.io.File;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.logus.member.model.MemberVO;
import com.logus.member.service.IMemberService;
import com.logus.member.service.MemberService;

@Controller
// 회원정보 서비스 컨트롤러 클래스
public class MemberController {
	
	private static final String PATH = "C:\\project_labs\\spring_workspace\\logus\\src\\main\\webapp\\resources\\images\\member";
	
	@Autowired
	private IMemberService memberService;	// MemberService 객체
	
	private String view_pos = "member/";		// 뷰 저장 위치
	
	@RequestMapping(value="/test/count")
	public String empCount(Model model) {
		model.addAttribute("count", memberService.countMember());
		return view_pos + "count";
	}
	
	@RequestMapping(value="/index")
	public String index() {
		return "index";
	}


	@RequestMapping(value="/updateMemberForm")
	public String updateMemberFrom(HttpSession session,Model model) {
		String memberId = session.getAttribute("memberId").toString();
		MemberVO vo = memberService.selectMemberInfo(memberId);
		model.addAttribute("filePath", PATH + "\\" + vo.getMemberProfile());
		model.addAttribute("selectMemberInfo", vo);
		return  view_pos + "updateMemberForm";
	}
	@RequestMapping(value="/deleteMemberForm")
	public String deleteMemberFrom() {
		return  view_pos + "deleteMemberForm";
	}
	@RequestMapping(value="/loginform")
	public String loginform() {
		return  view_pos + "loginform";
	}
	@RequestMapping(value="/mypage")
	public String mypage() {
		return  view_pos + "mypage";
	}
	@RequestMapping(value="/idModal")
	public String idModal() {
		return  view_pos + "idModal";
	}
	
	
	@RequestMapping(value="/deleteMember", method=RequestMethod.POST)
	public String deleteMember(HttpSession session, String memberPassword, RedirectAttributes redirectAttributes) {
		
		String memberId = session.getAttribute("memberId").toString();
		MemberVO vo = memberService.loginCheck(memberId, memberPassword);
		if(memberPassword.equals(vo.getMemberPassword())) {
			redirectAttributes.addFlashAttribute("탈퇴가 완료 되었습니다.");
			memberService.exitMember(memberId);
			session.invalidate();
			return "index";	
		} else {
			redirectAttributes.addFlashAttribute("message", "비밀번호를 다시 확인하세요.");
			return "redirect:/"+  "mypage";
			// 비밀번호가 일치하지 않습니다. >> 예외처리
		}
	}

	
	@RequestMapping(value="/memberLogin", method=RequestMethod.POST)
	public String memberLogin(String memberId, String memberPassword, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
		MemberVO vo = memberService.loginCheck(memberId, memberPassword);
		if(vo == null) {
			redirectAttributes.addFlashAttribute("message", "존재 하지 않는 아이디 입니다.");
			return "redirect:/"+  "loginform";
			// 존재하지 않는 ID입니다. >> 예외처리
		} else {
			if(memberPassword.equals(vo.getMemberPassword())) {
				if(vo.getMemberOutdate() == null){
				redirectAttributes.addFlashAttribute("message", vo.getMemberId()+"님 로그인에 성공 했습니다.");
				session.setAttribute("memberId", memberId);
				session.setAttribute("memberNickname", vo.getMemberNickname());
				return "redirect:/"+"index";	
				} else {
					redirectAttributes.addFlashAttribute("message", "탈퇴한 아이디 입니다.");
					return "redirect:/"+  "loginform";
				}
			} else {
				redirectAttributes.addFlashAttribute("message", "비밀번호를 다시 확인하세요.");
				return "redirect:/"+  "loginform";
				// 비밀번호가 일치하지 않습니다. >> 예외처리
			}
		}
	}
	
	@RequestMapping(value="/findId", method=RequestMethod.POST)
	public String findId(MemberVO vo,  Model model, RedirectAttributes redirectAttributes) {
		try {
			if(profile.getSize() != 0) {
				String profileURL = PATH + "\\" + profile.getOriginalFilename();
				profile.transferTo(new File(profileURL));
				vo.setMemberProfile(profile.getOriginalFilename());
			}
			memberService.findId(vo);
			redirectAttributes.addFlashAttribute("message", vo.getMemberId()+"님 회원가입이 완료 되었습니다.");
		}catch(RuntimeException e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:"+  "loginform";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String memberLogout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		return  "redirect:/";
	}
	
	@RequestMapping(value="/insertform")
	public String memberInsertform() {
		return  view_pos + "insertform";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String memberInsert(MemberVO vo, RedirectAttributes redirectAttributes, @RequestParam MultipartFile profile) {
		try {
			if(profile.getSize() != 0) {
				String profileURL = PATH + "\\" + profile.getOriginalFilename();
				profile.transferTo(new File(profileURL));
				vo.setMemberProfile(profile.getOriginalFilename());
			}
			memberService.insertMember(vo);
			redirectAttributes.addFlashAttribute("message", vo.getMemberId()+"님 회원가입이 완료 되었습니다.");
		}catch(RuntimeException e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:"+  "loginform";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String memberUpdate(HttpSession session,MemberVO vo, RedirectAttributes redirectAttributes, @RequestParam MultipartFile profile) {
		System.out.println(vo);
		
		try {
			if(profile.getSize() != 0) {
				
				
				String profileURL = PATH + "\\" + profile.getOriginalFilename();
				profile.transferTo(new File(profileURL));
				vo.setMemberProfile(profile.getOriginalFilename());
			}
			memberService.updateMember(vo);
			redirectAttributes.addFlashAttribute("message", "수정이 완료됐습니다. 재로그인을 해주세요.");
			
		} catch (RuntimeException e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		}
		session.invalidate();
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
		int cnt = memberService.ckeckNickname(nickname);
		return cnt;		
	}
	
	
	@PostMapping("/phoneCheck")
	@ResponseBody
	public int phoneCheck(@RequestParam("phone") String phone) {				
		int cnt = memberService.ckeckPhone(phone);
		return cnt;		
	}

}
