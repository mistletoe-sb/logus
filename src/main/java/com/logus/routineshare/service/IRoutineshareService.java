package com.logus.routineshare.service;

import com.logus.routineshare.model.RoutineshareVO;

public interface IRoutineshareService {
	public int selectRoutineshare(String memberId, int dailyroutineCode);
	public int insertRoutineshare(RoutineshareVO vo);
}
