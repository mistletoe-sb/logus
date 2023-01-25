package com.logus.tag.model;

import lombok.Data;

@Data
public class TagVO {
	private int tagCode;
	private int dailystoryCode;
	private int dailyroutineCode;
	private String tagName;
	private int tagCategory;
}
