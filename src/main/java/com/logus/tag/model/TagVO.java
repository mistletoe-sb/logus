package com.logus.tag.model;

import lombok.Data;

@Data
// 태그 VO 클래스
// 작성자 : 이수봉
public class TagVO {
	private int tagCode;			// 태그 코드
	private String dailystoryCode;		// 일일 스토리 코드
	private String dailyroutineCode;	// 일일 루틴 코드
	private String tagName;			// 태그명
	private int tagCategory;		// 태그가 속한 카테고리(스토리: 1, 루틴: 2)
}
