package com.logus.dailyroutine.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.logus.dailyroutine.model.DailyroutineVO;

public interface IDailyroutineDAO {
	public void insertDailyroutine(DailyroutineVO vo);
	
	//public int select();	//1번 active 정보를 반환

	public int updateRoutineActive();	//1번 if로 컨트롤러에서 실행여부 나눔(파라미터 X)
										//0이 기본, 1번이 메인에 걸림
                    
	public int updateDailyroutine(DailyroutineVO vo);	//2번 active 포함 업데이트
	public int deleteDailyroutine(int dailyroutineCode);
	public DailyroutineVO selectDailyroutineInfo(int dailyroutineCode);
	public List<DailyroutineVO> selectDailyroutineList(String memberNickname);
	public List<DailyroutineVO> findDailyroutineList(@Param("option") String option, @Param("search") String search);
	
}
