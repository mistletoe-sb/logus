package com.logus.tag.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.logus.tag.dao.ITagDAO;
import com.logus.tag.model.TagVO;
import com.logus.util.constant.TagCategory;

@Service
// 태그 서비스 구현 클래스
public class TagService implements ITagService {

	private static Logger logger = LoggerFactory.getLogger(TagService.class);	// 로깅을 위한 객체 참조
	
	@Autowired
	private ITagDAO tagDAO;		// 태그 DAO 객체
	
	@Override
	@Transactional
	// 태그 추가(게시물 추가 시 작동)
	public void insertTags(List<TagVO> tags, int selectKey) {
		int check = 0;
		for(TagVO vo : tags) {
			vo.setDailystoryCode(Integer.toString(selectKey));	// 일일 스토리 코드 세팅
			check += tagDAO.insertTag(vo);						// 태그 추가(insert 반복)
		}
		if(check != tags.size()) {
			logger.debug("^ daily story tag insert failed.");	// insert된 태그 수가 일치하지 않는 경우 예외 발생
		}
	}

	@Override
	@Transactional
	// 태그 수정(게시물 수정 시 작동)
	public void updateTags(List<TagVO> tags) {
		int check = 0;
		for(TagVO item : tags) {
			check += tagDAO.updateTag(item);	// 태그 수정(update 반복)
		}
		if(check != tags.size()) {
			logger.debug("^ daily story tag update failed.");	// update된 태그 수가 일치하지 않는 경우 예외 발생
		}
	}

	@Override
	@Transactional
	// 태그 여러 개 삭제(게시물 수정 시 작동)
	public void deleteTags(List<Integer> tagCode) {
		// TODO Auto-generated method stub

	}

	@Override
	@Transactional
	// 해당 게시물의 태그 전체 삭제(게시물 삭제 시 작동)
	public void deleteAllTagInPost(int tagCategory, int foreignKeyCode, int tagCount) {
		// TODO Auto-generated method stub

	}

	@Override
	// 해당 게시물의 태그 목록 조회
	public List<TagVO> selectTagList(int tagCategory, int foreignKeyCode) {
		return tagDAO.selectTagList(tagCategory, foreignKeyCode);	// select
	}
	
	@Override
	// 문자열 형태로 나열된 태그들을 분리하여 TagVO 리스트로 반환하는 메서드(게시물 추가 시 입력받은 태그를 DB에 insert하기 위해 작동)
	public List<TagVO> makeTagList(String tags, int tagCategory, int foreignKeyCode){
		String[] splitTags = tags.split(" ");			// 태그가 나열된 문자열 split
		
		// split 배열을 TagVO 리스트로 변환(태그명, 카테고리, 게시물 코드 설정)
		List<TagVO> tagList = new ArrayList<TagVO>();
		for(String tagName : splitTags) {
			TagVO vo = new TagVO();			// 태그 VO 객체 생성
			vo.setTagName(tagName);			// 태그명 설정
			vo.setTagCategory(tagCategory);	// 카테고리 설정
			// 카테고리에 따라 게시물 코드 설정
			switch (tagCategory) {
				case TagCategory.DAILY_STORY:
					vo.setDailystoryCode(Integer.toString(foreignKeyCode));
					break;
				case TagCategory.DAILY_ROUTINE:
					vo.setDailyroutineCode(Integer.toString(foreignKeyCode));
					break;
			}
			tagList.add(vo);	// 리스트에 추가
		}
		return tagList;			// 생성한 리스트 반환
	}
	
	@Override
	// DB에서 select한 TagVO 리스트를 하나의 문자열 형태로 만들어 반환하는 메서드(게시물 수정 시 분리된 태그들을 하나의 입력 폼에 표시하기 위해 작동)
	public String makeTagString(List<TagVO> vo) {
		String tags = "";
		for(TagVO tag : vo) {
			String temp = tag.getTagName();
			if(temp.charAt(0) != '#') {
				temp = "#" + temp;		// 첫번째 위치가 #이 아니면 # 추가
			}
			tags += (temp + " ");		// 문자열 붙이기(공백으로 구분)
		}
		return tags;	// 생성한 문자열 반환
	}
}