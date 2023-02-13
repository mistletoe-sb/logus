package com.logus.dailystory.model;

import java.sql.Date;

import lombok.Data;

@Data
// 일일 스토리 VO 클래스
// 작성자 : 이수봉
public class DailystoryVO {
	private int dailystoryCode;			// 스토리 코드
	private String memberNickname;		// 작성자(닉네임)
	private Date dailystoryUploaddate;	// 작성일
	private String dailystoryTitle;		// 스토리 제목
	private String dailystoryContent;	// 스토리 내용
	private String dailystoryImage;		// 첨부 이미지 파일명
}
