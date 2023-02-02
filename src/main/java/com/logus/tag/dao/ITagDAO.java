package com.logus.tag.dao;

import java.util.List;

import com.logus.tag.model.TagVO;

// 태그 DAO 인터페이스
public interface ITagDAO {
	public int insertTag(TagVO vo);					// 태그 추가
	public int updateTag(TagVO vo);					// 태그 수정
	public int deleteTag(List<Integer> tagCode);	// 태그 여러 개 삭제
	public int deleteTag(int tagCategory, int foreignKeyCode, int tagCount);	// 해당 게시물의 태그 전체 삭제
	public List<TagVO> selectTagList(int tagCategory, int foreignKeyCode);		// 해당 게시물의 태그 목록 조회
}
