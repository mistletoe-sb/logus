package com.logus.reply.dao;

import java.util.List;

import com.logus.reply.model.ReplyVO;

// 댓글 DAO 인터페이스
public interface IReplyDAO {
	public void insertReply(ReplyVO vo);		// 댓글 추가
	public int updateReply(ReplyVO vo);			// 댓글 수정
	public int deleteReply(int replyCode);		// 댓글 삭제
	public int deleteReply(int dailystoryCode, int replyCount);	// 해당 게시물의 전체 댓글 삭제	
	public List<ReplyVO> selectReplyList(int dailystoryCode);
}
