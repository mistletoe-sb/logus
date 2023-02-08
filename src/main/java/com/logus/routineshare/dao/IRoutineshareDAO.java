package com.logus.routineshare.dao;

import org.apache.ibatis.annotations.Param;

import com.logus.routineshare.model.RoutineshareVO;

public interface IRoutineshareDAO {
	//이미 받은 사람 검증(공유수 조작 제어용)
	public int selectRoutineshare(@Param("memberId") String memberId, @Param("dailyroutineCode") int dailyroutineCode);
	//이미 받은 사람이라면 공유자 정보 insert 하지 않음, 새로운 사람이라면 공유자 정보 insert
	public int insertRoutineshare(RoutineshareVO vo);
	
	//루틴 삭제 시 공유 수도 삭제
	public int deleteRoutineshare(@Param("dailyroutineCode") int dailyroutineCode);
}
