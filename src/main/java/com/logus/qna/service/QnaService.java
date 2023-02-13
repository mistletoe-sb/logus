package com.logus.qna.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.logus.qna.dao.IQnaDAO;
import com.logus.qna.model.QnaVO;

@Service
// 작성자 : 배재연
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
	public int countTotalPage(int pageLimit) {
		int totalRecord = this.countQna();
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
	public int countTotalPage(String memberNickname, int pageLimit) {
		int totalRecord = this.countQna(memberNickname);
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
	public List<QnaVO> selectQnaList(int pageLimit, int nowPage) {
		int totalRecord = this.countQna();
		int beforeQnaCount = (nowPage - 1) * pageLimit;
		int indexQnaCount = beforeQnaCount + 1;
				
		List<QnaVO> totalQnaList = qnaDAO.selectQnaList();
		
		List<QnaVO> resultQnaList = new ArrayList<QnaVO>(pageLimit);
		
		while(true) {
			if(indexQnaCount < (beforeQnaCount + pageLimit) && indexQnaCount <= totalRecord) {	// index값이 총 게시글수보다 작고 출력될 게시글 번호+9보다 작을 때까지 indexBoardCount에 +1하여 while문 진행
				resultQnaList.add(totalQnaList.get(indexQnaCount-1));
				indexQnaCount++;
			} else {
				break;	// index값이 게시글 번호+9에 도달하면 while문 탈출.
			}
		}
		
		return resultQnaList;
	}

	@Override
	public List<QnaVO> selectQnaList(String memberNickname, int pageLimit, int nowPage) {
		int totalRecord = this.countQna(memberNickname);
		int beforeQnaCount = (nowPage - 1) * pageLimit;
		int indexQnaCount = beforeQnaCount + 1;
				
		List<QnaVO> totalQnaList = qnaDAO.selectQnaList(memberNickname);
		
		List<QnaVO> resultQnaList = new ArrayList<QnaVO>(pageLimit);
		
		while(true) {
			if(indexQnaCount < (beforeQnaCount + pageLimit) && indexQnaCount <= totalRecord) {	// index값이 총 게시글수보다 작고 출력될 게시글 번호+9보다 작을 때까지 indexBoardCount에 +1하여 while문 진행
				resultQnaList.add(totalQnaList.get(indexQnaCount-1));
				indexQnaCount++;
			} else {
				break;	// index값이 게시글 번호+9에 도달하면 while문 탈출.
			}
		}
		
		return resultQnaList;
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
