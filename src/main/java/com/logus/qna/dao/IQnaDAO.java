package com.logus.qna.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.logus.qna.model.QnaVO;

@Repository
public interface IQnaDAO {
	int countQna();
	int countQna(@Param("memberNickname") String memberNickname);
	List<QnaVO> selectQnaList();
	List<QnaVO> selectQnaList(@Param("memberNickname") String memberNickname);
	QnaVO selectQnaInfo(int qnaCode);
	void insertQna(QnaVO vo);
	void updateQ(QnaVO vo);
	void deleteQna(int qnaCode);
	void insertAnswer(QnaVO vo);
	void updateAnswer(QnaVO vo);
	void deleteAnswer(QnaVO vo);	
}
