package com.logus.dailycheck.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.logus.dailycheck.dao.IDailycheckDAO;
import com.logus.dailycheck.model.DailycheckVO;
import java.util.List;

@Service
public class DailycheckService implements IDailycheckService {
	
	@Autowired
	private IDailycheckDAO dailycheckdao;
	
	@Override
	public void insertDailycheck(DailycheckVO vo) {
		dailycheckdao.insertDailycheck(vo);
	}

	@Override
	public int updateDailycheck(DailycheckVO vo) {
		return dailycheckdao.updateDailycheck(vo);
	}

	@Override
	public int deleteDailycheck(List<DailycheckVO> voList , int dailyroutineCode) {
		return dailycheckdao.deleteDailycheck(voList, dailyroutineCode);
	}

	@Override
	public int deleteDailycheckAll(int dailyroutineCode) {
		return dailycheckdao.deleteDailycheckAll(dailyroutineCode);
	}

	@Override
	public List<DailycheckVO> selectDailycheckList(int dailyroutineCode) {
		return dailycheckdao.selectDailycheckList(dailyroutineCode);
	}
}
