package com.logus.follow.service;

import java.util.List;

import com.logus.follow.model.FollowVO;

public interface IFollowService {
	
	
	// 팔로우 서비스 인터페이스
	public abstract int countFollowing(String memberId);		//사용자가 팔로우한 개수 반환
	public abstract List<FollowVO> selectFollowList(String memberId);		//팔로우한 목록 반환
	public abstract void insertFollow(FollowVO vo);		//팔로우 추가
	public abstract int deleteFollow(int followCode);	//팔로우 삭제

	
//-------------------------------------------------------------------------------------사용하지 않는 서비스 
	public abstract int upDateFollow(FollowVO vo);		//팔로우 수정
	public abstract int countFollower(String memberId);		//사용자를 팔로우한 개수 반환
	public abstract FollowVO selectFollow(int followCode);		//팔로우 하나의 데이터 조회
}
