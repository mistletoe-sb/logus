package com.logus.statistics.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
// 작성자 : 배재연
public interface IStatisticsDAO {
	List<Map<String, Object>> countMemberJobList();
	List<Map<String, Object>> countMemberGenerationList();
	List<Map<String, Object>> selectTagList();
	List<Map<String, Object>> selectFollowedList();
	List<Map<String, Object>> selectDailyroutineList();
}
