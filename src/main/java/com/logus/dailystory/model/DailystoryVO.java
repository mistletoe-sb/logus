package com.logus.dailystory.model;

import java.sql.Date;

import lombok.Data;

@Data
public class DailystoryVO {
	private int dailystoryCode;
	private String memberId;
	private Date dailystoryDate;
	private String dailystoryTitle;
	private String dailystoryContent;
	private String dailystoryImage;
}
