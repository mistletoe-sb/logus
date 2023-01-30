package com.logus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.logus.dailycheck.model.DailycheckVO;
import com.logus.dailycheck.service.IDailycheckService;
import com.logus.dailyroutine.model.DailyroutineVO;
import com.logus.dailyroutine.service.IDailyroutineService;

@Controller
public class RoutineController {
	@Autowired
	private IDailyroutineService DailyroutineService;	
	@Autowired
	private IDailycheckService DailycheckService;
	
	private String view_ref ="routine/";	//뷰 위치
	
	//RequestMapping 대신 Get/Post Mapping 사용
	//select 등 페이지에 보여줄 때는 GET
	//입력폼에서 받아서 뭘 할 때는 POST <form action="/routinelist" method="post">
	
	//루틴 리스트에도 매핑 부분에 session 넣어야 함
	@GetMapping(value="/routinelist")	//루틴 목록-화면용
	public String selectDailyroutineList(@PathVariable(value="membernickname", required=false) String memberNickname, Model model) {
		
		memberNickname="회원닉네임테스트01";
		
		List<DailyroutineVO> routinelist= DailyroutineService.selectDailyroutineList(memberNickname);
		System.out.println(routinelist);
		model.addAttribute("routinelist", routinelist);
		return view_ref+"routinelist";	
	}
	//href="" post get 
	@GetMapping(value="/routine/{dailyroutineCode}")	//루틴 내용-화면용
	public String selectDailyroutineInfo(@PathVariable(value="dailyroutineCode", required=false) int dailyroutineCode, Model model) {
		
		DailyroutineVO routine= DailyroutineService.selectDailyroutineInfo(dailyroutineCode);	//루틴 정보
		List<DailycheckVO> checklist =DailycheckService.selectDailycheckList(dailyroutineCode);
		
		System.out.println(routine);
		System.out.println(checklist);
		model.addAttribute("routine", routine);
		model.addAttribute("checklist", checklist);
		
		return view_ref+"routine";
	}
	
	@GetMapping(value="/newroutine")	//새 루틴 추가-화면용
	public String insertDailyroutine() {
		
		return view_ref+"newroutine";
	}
	
	@PostMapping(value="/newroutine")	//새 루틴 추가-전송용
	public String insertDailyroutine2() {
		
		return "redirect:/routine/newroutine";
	}
	
	@GetMapping(value="/routinefix")	//루틴 수정-삭제-화면용
	public String updateDailyroutine() {
		
		return view_ref+"routinefix";
	}
	
	@PostMapping(value="/routinefix")	//루틴 수정-삭제-전송용(수정, 삭제 동시에)
	public String updateDailyroutine2() {
		
		return "redirect:/routine/routinelist";
	}
}
