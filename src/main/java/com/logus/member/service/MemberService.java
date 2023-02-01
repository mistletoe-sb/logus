package com.logus.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.logus.member.dao.IMemberDAO;
import com.logus.member.model.MemberVO;

@Service
// 회원정보 관련 서비스 구현 클래스
public class MemberService implements IMemberService {

	@Autowired
	private IMemberDAO memberDAO;	// MemberDAO 객체
	
	@Override
	// 전체 회원 수 반환
	public int countMember(boolean isExist) {
		return memberDAO.countMember(isExist);
	}
	
	@Override
	// 회원가입 서비스
	public void insertMember(MemberVO vo) {
		memberDAO.insertMember(vo);
	}

	@Override
	// 정보수정 서비스
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);
	}

	@Override
	// 회원탈퇴 서비스
	public void exitMember(String memberId) {
		memberDAO.updateMember(memberId);
	}

	@Override
	// 해당 ID의 회원정보 검색 서비스
	public MemberVO selectMemberInfo(String memberId) {
		return memberDAO.selectMemberInfo(memberId);
	}

	@Override
	// 로그인 유효성 검사 서비스
	public MemberVO loginCheck(String memberId, String memberPassword) {
		MemberVO vo = selectMemberInfo(memberId);	// 입력한 ID와 일치하는 회원정보 검색
		if(vo == null) {
			// 존재하지 않는 ID입니다. >> 예외처리
		} else {
			if(memberPassword.equals(vo.getMemberPassword())) {
				return vo;
			} else {
				
				// 비밀번호가 일치하지 않습니다. >> 예외처리
			}
		}
		return null;
	}

	@Override
	// 중복 검사 서비스
	public boolean overlapCheck(String nameAttr, String value) {
		int count = memberDAO.countMember(nameAttr, value);
		if(count == 0) {
			return true;
		} else {
			// 중복된 ~~입니다. >> 예외처리(name)
		}
		return false;
	}
	
	public int ckeckId(String id) {
		int result = memberDAO.countMemberId(id);
		return result;
	}
	
	public int ckeckNickname(String nickname) {
		int result = memberDAO.countMemberNickname(nickname);
		return result;
	}

	@Override
	// ID 찾기 서비스
	public List<String> findId(String nameAttr, String value) {
		return memberDAO.findMember(nameAttr, value);
	}

	@Override
	// 비밀번호 찾기 서비스
	public String findPassword(String memberId, String nameAttr, String value) {
		return memberDAO.findMember(memberId, nameAttr, value);
	}

}
