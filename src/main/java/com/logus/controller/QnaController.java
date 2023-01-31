package com.logus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
}