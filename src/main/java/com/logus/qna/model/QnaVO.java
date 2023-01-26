package com.logus.qna.model;

import java.sql.Date;

import lombok.Data;

@Data
public class QnaVO {
	private int qnaCode;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private String memberId;
	private String answerContent;
	private Date answerDate;
	private String managerId;
}
