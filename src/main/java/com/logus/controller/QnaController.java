package com.logus.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.logus.qna.model.QnaVO;
import com.logus.qna.service.IQnaService;

@Controller
public class QnaController {
	
	@Autowired
	IQnaService qnaService;
	
	@RequestMapping(value="/manager/qna")
	public String getAllQnaList(Model model, HttpSession session) {
		String memberNickname = (String)session.getAttribute("memberNickname");
		if(memberNickname == null) {
			model.addAttribute("qnacount", qnaService.countQna());
			model.addAttribute("qnalist", qnaService.selectQnaList());
		} else {
			model.addAttribute("qnacount", qnaService.countQna(memberNickname));
			model.addAttribute("qnalist", qnaService.selectQnaList(memberNickname));
		}
		return "manager/qna";
	}
	
	@RequestMapping(value="/manager/qnadetail")
	public String getQnaDetail(@RequestParam(value="qnaCode", required=true) int qnaCode, Model model) {
		model.addAttribute("qnadetail", qnaService.selectQnaInfo(qnaCode));
		return "manager/qnadetail";
	}
	
	@RequestMapping(value="/manager/insertqnaform", method=RequestMethod.GET)
	public String insertQnaForm(Model model, RedirectAttributes redirectAttributes) {
		return "manager/insertqnaform";
	}
	
	@RequestMapping(value="/manager/insertqna", method=RequestMethod.POST)
	public String insertQna(QnaVO qnavo, RedirectAttributes redirectAttributes) {
		try {
			System.out.println("insertqna VO프린트" + qnavo + qnavo.getQnaTitle() + qnavo.getQnaContent() + qnavo.getMemberNickname());
			qnaService.insertQna(qnavo);
//			redirectAttributes.addFlashAttribute("message", boardvo.getBoardCode() + "번 글이 등록되었습니다.");
		} catch(Exception e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		}
		
		return "redirect:/manager/qna";
	}
	
	@RequestMapping(value="/manager/updateqnaform", method=RequestMethod.GET)
	public String updatetQnaForm(@RequestParam(value="qnaCode", required=true, defaultValue="1") int qnaCode, Model model) {
		model.addAttribute("qnadetail", qnaService.selectQnaInfo(qnaCode));
		return "manager/updateqnaform";
	}
	
	@RequestMapping(value="/manager/updateqna", method=RequestMethod.POST)
	public String updateQna(QnaVO qnavo, Model model, RedirectAttributes redirectAttributes) {
		System.out.println("updateqna VO프린트" + qnavo + qnavo.getQnaTitle() + qnavo.getQnaContent() + qnavo.getMemberNickname());
		qnaService.updateQ(qnavo);
		return "redirect:/manager/qnadetail?qnaCode=" + qnavo.getQnaCode();
	}
	
	@RequestMapping(value="/manager/deleteqna", method=RequestMethod.GET)
	public String deleteQna(@RequestParam(value="qnaCode", required=true, defaultValue="1") int qnaCode, Model model, RedirectAttributes redirectAttributes) {
		qnaService.deleteQna(qnaCode);
		return "redirect:/manager/qna";
	}
	
	@RequestMapping(value="/manager/insertanswerform", method=RequestMethod.GET)
	public String insertAnswerForm(@RequestParam(value="qnaCode", required=true, defaultValue="1") int qnaCode, Model model) {
		model.addAttribute("qnadetail", qnaService.selectQnaInfo(qnaCode));
		return "manager/insertanswerform";
	}
	
	@RequestMapping(value="/manager/insertanswer", method=RequestMethod.POST)
	public String insertAnswer(QnaVO qnavo, Model model, RedirectAttributes redirectAttributes) {
		qnaService.insertAnswer(qnavo);
		return "redirect:/manager/qnadetail?qnaCode=" + qnavo.getQnaCode();
	}
	
	@RequestMapping(value="/manager/updateanswerform", method=RequestMethod.GET)
	public String updateAnswerForm(@RequestParam(value="qnaCode", required=true, defaultValue="1") int qnaCode, Model model, RedirectAttributes redirectAttributes) {
		model.addAttribute("qnadetail", qnaService.selectQnaInfo(qnaCode));
		return "manager/updateanswerform";
	}
	
	@RequestMapping(value="/manager/updateanswer", method=RequestMethod.POST)
	public String updateAnswer(QnaVO qnavo, Model model, RedirectAttributes redirectAttributes) {
		qnaService.updateAnswer(qnavo);
		return "redirect:/manager/qnadetail?qnaCode=" + qnavo.getQnaCode();
	}
	
	@RequestMapping(value="/manager/deleteanswer", method=RequestMethod.GET)
	public String deleteAnswer(@RequestParam(value="qnaCode", required=true, defaultValue="1") int qnaCode, Model model, RedirectAttributes redirectAttributes) {
		qnaService.deleteAnswer(qnaService.selectQnaInfo(qnaCode));
		return "redirect:/manager/qnadetail?qnaCode=" + qnaCode;
	}
}
