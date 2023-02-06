package com.logus.follow.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.logus.dailystory.service.DailystoryService;
import com.logus.follow.dao.IFollowDAO;
import com.logus.follow.model.FollowVO;

@Service
//팔로우 서비스 구현 클래스
public class FollowService implements IFollowService {
	
	
	private static Logger logger = LoggerFactory.getLogger(DailystoryService.class); //로깅을 위한 객체 참조
	
	
	

	@Autowired
	IFollowDAO followDAO;
	
	@Override
	//사용자가 팔로우한 개수 반환
	public int countFollowing(String memberId) {
		return followDAO.countFollowing(memberId);	
	
	
	}
	@Override
	//팔로우한 목록 반환
	public List<FollowVO> selectFollowList(String memberId) {		
		return followDAO.selectFollowList(memberId);
	}

	@Override
	//팔로우 추가
	public void insertFollow(FollowVO vo) {	
		followDAO.insertFollow(vo);
	}

	@Override
	//팔로우 삭제
	public int deleteFollow(int followCode) {
		return followDAO.deleteFollow(followCode);
	}
/* 사용하지 않는
	@Override
	//팔로우 수정
	public int upDateFollow(FollowVO vo) {
		return followDAO.upDateFollow(vo);
	}

	@Override
	//사용자를 팔로우한 개수 반환
	public int countFollower(String member_Id) {
		return followDAO.countFollower(member_Id);
	}

	@Override
	//팔로우 하나의 데이터 조회
	public FollowVO selectFollow(int followCode) {
		return null;
	}
*/	
}
