package com.logus.board.model;

import lombok.Data;

@Data
public class BoardVO {
	private int boardCode;
	private String boardTitle;
	private int boardContent;
	private int managerNickname;
	private String boardCategory;
	private int boardDate;
}
