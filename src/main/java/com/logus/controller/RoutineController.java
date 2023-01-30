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
		
		List<DailyroutineVO> routinelist1= DailyroutineService.selectDailyroutineList(memberNickname, 1);	//평일 리스트
		List<DailyroutineVO> routinelist2= DailyroutineService.selectDailyroutineList(memberNickname, 2);	//주말 리스트
		
		model.addAttribute("routinelist1", routinelist1);
		model.addAttribute("routinelist2", routinelist2);
		return view_ref+"routinelist";	
	}
	//href="" post get 
	@GetMapping(value="/routine/{dailyroutineCode}")	//루틴 내용-화면용
	public String selectDailyroutineInfo(@PathVariable(value="dailyroutineCode", required=false) int dailyroutineCode, Model model) {
		
		DailyroutineVO routine= DailyroutineService.selectDailyroutineInfo(dailyroutineCode);	//루틴 정보
		List<DailycheckVO> checklist =DailycheckService.selectDailycheckList(dailyroutineCode);
		String weekopt;
		
		//dailyroutine weekopt 1 =>평일 , 2 => 주말
				if(routine.getDailyroutineWeekopt()==1) {
					weekopt="평일";
					
				} else {
					weekopt="주말";
				}
		
		model.addAttribute("routine", routine);
		model.addAttribute("checklist", checklist);
		model.addAttribute("weekopt", weekopt);
		
		
		return view_ref+"routine";
	}
	
	@GetMapping(value="/newroutine")	//새 루틴 추가-화면용
	public String insertDailyroutine() {
		return view_ref+"newroutine";
	}
	
	@PostMapping(value="/newroutine")	//새 루틴 추가-전송용
	public String insertDailyroutine2(HttpSession session, @RequestParam("active") String active, @RequestParam("week") String week, 
			@RequestParam("title") String title,  @RequestParam("begin") String[] begin, @RequestParam("end") String[] end, 
			@RequestParam("content") String[] content) {
		
		int activeNum;	//일반&메인 루틴 검증
		if(active.equals("일반 일정으로 등록")) {
			 activeNum=0;	//일반 루틴
		} else{
			activeNum=1;	//메인 루틴
		};
		System.out.println(activeNum);
		
		int weekNum;	//평일&주말 검증
		if(week.equals("평일")) {
			weekNum=1;	//평일
		} else {
			weekNum=2;	//주말
		}
		
		String memberNickname="회원닉네임테스트01";	//이후 session으로 대체
		
		String[] begintime =begin;
		String[] endtime=end;
		String[] con=content;
		
		//루틴 VO 객체 생성
		DailyroutineVO dailyroutineVO = new DailyroutineVO();
		dailyroutineVO.setMemberNickname(memberNickname);	//닉네임
		dailyroutineVO.setDailyroutineActive(activeNum);	//일반or메인 여부
		dailyroutineVO.setDailyroutineWeekopt(weekNum);		//평일or주말 여부
		dailyroutineVO.setDailyroutineTitle(title);			//루틴 타이틀
		
		
		DailyroutineService.insertDailyroutine(dailyroutineVO); //아마 해당 메서드를 setroutinecode에 넣을듯  
		//루틴 상세 VO 객체 생성
		DailycheckVO dailycheckVO = new DailycheckVO();
		dailycheckVO.setDailyroutineCode(weekNum);
		for(int i=0; i<begintime.length; i++) {
		
		dailycheckVO.setDailycheckBegintime(begintime[i]); 
		dailycheckVO.setDailycheckEndtime(endtime[i]);
		dailycheckVO.setDailycheckContent(con[i]);
		}
		
		

		
		//DailycheckService.insertDailycheck(null);
		
		return "redirect:/routinelist";
	}
	
	@GetMapping(value="/routinefix")	//루틴 수정-삭제-화면용
	public String updateDailyroutine() {
		
		return view_ref+"routinefix";
	}
	
	@PostMapping(value="/routinefix")	//루틴 수정-삭제-전송용(수정, 삭제 동시에)
	public String updateDailyroutine2() {
		
		return "redirect:/routinelist";
	}
}
