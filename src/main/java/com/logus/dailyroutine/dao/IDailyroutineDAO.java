package com.logus.dailyroutine.dao;

import java.util.List;

import com.logus.dailyroutine.model.DailyroutineVO;

public interface IDailyroutineDAO {
	public void insertDailyroutine(DailyroutineVO vo);
	public int updateDailyroutine(DailyroutineVO vo);
	public int deleteDailyroutine(int dailyroutineCode);
	public DailyroutineVO selectDailyroutineInfo(String dailyroutineCode);
	public List<DailyroutineVO> selectDailyroutineList(String memberId);
	public List<DailyroutineVO> findDailyroutineList(String search);
	
}
