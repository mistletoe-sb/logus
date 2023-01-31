package com.logus.reply.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logus.reply.dao.IReplyDAO;
import com.logus.reply.model.ReplyVO;

@Service
// 댓글 서비스 구현 클래스
public class ReplyService implements IReplyService {

	private static Logger logger = LoggerFactory.getLogger(ReplyService.class);	// 로깅을 위한 객체 참조
	
	@Autowired
	private IReplyDAO replyDAO;		// 댓글 DAO 객체
	
	@Override
	// 해당 게시글의 댓글 수 반환
	public int countReply(int dailystoryCode) {
		return replyDAO.countReply(dailystoryCode);
	}

	@Override
	// 해당 회원이 작성한 게시글의 댓글 수 목록 반환
	public List<Integer> countReplyDailystoryList(String memberNickname) {
		return replyDAO.countReplyDailystoryList(memberNickname);
	}

	@Override
	// 댓글 추가
	public void insertReply(ReplyVO vo) {
		replyDAO.insertReply(vo);
	}

	@Override
	@Transactional
	// 댓글 수정
	public void updateReply(ReplyVO vo) {
		int check = replyDAO.updateReply(vo);
		if(check != 1) {
			logger.debug("^ reply update failed.");
		}
	}

	@Override
	@Transactional
	// 댓글 삭제
	public void deleteReply(int replyCode) {
		int check = replyDAO.deleteReply(replyCode);
		if(check != 1) {
			logger.debug("^ reply delete failed.");
		}
	}

	@Override
	// 해당 게시물에 작성된 댓글 목록 조회
	public List<ReplyVO> selectReplyList(int dailystoryCode) {
		return replyDAO.selectReplyList(dailystoryCode);
	}

}
