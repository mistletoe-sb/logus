package com.logus.dailycheck.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.logus.dailycheck.dao.IDailycheckDAO;
import com.logus.dailycheck.model.DailycheckVO;

@Service
public class DailycheckService implements IdailycheckService {
	
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
	public int deleteDailycheck(int dailycheckCode) {
		return dailycheckdao.deleteDailycheck(dailycheckCode);
	}

	@Override
	public int deleteDailycheckAll(int dailyroutineCode) {
		return dailycheckdao.deleteDailycheckAll(dailyroutineCode);
	}

	@Override
	public List<DailycheckVO> selectDailycheckList(String dailyroutineCode) {
		return dailycheckdao.selectDailycheckList(dailyroutineCode);
	}
}
