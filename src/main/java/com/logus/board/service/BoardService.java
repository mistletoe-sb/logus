package com.logus.board.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.logus.board.dao.IBoardDAO;
import com.logus.board.model.BoardVO;

@Service
// 작성자 : 배재연
public class BoardService implements IBoardService {

	@Autowired
	IBoardDAO boardDAO;
	
	@Override
	public int countBoard(int boardCategory) {
		return boardDAO.countBoard(boardCategory);
	}

	@Override
	public int countTotalPage(int boardCategory, int pageLimit) {
		int totalRecord = this.countBoard(boardCategory);
		int totalPage;
		
		if (totalRecord % pageLimit == 0){	// 총 게시글 수에서 페이지당 출력될 글 개수로 나눈 나머지가 0으로 몫이 딱 맞아 떨어질 경우.
	     	totalPage = totalRecord/pageLimit;	// 총 페이지는 총 게시글 수에서 페이지당 출력될 글 개수로 나눈 값.
	     	Math.floor(totalPage); 
		}
		else{	// 총 게시글 수에서 페이지당 출력될 글 개수로 나눈 나머지가 0이 아닐 경우.
		   totalPage = totalRecord/pageLimit;
		   Math.floor(totalPage);
		   totalPage = totalPage + 1;	// 총 페이지는 총 게시글 수에서 페이지당 출력될 글 개수로 나눈 몫 + 1.
		}
		return totalPage;
	}

	@Override
	public List<BoardVO> selectBoardList(int boardCategory, int pageLimit, int nowPage) {
		int totalRecord = this.countBoard(boardCategory);
		int beforeBoardCount = (nowPage - 1) * pageLimit;
		int indexBoardCount = beforeBoardCount + 1;
		
//		System.out.println("인덱스값:"+indexBoardCount);
		
		List<BoardVO> totalBoardList = boardDAO.selectBoardList(boardCategory);
		
		List<BoardVO> resultBoardList = new ArrayList<BoardVO>(pageLimit);
		
//		System.out.println("totalBoardList의 크기:"+totalBoardList.size());
//		System.out.println("resultBoardList의 크기:"+resultBoardList.size());
		
//		try {
			while(true) {
				if(indexBoardCount < (beforeBoardCount + pageLimit) && indexBoardCount <= totalRecord) {	// index값이 총 게시글수보다 작고 출력될 게시글 번호+9보다 작을 때까지 indexBoardCount에 +1하여 while문 진행
					resultBoardList.add(totalBoardList.get(indexBoardCount-1));
					indexBoardCount++;
//					System.out.println("resultBoardList의 크기2:"+resultBoardList.size());
				} else {
					break;	// index값이 게시글 번호+9에 도달하면 while문 탈출.
				}
			}
//		} catch(Exception e) {
//			System.out.println(e.getMessage());
//		}
		
		return resultBoardList;
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
