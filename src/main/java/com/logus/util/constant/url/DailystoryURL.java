package com.logus.util.constant.url;

//일일 스토리 URL 정의
public class DailystoryURL {
	private static final String VIEW_REF = "dailystory/";		// 뷰 위치
	
	public static final String LIST_VIEWNAME = VIEW_REF + "storylist";		// 일일 스토리 목록 view
	public static final String INFO_VIEWNAME = VIEW_REF + "storydetail";	// 일일 스토리 상세 내용 view
	public static final String INSERT_VIEWNAME = VIEW_REF + "insertform";	// 일일 스토리 작성 view
	public static final String UPDATE_VIEWNAME = VIEW_REF + "updateform";	// 일일 스토리 수정 view

	public static final String LIST_URL = "{memberNickname}/library/main";						// 일일 스토리 목록 보기 URL
	public static final String INFO_URL = "{memberNickname}/library/story/{dailystoryCode}";	// 일일 스토리 상세 내용 보기 URL
	public static final String INSERT_URL = "/{memberNickname}/library/story/insert";			// 일일 스토리 작성하기 URL
	public static final String UPDATE_FORM_URL = "/{memberNickname}/library/story/{dailystoryCode}/update";	// 일일 스토리 수정 폼 URL
	public static final String UPDATE_URL = "/{memberNickname}/library/story/update";					// 일일 스토리 수정하기 URL
	public static final String DELETE_URL = "/{memberNickname}/library/story/{dailystoryCode}/delete";	// 일일 스토리 삭제하기 URL
	public static final String SEARCH_URL = "library/search";											// 일일 스토리 내 검색하기 URL
}
