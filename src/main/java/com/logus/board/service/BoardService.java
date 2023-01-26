package com.logus.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.logus.board.dao.IBoardDAO;
import com.logus.board.model.BoardVO;

public class BoardService implements IBoardService {

	@Autowired
	IBoardDAO boardDAO;
	
	@Override
	public int countBoard(int boardCategory) {
		return boardDAO.countBoard(boardCategory);
	}

	@Override
	public List<BoardVO> selectBoardList(int boardCategory) {
		return boardDAO.selectBoardList(boardCategory);
	}

	@Override
	public BoardVO selectBoardInfo(int boardCode) {
		return boardDAO.selectBoardInfo(boardCode);
	}

	@Override
	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}

	@Override
	public void deleteBoard(int boardCode) {
		boardDAO.deleteBoard(boardCode);
	}

}
