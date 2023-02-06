package com.logus.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.logus.achieve.model.AchieveVO;
import com.logus.achieve.service.IAchieveService;
import com.logus.dailycheck.model.DailycheckVO;
import com.logus.dailycheck.service.IDailycheckService;
import com.logus.dailyroutine.model.DailyroutineVO;
import com.logus.dailyroutine.service.IDailyroutineService;

@Controller
public class AchieveController {
	@Autowired
	private IDailyroutineService DailyroutineService;	
	@Autowired
	private IDailycheckService DailycheckService;
	@Autowired
	private IAchieveService achieveService;
	
	private String view_ref ="achieve/";	//뷰 위치
	
	DailyroutineVO dailyroutineVO = new DailyroutineVO();	//루틴 정보 VO 객체 생성
	
	DailycheckVO dailycheckVO = new DailycheckVO();			//루틴 상세 VO 객체 생성
	
	AchieveVO achieveVO = new AchieveVO();
	
	@GetMapping(value="/achieve")	//출석체크-화면용
	public String selectAchieve(HttpSession session, Model model) {
		
		String memberNickname=(String) session.getAttribute("memberNickname");		//session받기
		String today = null;
		
		try {	
			today = achieveService.getDateDayName();	//오늘 날짜 반환 (월, 화~)
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		System.out.println(today);
		
		DailyroutineVO routine = null;
		
		if(today.equals("월") || today.equals("화") ||today.equals("수") || today.equals("목") || today.equals("금")) { 
				try {
					routine = DailyroutineService.selectDailyroutineActive(memberNickname, 1);	//평일 메인 루틴
			} catch (Exception e) {
					e.printStackTrace();
			}
		} else {
				try {
					routine = DailyroutineService.selectDailyroutineActive(memberNickname, 2);	//주말 메인 루틴
			} catch (Exception e) {
					e.printStackTrace();
			}
		}
		
		List<DailycheckVO> checklist = null;
		
		try {
			checklist = DailycheckService.selectDailycheckList(routine.getDailyroutineCode());	//루틴 상세 정보
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("routine", routine);
		model.addAttribute("checklist", checklist);
		
		return view_ref+"achieve";	
	}
	
	@PostMapping(value="/achieve/save")	//출석 체크-전송용
	public String insertAchieve(HttpSession session, Model model, @RequestParam("achieverate") String[] achieverate, @RequestParam("today") String today) {
	
		String memberNickname=(String) session.getAttribute("memberNickname");
		
		int rate=0;
		int num=0;
		for(int i=0; i<achieverate.length; i++) {
			num += Integer.parseInt(achieverate[i]);
		}
		rate = num/achieverate.length;	
		
		System.out.println(rate+"% 입니다");
		
		achieveVO.setMemberNickname(memberNickname);
		achieveVO.setAchieveRate(rate);
		achieveVO.setAchieveDate(today);
		
		achieveService.insertAchieve(achieveVO);
		
		return "redirect:/library";
	}
	
	@PostMapping(value="/achieve/check")	//금일 출석 여부 확인용
	@ResponseBody
	public int checkAchieve(HttpSession session, @RequestParam("today") String today) {
		String memberNickname=(String) session.getAttribute("memberNickname");	
		int result = achieveService.selectAchieve(memberNickname, today);	//1 반환 시 이미 출석 완료, 0 반환시 출석 진행
		System.out.println(result+"입니다");
		return result;
	};
	
}
