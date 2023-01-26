package com.logus.dailystory.dao;

import java.util.List;

import com.logus.dailystory.model.DailystoryVO;

// 일일 스토리 DAO 인터페이스
public interface IDailystoryDAO {
	public abstract int countDailystory(String memberNickname);		// 내 스토리 개수 반환
	public abstract void insertDailystory(DailystoryVO vo);			// 일일 스토리 작성
	public abstract int updateDailystory(DailystoryVO vo);			// 일일 스토리 수정
	public abstract int deleteDailystory(int dailystoryCode);		// 일일 스토리 삭제
	public abstract DailystoryVO selectDailystoryInfo(int dailystoryCode);			// 일일 스토리 상세 내용 조회
	public abstract List<DailystoryVO> selectDailystoryList(String memberNickname);	// 일일 스토리 목록 조회
	public abstract List<DailystoryVO> findDailystoryList(String option, String search);	// 옵션에 따라 검색
}
