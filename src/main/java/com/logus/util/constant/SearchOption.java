package com.logus.util.constant;

// 검색 옵션 분류
// 작성자 : 이수봉
public class SearchOption {
	public static final int SEARCH_ALL = 0;			// 전체 검색
	public static final int SEARCH_TAG = 1;			// 태그 검색
	public static final int SEARCH_TITLE = 2;		// 제목 검색
	public static final int SEARCH_CONTENT = 3;		// 내용 검색
	public static final int SEARCH_NICKNAME = 4;	// 닉네임 검색
	
	/** 상수 값 변경 시 Mapper.xml도 확인 필요*/
}
