package com.logus.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.logus.board.model.BoardVO;
import com.logus.board.service.IBoardService;

@Controller
public class BoardController {
	
	private static final String CURR_IMAGE_REPO_PATH = "C:\\project_labs\\spring_workspace\\logus\\src\\main\\webapp\\resources\\images\\manager";
	private static final String REAL_PATH = "C:\\project_labs\\spring_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\logus\\resources\\images\\manager";

	@Autowired
	IBoardService boardService;
	
	@RequestMapping(value="/manager/board")
	public String getAllBoardList(@RequestParam(value="boardcategory", required=true, defaultValue="1") int boardcategory, @RequestParam(value="nowPage", required=false, defaultValue="1") int nowPage, Model model) {
		model.addAttribute("boardcount", boardService.countBoard(boardcategory));
		model.addAttribute("boardlist", boardService.selectBoardList(boardcategory, 10, nowPage));
		model.addAttribute("totalPage", boardService.countTotalPage(boardcategory, 10));
		model.addAttribute("nowPage", nowPage);
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
	
	@RequestMapping(value="/manager/insertboardform", method=RequestMethod.GET)
	public String insertBoardForm(@RequestParam(value="boardcategory", required=true, defaultValue="1") int boardcategory, Model model, HttpSession session) {
		if(session.getAttribute("sessionManagerId") != null) {
			if(boardcategory == 1) {
				return "manager/insertnoticeform";
			} else {
				return "manager/insertreportform";
			}
		} else {
			return "manager/accessrestriction_manager";
		}
	}
	
	@RequestMapping(value="/manager/insertboard", method=RequestMethod.POST)
	public String insertBoard(@RequestParam(value="boardCategory", required=true, defaultValue="1") int boardCategory, BoardVO boardvo, @RequestParam MultipartFile boardFile, RedirectAttributes redirectAttributes, HttpSession session) {
		try {
			System.out.println(boardvo);
			
			if(boardFile.getSize() != 0) {
				long t = System.currentTimeMillis();
				int r = (int)(Math.random()*1000000);

				String fileId = "" + t + r;
				
				String[] originalFilename = boardFile.getOriginalFilename().split("\\.");
				String fileType = originalFilename[originalFilename.length - 1];
				fileId = fileId + "." + fileType;
				
//				boardFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + boardFile.getOriginalFilename()));
//				boardFile.transferTo(new File(REAL_PATH + "\\" + boardFile.getOriginalFilename()));

				String path = session.getServletContext().getRealPath("/");				
				System.out.println("■path:::"+path);
				boardFile.transferTo(new File(path + "resources\\images\\manager\\" + fileId));

				boardvo.setBoardImage(fileId);
			}
			boardService.insertBoard(boardvo);
			redirectAttributes.addFlashAttribute("message", boardvo.getBoardCode() + "번 글이 등록되었습니다.");
		} catch(Exception e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
			System.out.println("에러메시지 나옵니다~" + e.getMessage());
		}
		return "redirect:/manager/board?boardcategory=" + boardCategory;
	}

	@RequestMapping(value="/manager/updateboardform", method=RequestMethod.GET)
	public String updateBoardForm(@RequestParam(value="boardCategory", required=true, defaultValue="1") int boardCategory, @RequestParam(value="boardCode", required=true, defaultValue="1") int boardCode, Model model, HttpSession session) {
		if(session.getAttribute("sessionManagerId") != null) {
		model.addAttribute("boarddetail", boardService.selectBoardInfo(boardCode));
			if(boardCategory == 1) {
				return "manager/updatenoticeform";
			} else {
				return "manager/updatereportform";
			}
		} else {
			return "manager/accessrestriction_manager";
		}
	}
	
	@RequestMapping(value="/manager/updateboard", method=RequestMethod.POST)
	public String updateBoard(@RequestParam(value="boardCategory", required=true, defaultValue="1") int boardCategory, BoardVO boardvo, @RequestParam MultipartFile boardFile, RedirectAttributes redirectAttributes, HttpSession session) {
		try {
			if(boardFile.getSize() != 0) {
//				boardFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + boardFile.getOriginalFilename()));
//				boardFile.transferTo(new File(REAL_PATH + "\\" + boardFile.getOriginalFilename()));
				
				String path = session.getServletContext().getRealPath("/");
				System.out.println("■path:::"+path);
				
				boardFile.transferTo(new File(path + "resources\\images\\manager\\" + boardFile.getOriginalFilename()));

				boardvo.setBoardImage(boardFile.getOriginalFilename());
			}
			boardService.updateBoard(boardvo);
			redirectAttributes.addFlashAttribute("message", boardvo.getBoardCode() + "번 글이 수정되었습니다.");
		} catch(Exception e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		}
		
		return "redirect:/manager/board?boardcategory=" + boardCategory;
	}
	
	@RequestMapping(value="/manager/deleteboard", method=RequestMethod.GET)
	public String deleteBoard(@RequestParam(value="boardCategory", required=true, defaultValue="1") int boardCategory, @RequestParam(value="boardCode", required=true) int boardCode, Model model, RedirectAttributes redirectAttributes) {
		boardService.deleteBoard(boardCode);
		return "redirect:/manager/board?boardcategory=" + boardCategory;
	}
	
}