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
	private IAchieveService achieveService;
	
	private String view_ref ="library/";	//뷰 위치
	
	DailyroutineVO dailyroutineVO = new DailyroutineVO();	//루틴 정보 VO 객체 생성
	
	DailycheckVO dailycheckVO = new DailycheckVO();			//루틴 상세 VO 객체 생성
	
	AchieveVO achieveVO = new AchieveVO();					//루틴 달성율 VO 객체 생성
	
	MemberVO memberVO = new MemberVO();						//멤버 VO 객체 생성
	
	//내 서재용은 세션만 받고, 남 서재용은 Pathvariable로 받아서 매핑 구분하면 되겠음->@GetMapping(value="/library/{memberNickname}")
	@GetMapping(value="/library")	//서재 내용-화면용
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
		
		//닉네임으로 찾아야 되는데 매퍼에 조건 닉네임 대신에 id로 잡아둬서 오류남->새로 만들거나 수정해야 되는데, 매퍼 수정중이라길래 충돌 우려해서 일단 제외
		
		return view_ref+"library";
	}
}
