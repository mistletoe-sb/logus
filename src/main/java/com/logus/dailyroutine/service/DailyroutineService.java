package com.logus.dailyroutine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.logus.dailyroutine.dao.IDailyroutineDAO;
import com.logus.dailyroutine.model.DailyroutineVO;

@Service
public class DailyroutineService implements IDailyroutineService {
	
	@Autowired
	private IDailyroutineDAO dailyroutinedao;
	
	@Override
	public void insertDailyroutine(DailyroutineVO vo) {
		 dailyroutinedao.insertDailyroutine(vo);
	}

	@Override
	public int updateDailyroutine(DailyroutineVO vo) {
		return dailyroutinedao.updateDailyroutine(vo);
	}

	@Override
	public int deleteDailyroutine(int dailyroutineCode) {
		return dailyroutinedao.deleteDailyroutine(dailyroutineCode);
	}

	@Override
	public DailyroutineVO selectDailyroutineInfo(int dailyroutineCode) {
		return dailyroutinedao.selectDailyroutineInfo(dailyroutineCode);
	}

	@Override
	public List<DailyroutineVO> selectDailyroutineList(String memberNickname) {
		return dailyroutinedao.selectDailyroutineList(memberNickname);
	}

	@Override
	public List<DailyroutineVO> findDailyroutineList(String option, String search) {
		return dailyroutinedao.findDailyroutineList(option, search);
	}

}
