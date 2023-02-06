package com.logus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import com.logus.dailystory.model.DailystoryVO;
import com.logus.member.model.MemberVO;
import com.logus.member.service.IMemberService;
import com.logus.routineshare.model.RoutineshareVO;
import com.logus.routineshare.service.IRoutineshareService;
import com.logus.tag.model.TagVO;
import com.logus.tag.service.ITagService;
import com.logus.util.constant.TagCategory;
import com.logus.util.redirectencoder.RedirEncoder;


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
	@Autowired
	private IRoutineshareService routineshareService;	//루틴 공유 정보 객체
	@Autowired
	private ITagService tagService;						// 태그 서비스 객체
	
	private String view_ref ="library/";	//뷰 위치
	
	DailyroutineVO dailyroutineVO = new DailyroutineVO();	//루틴 정보 VO 객체 생성
	
	DailycheckVO dailycheckVO = new DailycheckVO();			//루틴 상세 VO 객체 생성
	
	AchieveVO achieveVO = new AchieveVO();					//루틴 달성율 VO 객체 생성
	
	MemberVO memberVO = new MemberVO();						//멤버 VO 객체 생성
	
	RoutineshareVO routineshareVO = new RoutineshareVO();	//공유 VO 객체 생성
	
	TagVO tagVO = new TagVO();
		
	//내 서재용은 세션만 받고, 남 서재용은 Pathvariable로 받아서 매핑 구분하면 되겠음->@GetMapping(value="/library/{memberNickname}")
	@GetMapping(value="/library")	//내 서재 내용-화면용
	public String selectLibrary(HttpSession session, Model model) {
		
		String memberNickname=(String) session.getAttribute("memberNickname");		//session받기
		
		DailyroutineVO routine1 = null; 
		DailyroutineVO routine2 = null; 
		List<TagVO> tag1 = null;
		List<TagVO> tag2 = null;
		
		try {
			routine1 = DailyroutineService.selectDailyroutineActive(memberNickname, 1);	//평일 메인 루틴
			tag1 = tagService.selectTagList(TagCategory.DAILY_ROUTINE, routine1.getDailyroutineCode());	//평일 메인 태그
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		try {
			routine2 = DailyroutineService.selectDailyroutineActive(memberNickname, 2);	//주말 메인 루틴
			tag2 = tagService.selectTagList(TagCategory.DAILY_ROUTINE, routine2.getDailyroutineCode());	//주말 메인 태그
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("routine1", routine1);
		model.addAttribute("routine2", routine2);
		
		model.addAttribute("tag1", tag1);	
		model.addAttribute("tag2", tag2);
		
		List<DailycheckVO> checklist1 = null;
		List<DailycheckVO> checklist2 = null;
		try {	
			checklist1 = DailycheckService.selectDailycheckList(routine1.getDailyroutineCode());	//루틴 상세 정보(평일)
		} catch (Exception e) {
			e.printStackTrace();
		}	
		try {	
			checklist2 = DailycheckService.selectDailycheckList(routine2.getDailyroutineCode());	//루틴 상세 정보(주말)
		}	catch (Exception e) {e.printStackTrace();
		}
		
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
		model.addAttribute("sessionUser", memberNickname);
		
		return view_ref+"library";
	}
	
	//내 서재용은 세션만 받고, 남 서재용은 Pathvariable로 받아서 매핑 구분하면 되겠음->@GetMapping(value="/library/{memberNickname}")
		@GetMapping(value="/library/{memberNickname}")	//남서재 내용-화면용
		public String selectUserLibrary(@PathVariable(value="memberNickname") String memberNickname, HttpSession session, Model model) {
			
			String sessionUser= (String) session.getAttribute("memberNickname");	//jsp <c:if>를 위한 세션 전달용
			
			DailyroutineVO routine1 = null; 
			DailyroutineVO routine2 = null; 
			
			try {
				routine1 = DailyroutineService.selectDailyroutineActive(memberNickname, 1);	//평일 메인 루틴
			} catch (Exception e) {
				e.printStackTrace();
			}	
			
			try {
				routine2 = DailyroutineService.selectDailyroutineActive(memberNickname, 2);	//주말 메인 루틴
			} catch (Exception e) {
				e.printStackTrace();
			}
				
			model.addAttribute("routine1", routine1);
			model.addAttribute("routine2", routine2);
			
			List<DailycheckVO> checklist1 = null;
			List<DailycheckVO> checklist2 = null;
			try {	
				checklist1 = DailycheckService.selectDailycheckList(routine1.getDailyroutineCode());	//루틴 상세 정보
			} catch (Exception e) {
				e.printStackTrace();
			}	
			try {	
				checklist2 = DailycheckService.selectDailycheckList(routine2.getDailyroutineCode());	//루틴 상세 정보
			}	catch (Exception e) {e.printStackTrace();
			}
			
			
			model.addAttribute("checklist1", checklist1);
			model.addAttribute("checklist2", checklist2);
			
			int todayAchieve =0; 
			try {	
				todayAchieve = achieveService.selectAchieveToday(memberNickname);
			} catch (Exception e) {
			
			}	
			
			int weekAchieve	=0; 
			try {	
				weekAchieve = achieveService.selectAchieveWeek(memberNickname);
			} catch (Exception e) {
		
			}	
			
			model.addAttribute("todayAchieve", todayAchieve);
			model.addAttribute("weekAchieve", weekAchieve);
			
			memberVO = MemberService.selectMemberInfo2(memberNickname);			
			model.addAttribute("memberVO", memberVO);
			model.addAttribute("sessionUser", sessionUser);
			
			return view_ref+"library";
		}
	
		@PostMapping(value="/routineshare")	//공유받기1 버튼-전송용
		public String routineshare1(HttpSession session, @RequestParam("dailyroutineCode") int dailyroutineCode, 
				@RequestParam("memberNickname") String memberNickname) {
			
			String sessionUserId= (String) session.getAttribute("memberId");
			String sessionUserNickname = (String) session.getAttribute("memberNickname");
			
			int result = routineshareService.selectRoutineshare(sessionUserId, dailyroutineCode);
	
			if(result==0) {	// 0 : 처음 공유받는 경우
				routineshareVO.setDailyroutineCode(dailyroutineCode);	//해당 루틴의 코드
				routineshareVO.setMemberId(sessionUserId);				//해당 루틴을 공유받은 유저의 세션 아이디
				routineshareService.insertRoutineshare(routineshareVO);	//공유 정보 저장
				DailyroutineService.updateRoutineShared(dailyroutineCode);	//공유된 루틴의 공유 수 증가
			}
			
			dailyroutineVO = DailyroutineService.selectDailyroutineInfo(dailyroutineCode);
			dailyroutineVO.setMemberNickname(sessionUserNickname);	//닉네임을 현재 세션 유저로 변경
			dailyroutineVO.setDailyroutineActive(0);
			
			DailyroutineService.insertDailyroutine(dailyroutineVO);
			
			List<DailycheckVO> checklist = DailycheckService.selectDailycheckList(dailyroutineCode);
			
			dailycheckVO.setDailyroutineCode(dailyroutineVO.getDailyroutineCode());
			for(int i=0; i<checklist.size();i++) {
				String beginTime=checklist.get(i).getDailycheckBegintime();
				String endTime=checklist.get(i).getDailycheckEndtime();
				String content=checklist.get(i).getDailycheckContent();
				
				dailycheckVO.setDailyroutineCode(dailyroutineVO.getDailyroutineCode());
				dailycheckVO.setDailycheckBegintime(beginTime);
				dailycheckVO.setDailycheckEndtime(endTime);
				dailycheckVO.setDailycheckContent(content);
				DailycheckService.insertDailycheck(dailycheckVO);
			}
			
			return "redirect:/"+"library/"+RedirEncoder.encode(memberNickname);
		}
		
		@PostMapping(value="/routineshare2")	//공유받기2 버튼-전송용
		public String routineshare2(HttpSession session, @RequestParam("dailyroutineCode2") int dailyroutineCode, 
				@RequestParam("memberNickname2") String memberNickname) {
			
			String sessionUserId= (String) session.getAttribute("memberId");
			String sessionUserNickname = (String) session.getAttribute("memberNickname");
			
			int result = routineshareService.selectRoutineshare(sessionUserId, dailyroutineCode);
	
			if(result==0) {	// 0 : 처음 공유받는 경우
				routineshareVO.setDailyroutineCode(dailyroutineCode);	//해당 루틴의 코드
				routineshareVO.setMemberId(sessionUserId);				//해당 루틴을 공유받은 유저의 세션 아이디
				routineshareService.insertRoutineshare(routineshareVO);	//공유 정보 저장
				DailyroutineService.updateRoutineShared(dailyroutineCode);	//공유된 루틴의 공유 수 증가
			}
			
			dailyroutineVO = DailyroutineService.selectDailyroutineInfo(dailyroutineCode);
			dailyroutineVO.setMemberNickname(sessionUserNickname);	//닉네임을 현재 세션 유저로 변경
			dailyroutineVO.setDailyroutineActive(0);
			
			DailyroutineService.insertDailyroutine(dailyroutineVO);
			
			List<DailycheckVO> checklist = DailycheckService.selectDailycheckList(dailyroutineCode);
			
			dailycheckVO.setDailyroutineCode(dailyroutineVO.getDailyroutineCode());
			for(int i=0; i<checklist.size();i++) {
				String beginTime=checklist.get(i).getDailycheckBegintime();
				String endTime=checklist.get(i).getDailycheckEndtime();
				String content=checklist.get(i).getDailycheckContent();
				
				dailycheckVO.setDailyroutineCode(dailyroutineVO.getDailyroutineCode());
				dailycheckVO.setDailycheckBegintime(beginTime);
				dailycheckVO.setDailycheckEndtime(endTime);
				dailycheckVO.setDailycheckContent(content);
				DailycheckService.insertDailycheck(dailycheckVO);
			}
			return "redirect:/"+"library/"+RedirEncoder.encode(memberNickname);
		}
		
		@PostMapping(value="/search")	//검색-전송용
		public String selectSearch(@RequestParam("option") String option, @RequestParam("search") String search, Model model) {
			
			System.out.println(option);
			System.out.println(search);
			
			List<DailyroutineVO> searchroutine=null;
			List<Integer> codeList = new ArrayList<Integer>();
			Map<Integer, List<TagVO>> tagList = null;
			
			try {	
				searchroutine = DailyroutineService.findDailyroutineList(option, search);
				for(DailyroutineVO vo : searchroutine) {
					codeList.add(vo.getDailyroutineCode());
				}
				tagList = tagService.makeTagListMap(TagCategory.DAILY_ROUTINE, codeList);
			} catch (Exception e) {
				e.printStackTrace();
			}	
			
			model.addAttribute("searchroutine", searchroutine);
			model.addAttribute("tagList", tagList);
			return view_ref+"search";
		}
		
		@GetMapping(value="/search")	//그냥 search 주소로 검색해서 왔을 경우(get 요청) web.xml http 405 error 페이지를 쓸지, 그냥 다른 페이지를 쓸지?
		public String selectSearch1() {
			return view_ref+"search";
		}
		
		
}
