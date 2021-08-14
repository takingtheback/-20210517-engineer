package com.side_on.service;

import java.util.List;

import javax.websocket.Session;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.side_on.dao.BoardDao;
import com.side_on.dto.Criteria;
import com.side_on.dto.Member;
import com.side_on.dto.QnABoard;
import com.side_on.util.Utility;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardService {

	@Autowired
	private BoardDao boardDao;


	/** 게시글 전체조회 */
	public List<QnABoard> QnABoardList() {
		log.debug("### BoardService");
		return boardDao.selectQnABoardList();
	}

	/** 게시글 상세조회 
	 *  문의글 조회수 증가 
	 */
	public QnABoard QnABoardDetail(int qnaBoardNo) {
		boardDao.updateQnABoardViews(qnaBoardNo);
		return boardDao.selectQnABoardDetail(qnaBoardNo);
	}

	/** 게시글 작성 */
	public int addQnABoard(QnABoard dto) {
		dto.setQnaBoardDate(Utility.getCurrentDate());
		dto.setQnaBoardViews(0);
		int result = boardDao.insertQnABoard(dto);
		log.debug("dao result: " + result);
		return result;
	}

	
     /** 게시물 총 갯수 */
	public int getTotal(Criteria cri) {
		
		return boardDao.getTotal(cri);
	}		
	
    
    /** 게시판 목록(페이징 적용) */
	public List<QnABoard> getListPaging(Criteria cri) {
		
		return boardDao.getListPaging(cri);
		
	}

	/** 게시글 수정 */
	public int updateQnABoard(QnABoard dto) {
		dto.setQnaBoardDate(Utility.getCurrentDate());
		int result = boardDao.updateQnABoard(dto);
		log.debug("dao result: " + result);
		return result;
	}

	
	/** 게시글 삭제 */
	public int QnABoardDelete(int qnaBoardNo) {
		log.debug("### QnABoardDelete");
		int result = boardDao.deleteQnABoardList(qnaBoardNo);
		return result;
	}

	/** 다중조건 조회 */
	public List<QnABoard> QnAListByCondition(String condition, String keyword) {
		return boardDao.selectQnAListByCondition(condition, keyword);
	}

	
	


	
}
