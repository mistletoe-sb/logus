package com.logus.member.model;

import java.sql.Date;

import lombok.Data;

@Data
// 회원정보 VO 클래스
public class MemberVO {
	private int memberCode;			// 회원번호
	private String memberId;		// ID
	private String memberPassword;	// 비밀번호
	private String memberNickname;	// 닉네임
	private String memberName;		// 이름
	private String memberEmail;		// 이메일
	private String memberPhone;		// 휴대폰 번호
	private Date memberBirth;		// 생년월일
	private int memberSex;			// 성별
	private String memberJob;		// 직업
	private String memberProfile;	// 프로필 사진 파일명
	private Date memberIndate;		// 가입일
	private Date memberOutdate;		// 탈퇴일
}
