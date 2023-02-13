package com.logus.manager.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.logus.manager.dao.IManagerDAO;
import com.logus.manager.model.ManagerVO;
import com.logus.member.dao.IMemberDAO;
import com.logus.member.model.MemberVO;

@Service
// 작성자 : 배재연
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
	public int countManager(String managerId) {
		return managerDAO.countManager(managerId);
	}
	
	@Override
	public int countManagerNickname(String managerNickname) {
		return managerDAO.countManagerNickname(managerNickname);
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

	@Override
	public int countMember(boolean isExit) {
		return memberDAO.countMember(isExit);
	}
	
	@Override
	public List<MemberVO> selectMemberList() {
		return memberDAO.selectMemberList();
	}

}
