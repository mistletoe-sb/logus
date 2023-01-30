package com.logus.dailyroutine.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.logus.dailyroutine.model.DailyroutineVO;

public interface IDailyroutineDAO {
	public int insertDailyroutine(DailyroutineVO vo);	//int로 key insert한거 반환받아서 check에 바로 써야 함
	public int updateRoutineActive(@Param("memberNickname") String memberNickname, @Param("dailyroutineWeekopt") int dailyroutineWeekopt); //0 기본, 1번 메인
                    
	public int updateDailyroutine(DailyroutineVO vo);	//2번 active 포함 업데이트
	public int deleteDailyroutine(int dailyroutineCode);
	public DailyroutineVO selectDailyroutineInfo(int dailyroutineCode);
	public List<DailyroutineVO> selectDailyroutineList(@Param("memberNickname") String memberNickname, 
			@Param("dailyroutineWeekopt") int dailyroutineWeekopt);
	public List<DailyroutineVO> findDailyroutineList(@Param("option") String option, @Param("search") String search);
	//전체, 태그, 제목, 내용, 사용자(닉네임) 검색
	
}
