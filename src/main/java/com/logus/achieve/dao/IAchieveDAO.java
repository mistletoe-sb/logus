package com.logus.achieve.dao;

import org.apache.ibatis.annotations.Param;

import com.logus.achieve.model.AchieveVO;

public interface IAchieveDAO {
	public void insertAchieve(AchieveVO vo);	//체크리스트를 통해 일일 달성률 체크(뷰에서 각 일정 상세 select로 받아서, DB에는 일일 총 달성율 하나만 저장)
	public int selectAchieve(@Param("memberNickname") String memberNickname, @Param("today") String today);	//오늘했는지 이미 출석을 했는지 체크, 이미 출석을 한 상태라면 메시지 출력
	
	//모달창 이용해서 버튼 클릭시 조회부터하고 경고창, 마지막으로 진짜 insert할지 물어보는 선택창으로 버튼별 메서드 구분->submit이라 모달은 힘들듯
	//그냥 if로 처리해서 return redirect page로 구분하는 게 맞을듯
	//☆아니다->ajax로 비동기적으로 select 먼저한 후, JS에서 return false, return true로 submit 구분하는 게 맞음
	
	public Integer selectAchieveToday(@Param("memberNickname") String memberNickname);	//오늘의 달성률
	public Integer selectAchieveWeek(@Param("memberNickname") String memberNickname);	//일주일 기준 달성률 합
	
	//public int updateAchieve();
	//public int deleteAchieve();
}
