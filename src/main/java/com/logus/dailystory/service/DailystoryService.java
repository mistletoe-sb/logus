package com.logus.dailystory.service;

import java.io.File;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logus.dailystory.dao.IDailystoryDAO;
import com.logus.dailystory.model.DailystoryVO;
import com.logus.reply.service.IReplyService;
import com.logus.tag.model.TagVO;
import com.logus.tag.service.ITagService;
import com.logus.util.constant.TagCategory;

@Service
// 일일 스토리 서비스 구현 클래스
// 작성자 : 이수봉
public class DailystoryService implements IDailystoryService {

	private static Logger logger = LoggerFactory.getLogger(DailystoryService.class);	// 로깅을 위한 객체 참조
	
	@Autowired
	private IDailystoryDAO dailystoryDAO;	// 일일 스토리 DAO 객체

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
	}

	@Override
	@Transactional
	// 일일 스토리 수정
	public void updateDailystory(DailystoryVO vo, List<TagVO> tags, List<Integer> tagCodes) {
		int check = dailystoryDAO.updateDailystory(vo);		// 일일 스토리 수정(update)
		if(check != 1) {
			logger.debug("^ daily story update failed.");	// update된 일일 스토리가 1개가 아니면 예외 발생
		}
		
		tagService.updateTags(tags, tagCodes);	// 태그 수정(수정 알고리즘 실행)
	}

	@Override
	@Transactional
	// 일일 스토리 삭제
	public void deleteDailystory(int dailystoryCode, int tagCount, int replyCount, File file) {
		tagService.deleteAllTagInPost(TagCategory.DAILY_STORY, dailystoryCode, tagCount);	// 해당 스토리의 태그 삭제
		replyService.deleteAllReplyInDailyStory(dailystoryCode, replyCount);	// 해당 스토리의 댓글 삭제
		int check = dailystoryDAO.deleteDailystory(dailystoryCode);				// 해당 일일 스토리 삭제
		if(check != 1) {
			logger.debug("^ daily story delete failed.");			// delete된 일일 스토리가 1개가 아니면 예외 발생
		}
		if(file != null) {			// 삭제할 파일이 존재할 경우
			if(!file.delete()) {
				logger.debug("^ daily story file delete failed.");	// 파일 삭제 실패 시 예외 발생
			}
		}
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
		return dailystoryDAO.findInAllDailystoryList(option, search);
	}

	@Override
	public List<DailystoryVO> findDailystoryList(String option, String search, String myNickname) {
		return dailystoryDAO.findInMyDailystoryList(option, search, myNickname);
	}

}
