package com.logus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.logus.qna.service.IQnaService;

@Controller
public class QnaController {
	
	@Autowired
	IQnaService qnaService;
}
