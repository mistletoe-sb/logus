package com.logus.board.model;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int boardCode;
	private String boardTitle;
	private String boardContent;
	private String managerNickname;
	private int boardCategory;
	private Date boardDate;
}
