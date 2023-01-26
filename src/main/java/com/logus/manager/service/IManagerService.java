package com.logus.manager.service;

import java.util.ArrayList;

import com.logus.manager.model.ManagerVO;
import com.logus.member.model.MemberVO;

public interface IManagerService {
	void insertManager(ManagerVO vo);
	ManagerVO selectManagerInfo(String managerId);
	ArrayList<MemberVO> selectManagerList();
	void deleteManager(String managerId);
}
