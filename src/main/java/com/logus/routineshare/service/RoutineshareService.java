package com.logus.routineshare.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.logus.routineshare.dao.IRoutineshareDAO;
import com.logus.routineshare.model.RoutineshareVO;

@Service
public class RoutineshareService implements IRoutineshareService {

	@Autowired
	IRoutineshareDAO iRoutineshareDAO;
	
	@Override
	public int selectRoutineshare(String memberId, int dailyroutineCode) {
		return iRoutineshareDAO.selectRoutineshare(memberId, dailyroutineCode);
	}

	@Override
	public int insertRoutineshare(RoutineshareVO vo) {
		return iRoutineshareDAO.insertRoutineshare(vo);
	}

	@Override
	public int deleteRoutineshare(int dailyroutineCode) {
		return iRoutineshareDAO.deleteRoutineshare(dailyroutineCode);
	}

}
