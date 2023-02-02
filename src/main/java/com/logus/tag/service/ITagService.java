package com.logus.tag.service;

import java.util.List;

import com.logus.tag.model.TagVO;

// 태그 서비스 인터페이스
public interface ITagService {
	public abstract void insertTags(List<TagVO> tags, int selectKey);	// 태그 추가(게시물 추가 시 작동)
	public abstract void updateTags(TagVO[] tags);						// 태그 수정(게시물 수정 시 작동)
	public abstract void deleteTags(List<Integer> tagCode);				// 태그 여러 개 삭제(게시물 수정 시 작동)
	public abstract void deleteAllTagInPost(int tagCategory, int foreignKeyCode, int tagCount);	// 해당 게시물의 태그 전체 삭제(게시물 삭제 시 작동)
	public abstract List<TagVO> selectTagList(int tagCategory, int foreignKeyCode);				// 해당 게시물의 태그 목록 조회
	public abstract List<TagVO> makeTagList(String tags, int tagCategory, int foreignKeyCode);	// 태그 목록 생성(태그 나열된 문자열을 변환)
	public abstract String makeTagString(List<TagVO> vo);										// 태그 나열된 문자열 생성(DB에서 받은 태그 목록을 변환)
}
