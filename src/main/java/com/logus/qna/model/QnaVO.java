package com.logus.qna.model;

import java.sql.Date;

import lombok.Data;

// 이 VO는 롬복 사용시 수정되기 이전 변수명으로 인식되어 바뀐 내용으로 적용이 안 됨. getter 및 setter, toString 소스코드 유지 요망.
@Data
public class QnaVO {
	private int qnaCode;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private String memberNickname;
	private String answerContent;
	private Date answerDate;
	private String managerNickname;	
}
