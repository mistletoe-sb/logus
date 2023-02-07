package com.logus.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.logus.follow.model.FollowVO;
import com.logus.follow.service.IFollowService;
import com.logus.member.model.MemberVO;
import com.logus.member.service.IMemberService;

//팔로우 서비스 제어하는 컨트롤러 클래스
// : 뷰에 어떻게 보내주고 버튼을 누르던지 어떤 액션이 있을때 어떻게 동작할지 정해줌
@Controller		//컨트롤러 bean으로 등록
public class FollowController {
	
	@Autowired
	private IFollowService followService;		//팔로우 서비스 객체
	@Autowired	
	private IMemberService	memberService;	//멤버 정보
	
	private static final String PATH = "C:\\project_labs\\spring_workspace\\logus\\src\\main\\webapp\\resources\\images\\member";
	
	private String view_pos = "member/";
	
	//private static Logger logger = LoggerFactory.getLogger(DailystoryController.class);	// logger 객체
	
	@RequestMapping(value="/followList", method=RequestMethod.GET )		//url 과 method 매핑->jsp에서 버튼을 눌럿을때 연결해주는 주소 
	//팔로우 목록 반환
	public String followList(HttpSession session, Model model) {		//세션에 있는 팔로우 리스트를 
		String memberId = session.getAttribute("memberId").toString();		//세션에 저장되어있는 회원아이디를 'memberid'에 저장 

		List<FollowVO> followList = null;
		List<MemberVO> followImg = new ArrayList<MemberVO>();

		try {
			followList = followService.selectFollowList(memberId);
			
			for(int i=0; i<followList.size(); i++) {
			MemberVO vo = memberService.selectMemberInfo(followList.get(i).getFollowingMemberId());
			followImg.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("followList", followList);		//팔로우리스트를 "팔로우리스트"라고 이름 지정 addAttribute 를 사용하면 jsp에서 사용할 수 있음
							//"	변수명 "	,    값
		model.addAttribute("filePath", PATH + "\\");
		model.addAttribute("followImg", followImg);
		
		return view_pos +  "followForm";		//return은 main.jsp로 포워드 -> 팔로우폼으로 이동하라
							//출력 페이지로 넘김
	}
	

	@PostMapping(value="/followinsert")		//jsp에서 버튼을 눌렀을때 연결해주는 주소 팔로우 추가 작성 
	public String followInsert(HttpSession session, Model model, @RequestParam("followingMemberId") String followingMemberId, RedirectAttributes redirectAttributes) {
		
		String memberId = session.getAttribute("memberId").toString();
		
		try {
			List<FollowVO> followList= followService.selectFollowList(memberId);
			for(int i=0; i<followList.size(); i++) {
				
				if(followList.get(i).getFollowingMemberId().equals(followingMemberId)) {
					redirectAttributes.addFlashAttribute("message", "이미 팔로우한 사람입니다.");
					return "redirect:/"+ "followList";
				} 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
			FollowVO vo = new FollowVO();
	
			vo.setMemberId(memberId);
			vo.setFollowingMemberId(followingMemberId);
			
			followService.insertFollow(vo);

		redirectAttributes.addFlashAttribute("message", "팔로우에 추가했습니다.");
		
		return "redirect:/"+ "followList";	
	}
	
	@PostMapping(value="/followinsert/check")		//jsp에서 버튼을 눌렀을때 연결해주는 주소 팔로우 추가 작성 
	@ResponseBody
	public int followcheck(@RequestParam("followId") String followId) {
		
		MemberVO vo = memberService.selectMemberInfo(followId);
		int result = 0;		
		if(vo!=null) {
			result=1;
		} 
		return result;
		
	}
	
	@RequestMapping(value="/deleteFollow/{followCode}", method=RequestMethod.GET)
	//팔로우 취소 작성
	public String followDelete(@PathVariable("followCode") int followCode) {	
	
		followService.deleteFollow(followCode);		//팔로우 서비스에 있는 취소 
		return "redirect:/"+ "followList";				//팔로우 폼으로 돌아가서 보여주기
	}
	
	
}
