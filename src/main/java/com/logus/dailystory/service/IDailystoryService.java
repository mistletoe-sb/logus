package com.logus.dailystory.service;

import java.io.File;
import java.util.List;

import com.logus.dailystory.model.DailystoryVO;
import com.logus.tag.model.TagVO;

// 일일 스토리 서비스 인터페이스
public interface IDailystoryService {
	public abstract void insertDailystory(DailystoryVO vo, List<TagVO> tags);										// 일일 스토리 작성
	public abstract void updateDailystory(DailystoryVO vo, List<TagVO> tags, List<Integer> tagCodes);										// 일일 스토리 수정
	public abstract void deleteDailystory(int dailystoryCode, int tagCount, int replyCount, File file);	// 일일 스토리 삭제
	public abstract DailystoryVO selectDailystoryInfo(int dailystoryCode);						// 일일 스토리 상세 내용 조회
	public abstract List<DailystoryVO> selectDailystoryList(String memberNickname);				// 일일 스토리 목록 조회
	public abstract List<DailystoryVO> findDailystoryList(
			String option, String search);														// 옵션에 따라 검색(전체 검색)
	public abstract List<DailystoryVO> findDailystoryList(
			String option, String search, String memberNickname);								// 옵션에 따라 검색(서재 내 검색)
}
