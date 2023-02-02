package com.logus.statistics.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface IStatisticsDAO {
	List<Map<String, Object>> countMemberJobList();
	List<Map<String, Object>> countMemberGenerationList();
	List<Map<String, Object>> selectTagList();
	List<Map<String, Object>> selectFollowedList();
	List<Map<String, Object>> selectDailyroutineList();
}
