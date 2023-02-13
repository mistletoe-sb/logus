package com.logus.reply.model;

import java.sql.Date;

import lombok.Data;

@Data
// 댓글 VO 클래스
// 작성자 : 이수봉
public class ReplyVO {
	private int replyCode;			// 댓글 코드
	private String replyContent;	// 댓글 내용
	private int dailystoryCode;		// 댓글이 작성된 일일 스토리 코드
	private String memberNickname;	// 댓글 작성자(닉네임)
	private Date replyDate;			// 댓글 작성일
}
