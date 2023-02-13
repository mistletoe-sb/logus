package com.logus.qna.service;

import java.util.List;

import com.logus.qna.model.QnaVO;

// 작성자 : 배재연
public interface IQnaService {
	int countQna();
	int countQna(String memberNickname);
	int countTotalPage(int pageLimit);
	int countTotalPage(String memberNickname, int pageLimit);
	List<QnaVO> selectQnaList(int pageLimit, int nowPage);
	List<QnaVO> selectQnaList(String memberNickname, int pageLimit, int nowPage);
	QnaVO selectQnaInfo(int qnaCode);
	void insertQna(QnaVO vo);
	void updateQ(QnaVO vo);
	void deleteQna(int qnaCode);
	void insertAnswer(QnaVO vo);
	void updateAnswer(QnaVO vo);
	void deleteAnswer(QnaVO vo);	
}
