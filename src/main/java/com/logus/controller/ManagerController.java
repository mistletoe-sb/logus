package com.logus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.logus.manager.service.IManagerService;

@Controller
public class ManagerController {
	
	@Autowired
	IManagerService managerService;
	
}
