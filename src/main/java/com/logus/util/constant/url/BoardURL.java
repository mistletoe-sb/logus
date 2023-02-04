package com.logus.util.constant.url;

// 게시판(공지사항, 월간 리포트) URL 정의
public class BoardURL {
	private static final String VIEW_REF = "manager/";		// 뷰 위치
	
	public static final String NOTICE_LIST_VIEWNAME = VIEW_REF + "notice";			// 공지사항 목록 view
	public static final String REPORT_LIST_VIEWNAME = VIEW_REF + "report";			// 월간 리포트 목록 view
	public static final String NOTICE_INFO_VIEWNAME = VIEW_REF + "noticedetail";	// 공지사항 상세 내용 view
	public static final String REPORT_INFO_VIEWNAME = VIEW_REF + "reportdetail";	// 월간 리포트 상세 내용 view
	public static final String NOTICE_INSERT_VIEWNAME = VIEW_REF + "insertnoticeform";	// 공지사항 작성 view
	public static final String REPORT_INSERT_VIEWNAME = VIEW_REF + "insertreportform";	// 월간 리포트 작성 view
	public static final String NOTICE_UPDATE_VIEWNAME = VIEW_REF + "updatenoticeform";	// 공지사항 수정 view
	public static final String REPORT_UPDATE_VIEWNAME = VIEW_REF + "updatereportform";	// 월간 리포트 수정 view
	
	public static final String INVALID_ACCESS_ERROR_VIEWNAME = VIEW_REF + "accessrestriction_manager";	// 접속 권한이 유효하지 않은 경우의 view

	public static final String LIST_URL = "/manager/board";						// 게시물 목록 보기 URL
	public static final String INFO_URL = "/manager/boarddetail";				// 게시물 상세 내용 보기 URL
	public static final String INSERT_FORM_URL = "/manager/insertboardform";	// 게시물 작성 폼 URL
	public static final String INSERT_URL = "/manager/insertboard";				// 게시물 작성하기 URL
	public static final String UPDATE_FORM_URL = "/manager/updateboardform";	// 게시물 수정 폼 URL
	public static final String UPDATE_URL = "/manager/updateboard";				// 게시물 수정하기 URL
	public static final String DELETE_URL = "/manager/deleteboard";				// 게시물 삭제하기 URL	
}
