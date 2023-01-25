package com.logus.reply.dao;

import java.util.List;

import com.logus.reply.model.ReplyVO;

public interface IReplyDAO {
	public void insertReply(ReplyVO vo);
	public int updateReply(ReplyVO vo);
	public int deleteReply(String replyCode);
	public List<ReplyVO> selectReplyList(String dailystoryCode);
}
