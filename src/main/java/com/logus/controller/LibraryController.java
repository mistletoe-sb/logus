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

import com.logus.achieve.model.AchieveVO;
import com.logus.achieve.service.IAchieveService;
import com.logus.dailycheck.model.DailycheckVO;
import com.logus.dailycheck.service.IDailycheckService;
import com.logus.dailyroutine.model.DailyroutineVO;
import com.logus.dailyroutine.service.IDailyroutineService;
import com.logus.member.model.MemberVO;
import com.logus.member.service.IMemberService;


@Controller
public class LibraryController {
	@Autowired
	private IDailyroutineService DailyroutineService;	//루틴 정보
	@Autowired
	private IDailycheckService DailycheckService;		//루틴 상세 정보
	@Autowired	
	private IMemberService	MemberService;	//멤버 정보
	@Autowired
	private IAchieveService achieveService;	//달성율 정보
	
	private String view_ref ="library/";	//뷰 위치
	
	DailyroutineVO dailyroutineVO = new DailyroutineVO();	//루틴 정보 VO 객체 생성
	
	DailycheckVO dailycheckVO = new DailycheckVO();			//루틴 상세 VO 객체 생성
	
	AchieveVO achieveVO = new AchieveVO();					//루틴 달성율 VO 객체 생성
	
	MemberVO memberVO = new MemberVO();						//멤버 VO 객체 생성
	
	//내 서재용은 세션만 받고, 남 서재용은 Pathvariable로 받아서 매핑 구분하면 되겠음->@GetMapping(value="/library/{memberNickname}")
	@GetMapping(value="/library")	//내 서재 내용-화면용
	public String selectLibrary(HttpSession session, Model model) {
		
		String memberNickname=(String) session.getAttribute("memberNickname");		//session받기
		
		DailyroutineVO routine1 = DailyroutineService.selectDailyroutineActive(memberNickname, 1);	//평일 메인 루틴
		DailyroutineVO routine2 = DailyroutineService.selectDailyroutineActive(memberNickname, 2);	//주말 메인 루틴
		
		model.addAttribute("routine1", routine1);
		model.addAttribute("routine2", routine2);
		
		List<DailycheckVO> checklist1 = DailycheckService.selectDailycheckList(routine1.getDailyroutineCode());	//루틴 상세 정보(평일)
		List<DailycheckVO> checklist2 = DailycheckService.selectDailycheckList(routine2.getDailyroutineCode());	//루틴 상세 정보(평일)
		
		model.addAttribute("checklist1", checklist1);
		model.addAttribute("checklist2", checklist2);
		
		int todayAchieve =0; 
		try {	
			todayAchieve = achieveService.selectAchieveToday(memberNickname);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		int weekAchieve	=0; 
		try {	
			weekAchieve = achieveService.selectAchieveWeek(memberNickname);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		model.addAttribute("todayAchieve", todayAchieve);
		model.addAttribute("weekAchieve", weekAchieve);
		
		memberVO = MemberService.selectMemberInfo2(memberNickname);
		model.addAttribute("memberVO", memberVO);
		
		return view_ref+"library";
	}
	
	//내 서재용은 세션만 받고, 남 서재용은 Pathvariable로 받아서 매핑 구분하면 되겠음->@GetMapping(value="/library/{memberNickname}")
		@GetMapping(value="/library/{memberNickname}")	//남서재 내용-화면용
		public String selectUserLibrary(@PathVariable(value="memberNickname") String memberNickname, HttpSession session, Model model) {
			
			String sessionUser= (String) session.getAttribute("memberNickname");	//jsp <c:if>를 위한 세션 전달용
			
			DailyroutineVO routine1 = DailyroutineService.selectDailyroutineActive(memberNickname, 1);	//평일 메인 루틴
			DailyroutineVO routine2 = DailyroutineService.selectDailyroutineActive(memberNickname, 2);	//주말 메인 루틴
			
			model.addAttribute("routine1", routine1);
			model.addAttribute("routine2", routine2);
			
			List<DailycheckVO> checklist1 = DailycheckService.selectDailycheckList(routine1.getDailyroutineCode());	//루틴 상세 정보(평일)
			List<DailycheckVO> checklist2 = DailycheckService.selectDailycheckList(routine2.getDailyroutineCode());	//루틴 상세 정보(평일)
			
			model.addAttribute("checklist1", checklist1);
			model.addAttribute("checklist2", checklist2);
			
			int todayAchieve =0; 
			try {	
				todayAchieve = achieveService.selectAchieveToday(memberNickname);
			} catch (Exception e) {
				e.printStackTrace();
			}	
			
			int weekAchieve	=0; 
			try {	
				weekAchieve = achieveService.selectAchieveWeek(memberNickname);
			} catch (Exception e) {
				e.printStackTrace();
			}	
			
			model.addAttribute("todayAchieve", todayAchieve);
			model.addAttribute("weekAchieve", weekAchieve);
			
			memberVO = MemberService.selectMemberInfo2(memberNickname);
			model.addAttribute("memberVO", memberVO);
			model.addAttribute("sessionUser", sessionUser);
			
			return view_ref+"library";
		}
	
		@PostMapping(value="/search")	//새 루틴 추가-화면용
		public String selectSearch() {
			
			
			
			
			
			
			
			return view_ref+"search";
		}
		
		@GetMapping(value="/search")	//그냥 search 주소로 검색해서 왔을 경우(get 요청) web.xml http 405 error 페이지를 쓸지, 그냥 다른 페이지를 쓸지?
		public String selectSearch1() {
			return view_ref+"search";
		}
}
