package com.logus.dailyroutine.model;

import lombok.Data;

@Data
// 작성자 : 최영광
public class DailyroutineVO {
	private int dailyroutineCode;
	private String memberNickname;
	private int dailyroutineWeekopt;
	private String dailyroutineTitle;
	private int dailyroutineActive;
	private int dailyroutineShared;
}
