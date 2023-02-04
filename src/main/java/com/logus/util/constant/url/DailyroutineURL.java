package com.logus.util.constant.url;

// 일일 루틴 URL 정의
public class DailyroutineURL {
	private static final String VIEW_REF = "routine/";		// 뷰 위치
	
	public static final String LIST_VIEWNAME = VIEW_REF + "routinelist";	// 일일 루틴 목록 view
	public static final String INFO_VIEWNAME = VIEW_REF + "routine";		// 일일 루틴 상세 내용 view
	public static final String INSERT_VIEWNAME = VIEW_REF + "newroutine";	// 일일 루틴 작성 view
	public static final String UPDATE_VIEWNAME = VIEW_REF + "routinefix";	// 일일 루틴 수정 view

	public static final String LIST_URL = "/routinelist";							// 일일 루틴 목록 보기 URL
	public static final String INFO_URL = "/routine/{dailyroutineCode}";			// 일일 루틴 상세 내용 보기 URL
	public static final String INSERT_URL = "/newroutine";							// 일일 루틴 작성하기 URL
	public static final String UPDATE_FORM_URL = "/routinefix/{dailyroutineCode}";	// 일일 루틴 수정 폼 URL
	public static final String UPDATE_URL = "/routinefix";							// 일일 루틴 수정하기 URL
	public static final String DELETE_URL = "/routinedelete/{dailyroutineCode}";	// 일일 루틴 삭제하기 URL
}
