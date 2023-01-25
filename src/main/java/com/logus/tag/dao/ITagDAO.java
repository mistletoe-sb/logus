package com.logus.tag.dao;

import java.util.List;

import com.logus.dailyroutine.model.DailyroutineVO;
import com.logus.dailystory.model.DailystoryVO;
import com.logus.tag.model.TagVO;

public interface ITagDAO {
	public void insertTag(TagVO vo);
	public int updateTag(TagVO vo);
	public int deleteTag(String tagCode);
	public List<TagVO> selectTagList(String dailystoryCode, String dailyroutineCode);
	public List<DailystoryVO> findStoryTagList(String search);
	public List<DailyroutineVO> findRoutineTagList(String search);
	public List<DailystoryVO> findAllStoryList(String search);
	public List<DailyroutineVO> findAllRoutineList(String search);
}
