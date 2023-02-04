package com.logus.util.constant.url;

import com.logus.util.redirectencoder.RedirEncoder;

// redirect용 URL 생성 메서드를 제공하는 클래스
public class RedirURLMaker {
	private static final String REDIR = "redirect:";			// redirect 키워드
	
	public static final String REDIR_INDEX_URL = REDIR + "/";	// 인덱스 페이지 redirect URL
	
	// redirect URL 생성
	public static String makeRedirURL(String url) {
		return REDIR + url;
	}
	
	// 게시물 목록 보기 URL 생성(카테고리에 따라 다른 게시판으로 이동)
	public static String makeRedirURLBoardList(int boardCategory) {
		StringBuffer str = new StringBuffer(REDIR);
		str.append(BoardURL.LIST_URL).append("?boardcategory=").append(boardCategory);
		return str.toString();
	}
	
	// 일일 스토리 목록 보기 URL(닉네임에 따라 해당 사용자의 스토리 목록으로 이동)
	public static String makeRedirURLStoryList(String memberNickname) {
		StringBuffer str = new StringBuffer(REDIR);
		str = str.append(DailystoryURL.LIST_URL).replace(str.indexOf("{") + 1, str.indexOf("}"), memberNickname);
		return RedirEncoder.encode(str.toString());
	}
}
