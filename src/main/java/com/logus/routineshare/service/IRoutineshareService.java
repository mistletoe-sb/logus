package com.logus.routineshare.service;


import com.logus.routineshare.model.RoutineshareVO;

// 작성자 : 최영광
public interface IRoutineshareService {
	public int selectRoutineshare(String memberId, int dailyroutineCode);
	public int insertRoutineshare(RoutineshareVO vo);
	public int deleteRoutineshare(int dailyroutineCode);
}
