package com.logus.dailystory.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logus.dailystory.dao.IDailystoryDAO;
import com.logus.dailystory.model.DailystoryVO;
import com.logus.reply.dao.IReplyDAO;
import com.logus.tag.dao.ITagDAO;
import com.logus.util.constant.TagCategory;

@Service
// 일일 스토리 서비스 구현 클래스
public class DailystoryService implements IDailystoryService {

	private static Logger logger = LoggerFactory.getLogger(DailystoryService.class);	// 로깅을 위한 객체 참조
	
	@Autowired
	private IDailystoryDAO dailystoryDAO;	// 일일 스토리 DAO 객체
	@Autowired
	private ITagDAO tagDAO;					// 태그 DAO 객체
	@Autowired
	private IReplyDAO replyDAO;				// 댓글 DAO 객체
	
	@Override
	// 일일 스토리 작성
	public void insertDailystory(DailystoryVO vo) {
		dailystoryDAO.insertDailystory(vo);
	}

	@Override
	@Transactional
	// 일일 스토리 수정
	public void updateDailystory(DailystoryVO vo) {
		int check = dailystoryDAO.updateDailystory(vo);
		if(check != 1) {
			logger.debug("^ daily story update failed.");
		}
	}

	@Override
	@Transactional
	// 일일 스토리 삭제
	public void deleteDailystory(int dailystoryCode, int tagCount, int replyCount) {
		int[] checkList = new int[3];	// delete 유효성 확인을 위한 배열
		checkList[0] = tagDAO.deleteTag(TagCategory.DAILY_STORY, dailystoryCode, tagCount);	// 해당 스토리의 태그 삭제
		checkList[1] = replyDAO.deleteAllReplyInDailyStory(dailystoryCode);					// 해당 스토리의 댓글 삭제
		checkList[2] = dailystoryDAO.deleteDailystory(dailystoryCode);						// 해당 일일 스토리 삭제(마지막으로 처리)
		if(checkList[0] != tagCount) {
			logger.debug("^ daily story tag delete failed.");
		} else if(checkList[1] != replyCount) {
			logger.debug("^ daily story reply delete failed.");
		} else if(checkList[2] != 1) {
			logger.debug("^ daily story delete failed.");
		}
	}

	@Override
	// 일일 스토리 상세 내용 조회
	public DailystoryVO selectDailystoryInfo(int dailystoryCode) {
		return dailystoryDAO.selectDailystoryInfo(dailystoryCode);
	}

	@Override
	// 일일 스토리 목록 조회(내 서재)
	public List<DailystoryVO> selectDailystoryList(String memberNickname) {
		return dailystoryDAO.selectDailystoryList(memberNickname);
	}

	@Override
	// 옵션(전체, 제목, 내용, 태그)에 따라 검색(전체 사용자 대상 검색)
	public List<DailystoryVO> findDailystoryList(String option, String search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DailystoryVO> findDailystoryList(String option, String search, String memberNickname) {
		// TODO Auto-generated method stub
		return null;
	}

}
