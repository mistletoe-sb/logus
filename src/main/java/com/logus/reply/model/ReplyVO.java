package com.logus.reply.model;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private int replyCode;
	private String replyContent;
	private int dailystoryCode;
	private String memberNickname;
	private Date replyDate;
}
