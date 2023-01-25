package com.logus.dailystory.dao;

import java.util.List;

import com.logus.dailystory.model.DailystoryVO;

public interface IDailystoryDAO {
	public void insertDailystory(DailystoryVO vo);
	public int updateDailystory(DailystoryVO vo);
	public int deleteDailystory(String memberId);
	public DailystoryVO selectDailystoryInfo(String memberId);
	public List<DailystoryVO> selectDailystoryList(String memberId);
	public List<DailystoryVO> findDailystoryList(String search);
}
