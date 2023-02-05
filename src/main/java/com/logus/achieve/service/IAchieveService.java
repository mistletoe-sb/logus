package com.logus.achieve.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import com.logus.achieve.model.AchieveVO;

public interface IAchieveService {
	public void insertAchieve(AchieveVO vo);
	public int selectAchieve(String memberNickname, String today);
	public Integer selectAchieveToday(String memberNickname);
	public Integer selectAchieveWeek(String memberNickname);
	public String getDateDayName() throws Exception;
}
