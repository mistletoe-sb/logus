package com.logus.dailycheck.model;

import java.sql.Date;

import lombok.Data;

@Data
public class DailycheckVO {
	private int dailycheckCode;
	private int dailyroutineCode;
	private Date dailycheckBegintime;
	private Date dailycheckEndtime;
	private String dailycheckContent;
}
