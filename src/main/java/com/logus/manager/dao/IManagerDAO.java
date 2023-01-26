package com.logus.manager.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.logus.manager.model.ManagerVO;
import com.logus.member.model.MemberVO;

@Repository
public interface IManagerDAO {
	int countManager();
	void insertManager(ManagerVO vo);
	ManagerVO selectManagerInfo(String managerId);
	ArrayList<MemberVO> selectManagerList();
	void deleteManager(String managerId);
}
