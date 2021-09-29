package com.side_on.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.side_on.dto.Criteria;
import com.side_on.dto.QnABoard;

@Mapper
public interface BoardDao {
	
	/**
	 * 게시판 전체조회
	 * @return selectQnABoardList()
	 */
	public List<QnABoard> selectQnABoardList();
	
	/**
	 * 게시글 세부조회
	 * @param qnaBoardNo
	 * @return selectQnABoardDetail
	 */
	public QnABoard selectQnABoardDetail(int qnaBoardNo);
	
	/**
	 * 문의글 등록
	 * @param dto
	 * @return insertQnABoard
	 */
	public int insertQnABoard(QnABoard dto);
	
	/**
	 * 게시판 목록(페이징 적용)
	 * @param cri
	 * @return getListPaging
	 */
    public List<QnABoard> getListPaging(Criteria cri);
	
    /**
     * 게시판 총 갯수
     * @param cri
     * @return getTotal
     */
	public int getTotal(Criteria cri);
	
	/**
	 * 문의글 수정
	 * @param dto
	 * @return updateQnABoard
	 */
	public int updateQnABoard(QnABoard dto);

	/**
	 * 문의글 삭제
	 * @param qnaBoardNo
	 * @return deleteQnABoardList
	 */
	public int deleteQnABoardList(int qnaBoardNo);

	/**
	 * 다중조건 조회
	 * @param condition
	 * @param keyword
	 * @return selectQnAListByCondition
	 */
	public List<QnABoard> selectQnAListByCondition(String condition, String keyword);

	/**
	 * 문의글 조회수 증가
	 * @param qnaBoardNo
	 * @return updateQnABoardViews
	 */
	public int updateQnABoardViews(int qnaBoardNo);
}
