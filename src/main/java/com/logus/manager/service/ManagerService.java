package com.logus.manager.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.logus.manager.dao.IManagerDAO;
import com.logus.manager.model.ManagerVO;
import com.logus.member.dao.IMemberDAO;
import com.logus.member.model.MemberVO;

public class ManagerService implements IManagerService {

	@Autowired
	IManagerDAO managerDAO;
	
	@Autowired
	IMemberDAO memberDAO;

	@Override
	public int countManager() {
		return managerDAO.countManager();
	}
	
	@Override
	public void insertManager(ManagerVO vo) {
		managerDAO.insertManager(vo);
	}

	@Override
	public ManagerVO selectManagerInfo(String managerId) {
		return managerDAO.selectManagerInfo(managerId);
	}

	@Override
	public ArrayList<MemberVO> selectManagerList() {
		return managerDAO.selectManagerList();
	}

	@Override
	public void deleteManager(String managerId) {
		managerDAO.deleteManager(managerId);
	}

}
