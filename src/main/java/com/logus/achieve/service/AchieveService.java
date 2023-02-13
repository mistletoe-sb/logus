package com.logus.achieve.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.logus.achieve.dao.IAchieveDAO;
import com.logus.achieve.model.AchieveVO;


@Service
// 작성자 : 최영광
public class AchieveService implements IAchieveService {
	
	@Autowired
	private IAchieveDAO achievedao;
	
	@Override
	public void insertAchieve(AchieveVO vo) {
		achievedao.insertAchieve(vo);
	}

	@Override
	public int selectAchieve(String memberNickname, String today) {
		return achievedao.selectAchieve(memberNickname, today);
	}

	@Override
	public Integer selectAchieveToday(String memberNickname) {
		return achievedao.selectAchieveToday(memberNickname);
	}

	@Override
	public Integer selectAchieveWeek(String memberNickname) {
		return achievedao.selectAchieveWeek(memberNickname);
	}
	
	@Override
	public String getDateDayName() throws Exception {
		Date date = new Date(); // 오늘

		String day = "" ;
		   
		  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd") ;
		  String str = dateFormat.format(date);
		  java.util.Date nDate = dateFormat.parse(str);         
		  Calendar cal = Calendar.getInstance();
		  cal.setTime(nDate);         
		  int dayNum = cal.get(Calendar.DAY_OF_WEEK);         
		  
		  switch(dayNum){
		      case 1:
		          day = "일";  
		          break ;
		      case 2:
		          day = "월";
		          break ;
		      case 3:
		          day = "화";
		          break ;
		      case 4:
		          day = "수";
		          break ;
		      case 5:
		          day = "목";
		          break ;
		      case 6:
		          day = "금";
		          break ;
		      case 7:
		          day = "토";
		          break ;  
		  }
		  return day ;
	}
}
