package com.logus.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.logus.board.model.BoardVO;
import com.logus.board.service.IBoardService;

@Controller
public class BoardController {
	
	@Autowired
	IBoardService boardService;
	
	@RequestMapping(value="/manager/board") // 이름짓기
	public String getAllBoardList(@RequestParam(value="boardcategory", required=true, defaultValue="1") int boardcategory, Model model) {
		model.addAttribute("boardcount", boardService.countBoard(boardcategory));
		model.addAttribute("boardlist", boardService.selectBoardList(boardcategory));
		if(boardcategory == 1) {
			return "manager/notice";
		} else {
			return "manager/report";
		}
	}
	
	@RequestMapping(value="/manager/boarddetail") //이름짓기
	public String getBoardDetail(@RequestParam(value="boardcode", required=true) int boardcode, Model model) {
		model.addAttribute("boarddetail", boardService.selectBoardInfo(boardcode));
		if(boardService.selectBoardInfo(boardcode).getBoardCategory() == 1) {
			return "manager/noticedetail";
		} else {
			return "manager/reportdetail";
		}
	}
	
	@RequestMapping(value="/manager/insertboardform", method=RequestMethod.GET)
	public String insertBoardForm(@RequestParam(value="boardcategory", required=true, defaultValue="1") int boardcategory, Model model) {
		if(boardcategory == 1) {
			return "manager/insertnoticeform"; //폴더안에 있는 jsp로 포워딩하기(전달하기)
		} else {
			return "manager/insertreportform"; 
		}
	}
	
	@RequestMapping(value="/manager/insertboard", method=RequestMethod.POST)
	public String insertBoard(@RequestParam(value="boardCategory", required=true, defaultValue="1") int boardCategory, BoardVO boardvo, RedirectAttributes redirectAttributes, HttpSession session) {
		try {
//			boardvo.setBoardCategory(boardCategory);
//			boardvo.setManagerNickname((String)session.getAttribute("sessionManagerNickname"));
			boardService.insertBoard(boardvo);
			redirectAttributes.addFlashAttribute("message", boardvo.getBoardCode() + "번 글이 등록되었습니다.");
		} catch(Exception e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		}
	
		return "redirect:/manager/board?boardcategory=" + boardCategory; //redirect -> "/manager/board?boardcategory" 주소로 가주세요
		
//		if(boardCategory == 1) {
//			return "redirect:/manager/board?boardcategory=" + boardCategory;
//		} else {
//			return "redirect:/manager/board?boardcategory=" + boardCategory;
//		}
	}
//
//	@RequestMapping(value="/manager/updateboardform", method=RequestMethod.GET)
//	public String updateBoardForm(@RequestParam(value="boardcategory", required=true, defaultValue="1") int boardcategory, Model model) {
//		if(boardcategory == 1) {
//			return "manager/insertnoticeform";
//		} else {
//			return "manager/insertreportform";
//		}
//	}
//	
//	@RequestMapping(value="/manager/updateboard", method=RequestMethod.POST)
//	public String updateBoard(@RequestParam(value="boardCategory", required=true, defaultValue="1") int boardCategory, BoardVO boardvo, RedirectAttributes redirectAttributes, HttpSession session) {
//		try {
////			boardvo.setBoardCategory(boardCategory);
////			boardvo.setManagerNickname((String)session.getAttribute("sessionManagerNickname"));
//			boardService.insertBoard(boardvo);
//			redirectAttributes.addFlashAttribute("message", boardvo.getBoardCode() + "번 글이 등록되었습니다.");
//		} catch(Exception e) {
//			redirectAttributes.addFlashAttribute("message", e.getMessage());
//		}
//		
//		return "redirect:/manager/board?boardcategory=" + boardCategory;
//		
////		if(boardCategory == 1) {
////			return "redirect:/manager/board?boardcategory=" + boardCategory;
////		} else {
////			return "redirect:/manager/board?boardcategory=" + boardCategory;
////		}
//	}
//	

}
