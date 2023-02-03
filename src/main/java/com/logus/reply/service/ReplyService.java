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
		return replyDAO.countReply(dailystoryCode);		// select
	}

	@Override
	// 해당 회원이 작성한 게시글의 댓글 수 목록 반환
	public List<Integer> countReplyDailystoryList(String memberNickname) {
		return replyDAO.countReplyDailystoryList(memberNickname);	// select
	}

	@Override
	@Transactional
	// 댓글 추가
	public void insertReply(ReplyVO vo) {
		int check = replyDAO.insertReply(vo);			// insert
		if(check != 1) {
			logger.debug("^ reply insert failed.");		// insert된 행이 1개가 아니면 예외 발생
		}
	}

	@Override
	@Transactional
	// 댓글 수정
	public void updateReply(ReplyVO vo) {
		int check = replyDAO.updateReply(vo);			// update
		if(check != 1) {
			logger.debug("^ reply update failed.");		// update된 행이 1개가 아니면 예외 발생
		}
	}

	@Override
	@Transactional
	// 댓글 삭제
	public void deleteReply(int replyCode) {
		int check = replyDAO.deleteReply(replyCode);	// delete
		if(check != 1) {
			logger.debug("^ reply delete failed.");		// delete된 행이 1개가 아니면 예외 발생
		}
	}

	@Override
	@Transactional
	// 해당 게시물의 전체 댓글 삭제
	public void deleteAllReplyInDailyStory(int dailystoryCode, int replyCount) {
		int check = replyDAO.deleteAllReplyInDailyStory(dailystoryCode);	// 해당 스토리의 댓글 삭제
		if(check != replyCount) {
			logger.debug("^ daily story reply delete failed.");		// delete된 댓글 수가 일치하지 않는 경우 예외 발생
		}
	}
	
	@Override
	// 해당 게시물에 작성된 댓글 목록 조회
	public List<ReplyVO> selectReplyList(int dailystoryCode) {
		return replyDAO.selectReplyList(dailystoryCode);	// select
	}

}
