package com.logus.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.logus.follow.model.FollowVO;
import com.logus.follow.service.IFollowService;

//팔로우 서비스 제어하는 컨트롤러 클래스
@Controller
public class FollowController {
	
	@Autowired
	IFollowService followService;		//팔로우 서비스 객체
	private String view_pos = "member/";
	
	private static Logger logger = LoggerFactory.getLogger(DailystoryController.class);	// logger 객체
	
	@RequestMapping(value="/followList", method=RequestMethod.GET )		//jsp에서 버튼을 눌럿을때 연결해주는 주소 
	public String followList(HttpSession session, Model model) {		//세션에 있는 팔로우 리스트를 
		String memberId = session.getAttribute("memberId").toString();		//팔로우서비스 안에 셀렉트팔로우리스트를 memberid에 저장 
		List<FollowVO> followList = followService.selectFollowList(memberId);
		System.out.println(followList.size());		//팔로우 리스트를 출력하라(출력 테스트용)
		model.addAttribute("followList", followList);		//팔로우리스트를 "팔로우리스트"라고 이름 지정 addAttribute 를 사용하면 jsp에서 사용할 수 있음
		return view_pos +  "followForm";		//팔로우폼으로 이동하라
	}
	

	@GetMapping(value="/followinsert2")		//jsp에서 버튼을 눌렀을때 연결해주는 주소 
	//팔로우 추가 작성
	public String followInsert2(HttpSession session, Model model) {
		System.out.println("버튼 컨트롤러 실행됨");
		//String memberId = session.getAttribute("memberId").toString();
		//insert
		
		followService.insertFollow(null);
		return view_pos +  "followForm";		
	}

	@PostMapping(value="/followinsert")		//jsp에서 버튼을 눌렀을때 연결해주는 주소 
	//팔로우 추가 작성
	public String followInsert(HttpSession session, Model model, @RequestParam("followingMemberId") String followingMemberId) {
		
		String memberId = session.getAttribute("memberId").toString();
		System.out.println(memberId);
		System.out.println(followingMemberId);
		System.out.println("버튼 컨트롤러 실행됨");

//---------------------------------------------------------------------------------------
		
		//followCode code = new followCode();
		//memberId memberid = new memberid();
		//followingMemberId following = new followingMemberId();
		
		FollowVO vo = new FollowVO();
		vo.setMemberId(memberId);
		vo.setFollowingMemberId(followingMemberId);
		
		followService.insertFollow(vo);
		
		
		return view_pos +  "followForm";		
	}
}
