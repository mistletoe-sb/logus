package com.logus.manager.model;

import lombok.Data;

@Data
// 작성자 : 배재연
public class ManagerVO {
	private int managerCode;
	private String managerId;
	private String managerPassword;
	private int managerLevel;
	private String managerNickname;
}
