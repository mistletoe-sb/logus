package com.logus.dailycheck.dao;

import java.util.List;

import com.logus.dailycheck.model.DailycheckVO;

public interface IDailycheckDAO {
	public void insertDailycheck(DailycheckVO vo);
	public int updateDailycheck(DailycheckVO vo);
	public int deleteDailycheck(int dailycheckCode);
	public List<DailycheckVO> selectDailycheckList(String dailyroutineCode);
}
