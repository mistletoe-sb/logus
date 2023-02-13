package com.logus.achieve.service;

import com.logus.achieve.model.AchieveVO;

//작성자 : 최영광
public interface IAchieveService {
	public void insertAchieve(AchieveVO vo);
	public int selectAchieve(String memberNickname, String today);
	public Integer selectAchieveToday(String memberNickname);
	public Integer selectAchieveWeek(String memberNickname);
	public String getDateDayName() throws Exception;
}
