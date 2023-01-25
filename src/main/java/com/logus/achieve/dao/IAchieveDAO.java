package com.logus.achieve.dao;

import com.logus.achieve.model.AchieveVO;

public interface IAchieveDAO {
	public void insertAchieve(AchieveVO vo);
	//public int updateAchieve();
	//public int deleteAchieve();
	public AchieveVO selectAchieveInfo(String memberId);
}
