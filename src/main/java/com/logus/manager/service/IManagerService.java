package com.logus.manager.service;

import java.util.ArrayList;
import java.util.List;

import com.logus.manager.model.ManagerVO;
import com.logus.member.model.MemberVO;

// 작성자 : 배재연
public interface IManagerService {
	int countManager();
	int countManager(String managerId);
	int countManagerNickname(String managerNickname);
	void insertManager(ManagerVO vo);
	ManagerVO selectManagerInfo(String managerId);
	ArrayList<MemberVO> selectManagerList();
	void deleteManager(String managerId);
	
	int countMember(boolean isExit);
	List<MemberVO> selectMemberList();	
}
