package com.logus.qna.service;

import java.util.ArrayList;

import com.logus.qna.model.QnaVO;

public interface IQnaService {
	int countQna();
	int countQna(String memberNickname);
	ArrayList<QnaVO> selectQnaList();
	ArrayList<QnaVO> selectQnaList(String memberNickname);
	QnaVO selectQnaInfo(int qnaCode);
	void insertQna(QnaVO vo);
	void updateQ(QnaVO vo);
	void deleteQna(int qnaCode);
	void insertAnswer(QnaVO vo);
	void updateAnswer(QnaVO vo);
	void deleteAnswer(QnaVO vo);	
}
