package com.logus.util.constant.url;

// 달성율 URL 정의
public class AchieveURL {
	private static final String VIEW_REF = "achieve/";		// 뷰 위치
	
	public static final String INSERT_VIEWNAME = VIEW_REF + "achieve";		// 달성율 작성 view

	public static final String INFO_URL = "/achieve/check";			// 금일 달성율 작성(출석) 여부 확인 URL
	public static final String INSERT_FORM_URL = "/achieve";		// 달성율 작성 폼 URL
	public static final String INSERT_URL = "/achieve/save";		// 달성율 작성하기 URL
}
