package com.logus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.logus.board.service.IBoardService;

@Controller
public class BoardController {
	
	@Autowired
	IBoardService boardService;
	
	@RequestMapping(value="/manager/board")
	public String getAllBoardList(@RequestParam(value="boardcategory", required=true, defaultValue="1") int boardcategory, Model model) {
		model.addAttribute("boardcount", boardService.countBoard(boardcategory));
		model.addAttribute("boardlist", boardService.selectBoardList(boardcategory));
		if(boardcategory == 1) {
			return "manager/notice";
		} else {
			return "manager/report";
		}
	}
	
	@RequestMapping(value="/manager/boarddetail")
	public String getBoardDetail(@RequestParam(value="boardcode", required=true) int boardcode, Model model) {
		model.addAttribute("boarddetail", boardService.selectBoardInfo(boardcode));
		if(boardService.selectBoardInfo(boardcode).getBoardCategory() == 1) {
			return "manager/noticedetail";
		} else {
			return "manager/reportdetail";
		}
	}
	@GetMapping(value="/manager/chart")
	public String getBoardDetail1() {
			return "manager/chartMain";
		
	}
	
}
