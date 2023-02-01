package com.logus.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class StatisticsController {
	@RequestMapping(value="/manager/statistics")
	public String logoutManager(Model model, RedirectAttributes redirectAttributession, HttpSession session) {
		if(session.getAttribute("sessionManagerId") != null) {
			return "manager/statistics";
		} else {
			return "manager/accessrestriction_manager";
		}
	}
}
