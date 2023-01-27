package com.logus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.logus.manager.service.IManagerService;

@Controller
public class ManagerController {
	
	@Autowired
	IManagerService managerService;
	
	@RequestMapping(value="/manager/managerlist")
	public String getAllManagerList(Model model) {
		model.addAttribute("managercount", managerService.countManager());
		model.addAttribute("managerlist", managerService.selectManagerList());
		return "manager/managerlist";
	}
}
