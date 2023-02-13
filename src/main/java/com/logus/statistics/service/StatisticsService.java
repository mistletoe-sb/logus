package com.logus.statistics.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.logus.statistics.dao.IStatisticsDAO;

@Service
// 작성자 : 배재연
public class StatisticsService implements IStatisticsService {
	
	@Autowired
	IStatisticsDAO statisticsDAO;

	@Override
	public List<Map<String, Object>> countMemberJobList() {
		return statisticsDAO.countMemberJobList();
	}

	@Override
	public List<Map<String, Object>> countMemberGenerationList() {
		return statisticsDAO.countMemberGenerationList();
	}

	@Override
	public List<Map<String, Object>> selectTagList() {
		return statisticsDAO.selectTagList();
	}

	@Override
	public List<Map<String, Object>> selectFollowedList() {
		return statisticsDAO.selectFollowedList();
	}

	@Override
	public List<Map<String, Object>> selectDailyroutineList() {
		return statisticsDAO.selectDailyroutineList();
	}

}
