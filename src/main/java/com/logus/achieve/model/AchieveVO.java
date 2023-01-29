package com.logus.achieve.model;

import java.sql.Date;

import lombok.Data;

@Data
public class AchieveVO {
	private int checkrateCode;
	private String memberNickname;
	private Date achieveDate;
	private int achieveRate;
	
}
