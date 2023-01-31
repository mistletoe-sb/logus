package com.logus.controller;

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
	public String getAllQnaList(@RequestParam(value="memberNickname", required=false) String memberNickname, Model model) {
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
	public String getQnaDetail(@RequestParam(value="qnacode", required=true) int qnacode, Model model) {
		model.addAttribute("qnadetail", qnaService.selectQnaInfo(qnacode));
		return "manager/qnadetail";
	}
	
	@RequestMapping(value="/manager/insertanswerform", method=RequestMethod.GET)
	public String insertAnswerForm(@RequestParam(value="qnaCode", required=true, defaultValue="1") int qnaCode, Model model, RedirectAttributes redirectAttributes) {
		model.addAttribute("qnadetail", qnaService.selectQnaInfo(qnaCode));
		return "manager/insertaform";
	}
	
	@RequestMapping(value="/manager/insertanswer", method=RequestMethod.POST)
	public String insertAnswer(QnaVO qnavo, Model model, RedirectAttributes redirectAttributes) {
		qnaService.insertAnswer(qnavo);
		return "redirect:/manager/qnadetail?qnacode=" + qnavo.getQnaCode();
	}
	
	@RequestMapping(value="/manager/updateanswerform", method=RequestMethod.GET)
	public String updateAnswerForm(@RequestParam(value="qnaCode", required=true, defaultValue="1") int qnaCode, Model model, RedirectAttributes redirectAttributes) {
		model.addAttribute("qnadetail", qnaService.selectQnaInfo(qnaCode));
		return "manager/updateaform";
	}
	
	@RequestMapping(value="/manager/updateanswer", method=RequestMethod.POST)
	public String updateAnswer(QnaVO qnavo, Model model, RedirectAttributes redirectAttributes) {
		qnaService.updateAnswer(qnavo);
		return "redirect:/manager/qnadetail?qnacode=" + qnavo.getQnaCode();
	}
	
	@RequestMapping(value="/manager/deleteanswer", method=RequestMethod.GET)
	public String deleteAnswer(@RequestParam(value="qnaCode", required=true, defaultValue="1") int qnaCode, Model model, RedirectAttributes redirectAttributes) {
		qnaService.deleteAnswer(qnaService.selectQnaInfo(qnaCode));
		return "redirect:/manager/qnadetail?qnacode=" + qnaCode;
	}
}
