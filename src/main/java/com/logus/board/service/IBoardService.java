package com.logus.board.service;

import java.util.List;

import com.logus.board.model.BoardVO;

public interface IBoardService {
	int countBoard(int boardCategory);
	List<BoardVO> selectBoardList(int boardCategory);
	BoardVO selectBoardInfo(int boardCode);
	void insertBoard(BoardVO vo);
	void updateBoard(BoardVO vo);
	void deleteBoard(int boardCode);
}
