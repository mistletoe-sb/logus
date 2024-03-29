package com.logus.member.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.logus.member.model.MemberVO;

// 회원정보 DAO 인터페이스
// 작성자 : 정재웅
public interface IMemberDAO {
	int countMember(@Param("isExit")boolean isExit);									// 전체 회원 수 반환
	int countMemberId(String memberId);	
	int countMemberNickname(String memberNickname);	
	int countMemberPhone(String memberPhone);
	int countMember(@Param("nameAttr") String nameAttr, @Param("value") int value);		// 성별 해당하는 회원 수 반환
	int countMember(@Param("nameAttr") String nameAttr, @Param("value") String value);	// 직업 해당하는 회원 수 반환
	int countMember(@Param("nameAttr") String nameAttr, @Param("value") Date value);	// 나이 해당하는 회원 수 반환
	
	MemberVO selectMemberInfo(String memberId);											// 해당 ID의 회원정보 반환
	MemberVO selectMemberInfo2(String memberNickname);									// 해당 닉네임의 회원정보 반환
	
	
	List<MemberVO> selectMemberList();													// 전체 회원정보 목록 반환
	List<MemberVO> selectMemberList(@Param("isExit")boolean isExit);					// 탈퇴 여부에 따라 회원정보 목록 반환(true:탈퇴/false:현재회원)
	
	// 해당하는 ID 목록 반환(이메일 or 휴대폰 번호 입력)
	List<MemberVO> findMember(MemberVO vo);
	
	// 해당하는 ID 반환(ID + 이메일 or 휴대폰 번호 입력)
	String findMembers(String memberName, String memberEmail, String memberPhone);
	
	int insertMember(MemberVO vo);														// 회원정보 insert
	int updateMember(MemberVO vo);														// 회원정보 update
	int updatePassword(MemberVO vo);
	int outMember(String memberId);													// 해당 ID의 탈퇴일 update
	int deleteMember(String memberId);													// 해당 ID의 회원정보 delete	
}	
