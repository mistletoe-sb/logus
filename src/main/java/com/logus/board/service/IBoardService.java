package com.logus.board.service;

import java.util.List;

import com.logus.board.model.BoardVO;

// 작성자 : 배재연
public interface IBoardService {
	int countBoard(int boardCategory);
	int countTotalPage(int boardCategory, int pageLimit);
	List<BoardVO> selectBoardList(int boardCategory, int pageLimit, int nowPage);
	BoardVO selectBoardInfo(int boardCode);
	void insertBoard(BoardVO vo);
	void updateBoard(BoardVO vo);
	void deleteBoard(int boardCode);
}
