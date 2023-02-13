package com.logus.tag.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.logus.tag.model.TagVO;

// 태그 DAO 인터페이스
// 작성자 : 이수봉
public interface ITagDAO {
	public abstract int insertTag(TagVO vo);		// 태그 추가
	public abstract int updateTag(TagVO vo);		// 태그 수정
	public abstract int deleteTag(int tagCode);		// 태그 삭제
	public abstract int deleteTags(@Param("tagCodes") List<Integer> tagCodes);			// 태그 여러 개 삭제
	public abstract int deleteAllTagInPost(@Param("tagCategory") int tagCategory, 
								 		@Param("foreignKeyCode") int foreignKeyCode);	// 해당 게시물의 태그 전체 삭제
	public abstract TagVO selectTagInfo(int tagCode);									// 해당 태그 정보 조회
	public abstract List<TagVO> selectTagList(@Param("tagCategory") int tagCategory,
										@Param("foreignKeyCode") int foreignKeyCode);	// 해당 게시물의 태그 목록 조회
	public abstract List<TagVO> selectAllTagList(@Param("tagCategory") int tagCategory,
								@Param("foreignKeyCode") List<Integer> foreignKeyCode);	// 해당 게시물 목록의 모든 태그 목록 조회
}
