package com.logus.dailyroutine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.logus.dailyroutine.dao.IDailyroutineDAO;
import com.logus.dailyroutine.model.DailyroutineVO;

@Service
// 작성자 : 최영광
public class DailyroutineService implements IDailyroutineService {
	
	@Autowired
	private IDailyroutineDAO dailyroutinedao;
	
	@Override
	public int insertDailyroutine(DailyroutineVO vo) {
		 return dailyroutinedao.insertDailyroutine(vo);
	}
	
	@Override
	public int updateRoutineActive(String memberNickname, int dailyroutineWeekopt) {
		return dailyroutinedao.updateRoutineActive(memberNickname, dailyroutineWeekopt);
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
	public DailyroutineVO selectDailyroutineActive(String memberNickname, int dailyroutineWeekopt) {
		
		return dailyroutinedao.selectDailyroutineActive(memberNickname, dailyroutineWeekopt);
	}
	
	@Override
	public List<DailyroutineVO> selectDailyroutineList(String memberNickname, int dailyroutineWeekopt) {
		return dailyroutinedao.selectDailyroutineList(memberNickname, dailyroutineWeekopt);
	}

	@Override
	public List<DailyroutineVO> findDailyroutineList(String option, String search) {
		return dailyroutinedao.findDailyroutineList(option, search);
	}

	@Override
	public void updateRoutineShared(int dailyroutineCode) {
		
		dailyroutinedao.updateRoutineShared(dailyroutineCode);
	}
}
