package com.logus.statistics.service;

import java.util.List;
import java.util.Map;

// 작성자 : 배재연
public interface IStatisticsService {
	List<Map<String, Object>> countMemberJobList();
	List<Map<String, Object>> countMemberGenerationList();
	List<Map<String, Object>> selectTagList();
	List<Map<String, Object>> selectFollowedList();
	List<Map<String, Object>> selectDailyroutineList();
}
