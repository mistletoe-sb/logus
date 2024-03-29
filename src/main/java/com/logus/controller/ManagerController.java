package com.logus.controller;

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

import com.logus.manager.model.ManagerVO;
import com.logus.manager.service.IManagerService;
import com.logus.member.service.IMemberService;

@Controller
// 작성자 : 배재연
public class ManagerController {
	
	@Autowired
	IManagerService managerService;
	
	@Autowired
	private IMemberService memberService;
	
	@RequestMapping(value="/manager/managerlist")
	public String getAllManagerList(Model model, HttpSession session) {
//		ManagerVO vo = (ManagerVO)session.getAttribute("loginManager");
//		int managerLevel = vo.getManagerLevel();

		if(session.getAttribute("sessionManagerId") != null) {
			String managerId = (String)session.getAttribute("sessionManagerId");
			int managerLevel = managerService.selectManagerInfo(managerId).getManagerLevel();
			if(managerLevel == 0) {
				model.addAttribute("managercount", managerService.countManager());
				model.addAttribute("managerlist", managerService.selectManagerList());
				return "manager/managerlist";
			} else {
				return "manager/accessrestriction_generalmanager";
			}
		} else {
			return "manager/accessrestriction_generalmanager";
		}
	}
	
	@RequestMapping(value="/manager/managerloginform", method=RequestMethod.GET)
	public String getManagerLoginForm(Model model, HttpSession session) {
		if(session.getAttribute("sessionManagerId") == null) {
			return "manager/loginmanagerform";
		} else {
			return "manager/statistics";
		}
	}
	
	//아이디 중복체크
	@PostMapping("/managerIdCheck")
	@ResponseBody
	public int idCheck(@RequestParam("managerId") String managerId) {
		
		int cnt = managerService.countManager(managerId);
		cnt += memberService.ckeckId(managerId);
		return cnt;
		
	}
	
	//닉네임 중복체크
	@PostMapping("/managerNicknameCheck")
	@ResponseBody
	public int nicknameCheck(@RequestParam("managerNickname") String managerNickname) {
		
		int cnt = managerService.countManagerNickname(managerNickname);
		cnt += memberService.ckeckNickname(managerNickname);
		return cnt;
		
	}
	
	@RequestMapping(value="/manager/managerlogin", method=RequestMethod.POST)
	public String loginManager(@RequestParam(value="managerId", required=true) String managerId, @RequestParam(value="managerPassword", required=true) String managerPassword, Model model, RedirectAttributes redirectAttributes, HttpSession session) {

		System.out.println("로그인한 관리자아이디 출력: " + managerId);
		System.out.println("로그인한 관리자암호 출력: " + managerPassword);

		// 출력할 메세지 저장할 변수
		// String message = "";
		
		try {
			// 로그인 폼에서 입력한 관리자ID에 해당하는 관리자 정보 받아옴.
			ManagerVO vo = managerService.selectManagerInfo(managerId);
		
			if(vo == null) {	// 입력한 관리자ID가 DB에 존재하지 않는 경우.
				// (확인용) 존재하는 정보가 없을 경우 메시지 출력
				redirectAttributes.addFlashAttribute("message", "존재하지 않는 관리자입니다.");
				System.out.println("존재하지 않는 관리자입니다." + managerId);
				return "redirect:/manager/managerloginform";
			} else if (!managerPassword.equals(vo.getManagerPassword())) {	// 관리자ID는 DB에 존재하지만 비밀번호가 불일치할 경우
				// (확인용) 비밀번호 불일치할 경우 메시지 출력
				redirectAttributes.addFlashAttribute("message", "비밀번호가 맞지 않습니다.");
				System.out.println("비밀번호가 맞지 않습니다." + managerPassword + vo.getManagerPassword());
				return "redirect:/manager/managerloginform";
			} else {	// 관리자ID, 암호 모두 인증 성공한 경우
				redirectAttributes.addFlashAttribute("message", "로그인에 성공했습니다.");
				System.out.println("로그인에 성공했습니다." + managerId);
				
				// 로그인 인증 처리된 관리자 정보는 다른 사이트에 갔다 돌아와도 다시 로그인하지 안하도 되도록 세션에 등록
//				session.setAttribute("loginManager", vo); // 세션에 관리자 정보 저장
				session.setAttribute("sessionManagerId", vo.getManagerId());	// 세션에 관리자 ID 저장
				session.setAttribute("sessionManagerNickname", vo.getManagerNickname()); // 세션에 관리자 nickname 저장
				session.setAttribute("sessionManagerLevel", vo.getManagerLevel());	// 세션에 관리자 level 저장

				
				return "redirect:/manager/statistics";
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
			return "redirect:/manager/managerloginform";
		}
	}
	
	@RequestMapping(value="/manager/managerlogout")
	public String logoutManager(Model model, RedirectAttributes redirectAttributes, HttpSession session) {
		session.invalidate();
		return "redirect:/manager/managerloginform";
	}
	
	@RequestMapping(value="/manager/insertmanagerform", method=RequestMethod.GET)
	public String insertManagerForm(Model model, HttpSession session) {
		if(session.getAttribute("sessionManagerId") != null) {
			String managerId = (String)session.getAttribute("sessionManagerId");
			int managerLevel = managerService.selectManagerInfo(managerId).getManagerLevel();
			if(managerLevel == 0) {
				return "manager/insertmanagerform";
			} else {
				return "manager/accessrestriction_generalmanager";
			}
		} else {
			return "manager/accessrestriction_generalmanager";
		}
	}
	
	@RequestMapping(value="/manager/insertmanager", method=RequestMethod.POST)
	public String insertManager(ManagerVO vo, RedirectAttributes redirectAttributes) {
		managerService.insertManager(vo);
		return "redirect:/manager/managerlist";
	}
	
	@RequestMapping(value="/manager/deletemanager")
	public String deleteManager(@RequestParam(value="managerId", required=true) String managerId, Model model, RedirectAttributes redirectAttributes) {
		managerService.deleteManager(managerId);
		return "redirect:/manager/managerlist";
	}
	
	@RequestMapping(value="/manager/memberlist")
	public String getAllMemberList(Model model, HttpSession session) {
		if(session.getAttribute("sessionManagerId") != null) {		
			model.addAttribute("inmembercount", managerService.countMember(true));
			model.addAttribute("outmembercount", managerService.countMember(false));
			model.addAttribute("memberlist", managerService.selectMemberList());
			return "manager/userlist";
		} else {
			return "manager/accessrestriction_manager";
		}
	}
}
