package com.logus.qna.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.logus.qna.dao.IQnaDAO;
import com.logus.qna.model.QnaVO;

public class QnaService implements IQnaService {

	@Autowired
	IQnaDAO qnaDAO;
	
	@Override
	public int countQna() {
		return qnaDAO.countQna();
	}

	@Override
	public int countQna(String memberNickname) {
		return qnaDAO.countQna(memberNickname);
	}

	@Override
	public ArrayList<QnaVO> selectQnaList() {
		return qnaDAO.selectQnaList();
	}

	@Override
	public ArrayList<QnaVO> selectQnaList(String memberNickname) {
		return qnaDAO.selectQnaList(memberNickname);
	}

	@Override
	public QnaVO selectQnaInfo(int qnaCode) {
		return qnaDAO.selectQnaInfo(qnaCode);
	}

	@Override
	public void insertQna(QnaVO vo) {
		qnaDAO.insertQna(vo);
	}

	@Override
	public void updateQ(QnaVO vo) {
		qnaDAO.updateQ(vo);
	}

	@Override
	public void deleteQna(int qnaCode) {
		qnaDAO.deleteQna(qnaCode);
	}

	@Override
	public void insertAnswer(QnaVO vo) {
		qnaDAO.insertAnswer(vo);
	}

	@Override
	public void updateAnswer(QnaVO vo) {
		qnaDAO.updateAnswer(vo);
	}

	@Override
	public void deleteAnswer(QnaVO vo) {
		qnaDAO.deleteAnswer(vo);
	}

}
