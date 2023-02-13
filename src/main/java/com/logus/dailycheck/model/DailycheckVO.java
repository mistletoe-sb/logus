package com.logus.dailycheck.model;

import lombok.Data;

@Data
// 작성자 : 최영광
public class DailycheckVO {
	private int dailycheckCode;
	private int dailyroutineCode;
	private String dailycheckBegintime;
	private String dailycheckEndtime;
	private String dailycheckContent;
}
