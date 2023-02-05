package com.logus.member.service;

import java.util.List;

import com.logus.member.model.MemberVO;

// 회원정보 관련 서비스 인터페이스
public interface IMemberService {
	int countMember();
	int ckeckId(String id);
	int ckeckNickname(String nickname);
	int ckeckPhone(String phone);
	void insertMember(MemberVO vo);		// 회원가입 서비스
	void updateMember(MemberVO vo);		// 정보수정 서비스
	void exitMember(String memberId);	// 회원탈퇴 서비스
	MemberVO selectMemberInfo(String memberId);	// 해당 회원정보 검색 서비스
	MemberVO loginCheck(String memberId, String memberPassword);	// 로그인 유효성 검사 서비스
	boolean overlapCheck(String nameAttr, String value);			// 중복 검사 서비스(ID, 닉네임)
	List<MemberVO> findId(MemberVO vo);				// ID 찾기 서비스
	String findPassword(String memberId, String nameAttr, String value);	// 비밀번호 찾기 서비스
}
