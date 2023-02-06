package com.logus.util.filemanager;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
// 파일 업로드, 다운로드, 삭제 기능 제공
public class FileManager {
	private static Logger logger = LoggerFactory.getLogger(FileManager.class);
	
	// 파일 업로드 기능(파일명 반환)
	public String uploadFile(String serviceName, MultipartFile file, HttpSession session) throws IOException, IllegalStateException {
		String fileId = null;
		
		// 파일 크기가 0이 아니면(파일 존재)
		if(file.getSize() != 0) {
			// 파일명에 사용
			long t = System.currentTimeMillis();	// 현재 시간(밀리세컨드 단위)
			int r = (int)(Math.random()*1000000);	// 난수 생성

			// 파일 형식(확장자) 획득
			String[] originalFilename = file.getOriginalFilename().split("\\.");
			String fileType = originalFilename[originalFilename.length - 1];
			// 파일명 생성
			fileId = t + "_" + r + "." + fileType;
			// 파일 저장
			file.transferTo(getFile(serviceName, fileId, session));
		}
		return fileId;
	}
	
	// 파일 객체 반환
	public File getFile(String serviceName, String fileName, HttpSession session) {
		String filePath = session.getServletContext().getRealPath("/") + "resources\\images\\" + serviceName + "\\" + fileName;
		logger.info(filePath);
		return new File(filePath);
	}
}
