package com.logus.controller;

import java.util.ArrayList;
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
import com.logus.routineshare.service.IRoutineshareService;
import com.logus.tag.model.TagVO;
import com.logus.tag.service.ITagService;
import com.logus.util.constant.TagCategory;

@Controller
public class RoutineController {
	@Autowired
	private IDailyroutineService DailyroutineService;	// 일정 객체
	@Autowired
	private IDailycheckService DailycheckService;		// 일정 상세 객체
	@Autowired
	private ITagService tagService;						// 태그 서비스 객체
	@Autowired
	private IRoutineshareService routineshareService;	//루틴 공유수 객체
	
	private String view_ref ="routine/";	//뷰 위치
	
	DailyroutineVO dailyroutineVO = new DailyroutineVO();	//루틴 정보 VO 객체 생성
	
	DailycheckVO dailycheckVO = new DailycheckVO();			//루틴 상세 VO 객체 생성
	
	TagVO tagVO = new TagVO();
	
	//RequestMapping 대신 Get/Post Mapping 사용
	//select 등 페이지에 보여줄 때는 GET
	//입력폼에서 받아서 뭘 할 때는 POST <form action="/routinelist" method="post">
	
	//루틴 리스트에도 매핑 부분에 session 넣어야 함->session 받으면 필요 없음 path~
	@GetMapping(value="/routinelist")	//루틴 목록-화면용
	public String selectDailyroutineList(HttpSession session, Model model) {
		String memberNickname= (String) session.getAttribute("memberNickname");
				
		List<DailyroutineVO> routinelist1 = null;	//평일 리스트
		List<DailyroutineVO> routinelist2 = null;	//주말 리스트
		
		try {
			routinelist1= DailyroutineService.selectDailyroutineList(memberNickname, 1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			routinelist2= DailyroutineService.selectDailyroutineList(memberNickname, 2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		model.addAttribute("routinelist1", routinelist1);
		model.addAttribute("routinelist2", routinelist2);
		return view_ref+"routinelist";	
	}

	@GetMapping(value="/routine/{dailyroutineCode}")	//루틴 내용-화면용
	public String selectDailyroutineInfo(@PathVariable(value="dailyroutineCode", required=false) int dailyroutineCode, Model model) {
		
		DailyroutineVO routine= DailyroutineService.selectDailyroutineInfo(dailyroutineCode);	//루틴 정보
		List<DailycheckVO> checklist =DailycheckService.selectDailycheckList(dailyroutineCode);	//루틴 상세 정보
		
		List<TagVO>	taglist = tagService.selectTagList(TagCategory.DAILY_ROUTINE, dailyroutineCode);
	
		String weekopt;
		
		//dailyroutine weekopt 1 =>평일 , 2 => 주말
				if(routine.getDailyroutineWeekopt()==1) {
					weekopt="평일";
					
				} else {
					weekopt="주말";
				}
		
		model.addAttribute("routine", routine);
		model.addAttribute("checklist", checklist);
		model.addAttribute("taglist", taglist);
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
			@RequestParam("content") String[] content, @RequestParam("tagNames") String tagNames) {
			
		int weekNum;	//평일&주말 검증
		if(week.equals("평일")) {
			weekNum=1;	//평일
		} else {
			weekNum=2;	//주말
		}
		
		int activeNum;	//일반&메인 루틴 검증
		if(active.equals("일반 일정으로 등록")) {
			 activeNum=0;	//일반 루틴
		} else{
			activeNum=1;	//메인 루틴
		};
		
		String memberNickname=(String) session.getAttribute("memberNickname");
		
		if(weekNum==1 && activeNum==1) {	//생성한 일정이 평일이며, 메인 루틴일 때
			DailyroutineService.updateRoutineActive(memberNickname, weekNum);
		} else if(weekNum==2 && activeNum==1) {
			DailyroutineService.updateRoutineActive(memberNickname, weekNum);
		}
	
		//루틴 VO 객체 set
		dailyroutineVO.setMemberNickname(memberNickname);	//닉네임
		dailyroutineVO.setDailyroutineActive(activeNum);	//일반or메인 여부
		dailyroutineVO.setDailyroutineWeekopt(weekNum);		//평일or주말 여부
		dailyroutineVO.setDailyroutineTitle(title);			//루틴 타이틀
		
		DailyroutineService.insertDailyroutine(dailyroutineVO);	//루틴 기본 정보 insert
			
		String[] begintime =begin;	//시작 시간
		String[] endtime=end;		//종료 시간
		String[] con=content;		//일정 상세 내용
		
		//루틴 상세 VO 객체 set
		//selectkey를 통해 insert 이후 반환받은 FK dailyroutine_code값 사용
		for(int i=0; i<begintime.length; i++) { 
			dailycheckVO.setDailyroutineCode(dailyroutineVO.getDailyroutineCode());
			dailycheckVO.setDailycheckBegintime(begintime[i]); 
			dailycheckVO.setDailycheckEndtime(endtime[i]);
			dailycheckVO.setDailycheckContent(con[i]);
			
			DailycheckService.insertDailycheck(dailycheckVO);
		}
		
			List<TagVO> taglist= tagService.makeTagList(tagNames, TagCategory.DAILY_ROUTINE, dailyroutineVO.getDailyroutineCode());
			tagService.insertTags(taglist);	//태그 insert
		
		return "redirect:/routinelist";
	}
	
	@GetMapping(value="/routinefix/{dailyroutineCode}")	//루틴 수정-화면용
	public String updateDailyroutine(@PathVariable(value="dailyroutineCode", required=false) int dailyroutineCode, Model model) {
		DailyroutineVO routine= DailyroutineService.selectDailyroutineInfo(dailyroutineCode);	//루틴 정보
		List<DailycheckVO> checklist =DailycheckService.selectDailycheckList(dailyroutineCode);	//루틴 상세 정보
		String weekopt;
		
		//dailyroutine weekopt 1 =>평일 , 2 => 주말
				if(routine.getDailyroutineWeekopt()==1) {
					weekopt="평일";
					
				} else {
					weekopt="주말";
				}
				List<TagVO>	taglist=null;
				
				try {
					taglist = tagService.selectTagList(TagCategory.DAILY_ROUTINE, dailyroutineCode);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				String tags = tagService.makeTagString(taglist);
				
		model.addAttribute("routine", routine);
		model.addAttribute("checklist", checklist);
		model.addAttribute("tags", tags);
		model.addAttribute("taglist", taglist);
		model.addAttribute("weekopt", weekopt);
		model.addAttribute("dailyroutineCode", dailyroutineCode);
		
		return view_ref+"routinefix";
	}
	
	@PostMapping(value="/routinefix")	//루틴 수정-전송용
	public String updateDailyroutine2(HttpSession session, @RequestParam("active") String active, @RequestParam("week") String week, 
			@RequestParam("title") String title,  @RequestParam("begin") String[] begin, @RequestParam("end") String[] end, 
			@RequestParam("content") String[] content, @RequestParam("dailyroutineCode") int dailyroutineCode, 
			@RequestParam("dailycheckCode") int[] dailycheckCode,  @RequestParam(value="tagNames", required=false) String tagNames , 
			@RequestParam(value="tagCodes", required=false) List<Integer> tagCodes) {
			
		int checklength=content.length;	//실제 들어온 일정 수 : content[]
		int	updatelength=dailycheckCode.length;	//DB 업데이트 필요한 일정 수 : dailycheckCode[]  

				//순서 1. 삭제된 기존 일정(업데이트가 필요없는 행)을 찾아서 delete
				List<DailycheckVO> deletecheck = new ArrayList<DailycheckVO>();	//VO 타입 리스트 생성
				for(int d = 0; d<updatelength; d++) {
					System.out.println("들어온 컨트롤러 체크코드"+dailycheckCode[d]);
					DailycheckVO dailycheckvo =new DailycheckVO();
					dailycheckvo.setDailycheckCode(dailycheckCode[d]);
					deletecheck.add(dailycheckvo);
				}
				DailycheckService.deleteDailycheck(deletecheck, dailyroutineCode);	//들어온 checkcode에 포함되지 않은, 기존 DB 행 삭제  
				
				//순서 2. 루틴 상세 VO 객체 set | 루틴 상세 update&insert
				for(int i = 0 ; i<checklength; i++) {
				
					dailycheckVO.setDailyroutineCode(dailyroutineCode);	//업데이트 필요한 루틴 코드
					dailycheckVO.setDailycheckBegintime(begin[i]); 		//시작 시간
					dailycheckVO.setDailycheckEndtime(end[i]);			//종료 시간
					dailycheckVO.setDailycheckContent(content[i]);		//루틴 상세 내용
					
						if(i<updatelength) {
							dailycheckVO.setDailycheckCode(dailycheckCode[i]);
							DailycheckService.updateDailycheck(dailycheckVO);
							
						}	else {
							DailycheckService.insertDailycheck(dailycheckVO);
						}
				}
			
		//순서 3. 일정 정보 업데이트 전 검증
		int weekNum;	//평일&주말 검증
		if(week.equals("평일")) {
			weekNum=1;	//평일
		} else {
			weekNum=2;	//주말
		}
		
		int activeNum;	//일반&메인 루틴 검증
		if(active.equals("일반 일정")) {
			 activeNum=0;	//일반 루틴
		} else{
			activeNum=1;	//메인 루틴
		};
		
		String memberNickname=(String) session.getAttribute("memberNickname"); 
		
		if(weekNum==1 && activeNum==1) {	//생성한 일정이 평일이며, 메인 루틴일 때
			DailyroutineService.updateRoutineActive(memberNickname, weekNum);
		} else if(weekNum==2 && activeNum==1) {
			DailyroutineService.updateRoutineActive(memberNickname, weekNum);
		}	
		
		//순서 4. 루틴 VO 객체 set =>루틴 정보 update
		dailyroutineVO.setDailyroutineCode(dailyroutineCode);//루틴 코드
		dailyroutineVO.setMemberNickname(memberNickname);	//닉네임
		dailyroutineVO.setDailyroutineActive(activeNum);	//일반or메인 여부
		dailyroutineVO.setDailyroutineWeekopt(weekNum);		//평일or주말 여부
		dailyroutineVO.setDailyroutineTitle(title);			//루틴 타이틀
		
		List<TagVO>	taglist=null;
		try {
			taglist = tagService.makeTagList(tagNames, TagCategory.DAILY_ROUTINE, dailyroutineCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		try {
			tagService.updateTags(taglist ,tagCodes);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		DailyroutineService.updateDailyroutine(dailyroutineVO);
		
		return "redirect:/routinelist";
	}
	
	//post매핑 시 에러, 정상적으로 @PathVariable로 값을 가져옴 delete 메서드만 실행하면 됨
	@GetMapping(value="/routinedelete/{dailyroutineCode}")	//루틴 수정-삭제-전송용(수정, 삭제 동시에)
	public String deleteDailyroutine(@PathVariable(value="dailyroutineCode", required=false) int dailyroutineCode) {
		
		DailycheckService.deleteDailycheckAll(dailyroutineCode);
		tagService.deleteAllTagInPost(TagCategory.DAILY_ROUTINE, dailyroutineCode, 0);
		routineshareService.deleteRoutineshare(dailyroutineCode);
		DailyroutineService.deleteDailyroutine(dailyroutineCode);
		
		return "redirect:/routinelist";
	}
}
