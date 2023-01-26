package com.logus.dailyroutine.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.logus.dailyroutine.model.DailyroutineVO;

public interface IDailyroutineDAO {
	public void insertDailyroutine(DailyroutineVO vo);
	
	//public int select();	//1번 active 정보를 반환
	public int updateRoutineActive();	//1번 반환받은 정보 기반으로 
	public int updateDailyroutine(DailyroutineVO vo);	//2번 active 포함 업데이트
	public int deleteDailyroutine(int dailyroutineCode);
	public DailyroutineVO selectDailyroutineInfo(int dailyroutineCode);
	public List<DailyroutineVO> selectDailyroutineList(String memberNickname);
	public List<DailyroutineVO> findDailyroutineList(@Param("option") String option, @Param("search") String search);
	
}
