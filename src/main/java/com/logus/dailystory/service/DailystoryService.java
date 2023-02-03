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
import com.logus.reply.service.IReplyService;
import com.logus.tag.dao.ITagDAO;
import com.logus.tag.model.TagVO;
import com.logus.tag.service.ITagService;
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
	
	@Autowired
	private IReplyService replyService;		// 댓글 서비스 객체
	@Autowired
	private ITagService tagService;			// 태그 서비스 객체
	
	@Override
	@Transactional
	// 일일 스토리 작성
	public void insertDailystory(DailystoryVO vo, List<TagVO> tags) {
		int check = dailystoryDAO.insertDailystory(vo);		// 일일 스토리 추가(insert)
		int selectKey = vo.getDailystoryCode();				// select key 참조(insert할 때 사용된 dailystory code)
		if(check != 1) {
			logger.debug("^ daily story insert failed.");	// insert된 일일 스토리가 1개가 아니면 예외 발생
		}
		tagService.insertTags(tags, selectKey);				// 태그 추가(insert)
		/*
		int[] checkList = new int[2];	// insert 유효성 확인을 위한 배열
		checkList[0] = dailystoryDAO.insertDailystory(vo);	// 일일 스토리 추가(insert)
		for(TagVO item : tags) {
			checkList[1] += tagDAO.insertTag(item);			// 태그 추가(insert 반복)
		}
		if(checkList[0] != 1) {
			logger.debug("^ daily story insert failed.");			// insert된 일일 스토리가 1개가 아니면 예외 발생
		} else if(checkList[1] != tags.length) {
			logger.debug("^ daily story tag insert failed.");		// insert된 태그 수가 일치하지 않는 경우 예외 발생
		}
		*/
	}

	@Override
	@Transactional
	// 일일 스토리 수정
	public void updateDailystory(DailystoryVO vo, List<TagVO> tags) {
		int check = dailystoryDAO.updateDailystory(vo);		// 일일 스토리 수정(update)
		if(check != 1) {
			logger.debug("^ daily story update failed.");	// update된 일일 스토리가 1개가 아니면 예외 발생
		}
		tagService.updateTags(tags);						// 태그 수정(update)
		/*
		int[] checkList = new int[2];	// update 유효성 확인을 위한 배열
		checkList[0] = dailystoryDAO.updateDailystory(vo);	// 일일 스토리 수정(update)
		for(TagVO item : tags) {
			checkList[1] += tagDAO.updateTag(item);			// 태그 수정(update 반복)
		}
		if(checkList[0] != 1) {
			logger.debug("^ daily story update failed.");			// update된 일일 스토리가 1개가 아니면 예외 발생
		} else if(checkList[1] != tags.length) {
			logger.debug("^ daily story tag update failed.");		// update된 태그 수가 일치하지 않는 경우 예외 발생
		}
		*/
	}

	@Override
	@Transactional
	// 일일 스토리 삭제
	public void deleteDailystory(int dailystoryCode, int tagCount, int replyCount) {
		
		replyService.deleteAllReplyInDailyStory(dailystoryCode, replyCount);	// 해당 스토리의 댓글 삭제
		int check = dailystoryDAO.deleteDailystory(dailystoryCode);				// 해당 일일 스토리 삭제(마지막으로 처리)
		if(check != 1) {
			logger.debug("^ daily story delete failed.");			// delete된 일일 스토리가 1개가 아니면 예외 발생
		}
		/*
		int[] checkList = new int[3];	// delete 유효성 확인을 위한 배열
		checkList[0] = tagDAO.deleteAllTagInPost(TagCategory.DAILY_STORY, dailystoryCode);	// 해당 스토리의 태그 삭제
		checkList[1] = replyDAO.deleteAllReplyInDailyStory(dailystoryCode);					// 해당 스토리의 댓글 삭제
		checkList[2] = dailystoryDAO.deleteDailystory(dailystoryCode);						// 해당 일일 스토리 삭제(마지막으로 처리)
		if(checkList[0] != tagCount) {
			logger.debug("^ daily story tag delete failed.");		// delete된 태그 수가 일치하지 않는 경우 예외 발생
		} else if(checkList[1] != replyCount) {
			logger.debug("^ daily story reply delete failed.");		// delete된 댓글 수가 일치하지 않는 경우 예외 발생
		} else if(checkList[2] != 1) {
			logger.debug("^ daily story delete failed.");			// delete된 일일 스토리가 1개가 아니면 예외 발생
		}
		*/
	}

	@Override
	// 일일 스토리 상세 내용 조회
	public DailystoryVO selectDailystoryInfo(int dailystoryCode) {
		return dailystoryDAO.selectDailystoryInfo(dailystoryCode);	// select
	}

	@Override
	// 일일 스토리 목록 조회(내 서재)
	public List<DailystoryVO> selectDailystoryList(String memberNickname) {
		return dailystoryDAO.selectDailystoryList(memberNickname);	// select
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
