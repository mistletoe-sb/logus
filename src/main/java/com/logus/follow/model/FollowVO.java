package com.logus.follow.model;

import lombok.Data;

@Data
//팔로우 VO 클래스
public class FollowVO {
	private int followCode;					//팔로우 번호
	private String memberId;			//팔로우 한 아이디	
	private String followingMemberId;		//팔로우 추가된 아이디
	
}
