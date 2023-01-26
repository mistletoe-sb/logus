package com.logus.manager.dao;

import java.util.ArrayList;

import com.logus.manager.model.ManagerVO;
import com.logus.member.model.MemberVO;

public interface IManagerDAO {
	void insertManager(ManagerVO vo);
	ManagerVO selectManager(String managerId);
	ArrayList<MemberVO> selectManagerList(String managerId);
}
