package com.logus.util.redirectencoder;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

// redirect 시 문자열 인코딩(UTF-8)을 위한 클래스
public class RedirEncoder {
	private static String encodingType = "UTF-8";	// 인코딩 설정(UTF-8)
	private static Logger logger = LoggerFactory.getLogger(RedirEncoder.class);
	
	// 문자열을 UTF-8로 인코딩
	public static String encode(String str) {
		String encodingStr = "";
		try {
			encodingStr = URLEncoder.encode(str, encodingType);	// 입력한 문자열을 정해둔 형식으로 인코딩
		} catch (UnsupportedEncodingException e) {
			logger.debug(str + " --- UTF-8 encoding failed");
			e.printStackTrace();
		}
		return encodingStr;		// 인코딩한 문자열 반환
	}
}
