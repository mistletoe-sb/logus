package com.logus.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.logus.board.model.BoardVO;

@Repository
public interface IBoardDAO {
	int countBoard(int boardCategory);
	List<BoardVO> selectBoardList(int boardCategory);
	BoardVO selectBoardInfo(int boardCode);
	void insertBoard(BoardVO vo);
	void updateBoard(BoardVO vo);
	void deleteBoard(int boardCode);
}
