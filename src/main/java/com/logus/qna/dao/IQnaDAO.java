package com.logus.qna.dao;

import java.util.ArrayList;

import com.logus.qna.model.QnaVO;

public interface IQnaDAO {

	int countQna(int a);
	ArrayList<QnaVO> selectQnaList(int qnaCode, int b, int c);
	QnaVO selectQnaInfo(int qnaCode);
	void insertQna(QnaVO vo1);
	void updateQ(QnaVO vo2);
	void deleteQna(int qnaCode);
	void insertAnswer(QnaVO vo3);
	void updateAnswer(QnaVO vo4);
	void deleteAnswer(QnaVO vo5);	
}
