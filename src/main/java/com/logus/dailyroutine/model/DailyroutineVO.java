package com.logus.dailyroutine.model;

import lombok.Data;

@Data
public class DailyroutineVO {
	private int dailyroutineCode;
	private String memberId;
	private int dailyroutineWeekopt;
	private String dailyroutineTitle;
	private String dailyroutineActive;
}
