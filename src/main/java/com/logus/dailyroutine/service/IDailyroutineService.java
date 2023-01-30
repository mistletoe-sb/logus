package com.logus.dailyroutine.service;

import java.util.List;

import com.logus.dailyroutine.model.DailyroutineVO;

public interface IDailyroutineService {
	public void insertDailyroutine(DailyroutineVO vo);
	public int updateDailyroutine(DailyroutineVO vo);
	public int deleteDailyroutine(int dailyroutineCode);
	public DailyroutineVO selectDailyroutineInfo(int dailyroutineCode);
	public List<DailyroutineVO> selectDailyroutineList(String memberNickname, int dailyroutineWeekopt);
	public List<DailyroutineVO> findDailyroutineList(String option, String search);
}
