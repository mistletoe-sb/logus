package com.logus.dailycheck.model;

import lombok.Data;

@Data
public class DailycheckVO {
	private int dailycheckCode;
	private int dailyroutineCode;
	private String dailycheckBegintime;
	private String dailycheckEndtime;
	private String dailycheckContent;
}
