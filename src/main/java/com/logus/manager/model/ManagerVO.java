package com.logus.manager.model;

import lombok.Data;

@Data
public class ManagerVO {
	private int managerCode;
	private String managerId;
	private String managerPassword;
	private int managerLevel;
	private String managerNickname;
	
}
