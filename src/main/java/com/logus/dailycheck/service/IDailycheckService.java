package com.logus.dailycheck.service;

import java.util.List;

import com.logus.dailycheck.model.DailycheckVO;

// 작성자 : 최영광
public interface IDailycheckService {
	public void insertDailycheck(DailycheckVO vo);
	public int updateDailycheck(DailycheckVO vo);	//인풋 전체를 받아서 수정 안했어도 업데이트	
													//controller에서 vo list 객체로 받아서 for문 처리
	public int deleteDailycheck(List<DailycheckVO> voList, int dailyroutineCode);	//수정 시 기존 루틴 중 일부-시간별 일정 개별로 삭제
														
	public int deleteDailycheckAll(int dailyroutineCode);		//수정 시 기존 루틴 전체-시간별 일정 전체 삭제
	public List<DailycheckVO> selectDailycheckList(int dailyroutineCode);
}
