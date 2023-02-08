package com.logus.reply.service;

import java.util.List;

import com.logus.reply.model.ReplyVO;

// 댓글 서비스 인터페이스
public interface IReplyService {
	public abstract int countReply(int dailystoryCode);	// 해당 게시글의 댓글 수 반환
	public abstract List<Integer> countReplyEach(List<Integer> dailystoryCode);		// 게시글 목록의 각 댓글 수 반환
	public abstract List<Integer> countReplyDailystoryList(String memberNickname);	// 해당 회원이 작성한 게시글의 댓글 수 목록 반환
	public abstract void insertReply(ReplyVO vo);		// 댓글 추가
	public abstract void updateReply(ReplyVO vo);		// 댓글 수정
	public abstract void deleteReply(int replyCode);	// 댓글 삭제
	public abstract void deleteAllReplyInDailyStory(int dailystoryCode, int replyCount);	// 해당 게시물의 전체 댓글 삭제
	public abstract List<ReplyVO> selectReplyList(int dailystoryCode);		// 해당 게시물에 작성된 댓글 목록 조회
}
