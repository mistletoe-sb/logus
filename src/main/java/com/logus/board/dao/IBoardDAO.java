package com.logus.board.dao;

import java.util.List;

import com.logus.board.model.BoardVO;

public interface IBoardDAO {
	int countBoard(int boardCategory);
	List<BoardVO> selectBoardList(int boardCategory);
	BoardVO selectBoardInfo(int boardCode);
	void insertBoard(BoardVO vo1);
	void updateBoard(BoardVO vo2);
	void deleteBoard(int boardCode);
	
}
