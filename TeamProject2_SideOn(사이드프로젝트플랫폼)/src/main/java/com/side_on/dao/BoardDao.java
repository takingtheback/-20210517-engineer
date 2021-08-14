package com.side_on.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.side_on.dto.Criteria;
import com.side_on.dto.QnABoard;

@Mapper
public interface BoardDao {
	
	/** 게시판 전체조회 */
	public List<QnABoard> selectQnABoardList();
	
	/** 게시글 세부조회 */
	public QnABoard selectQnABoardDetail(int qnaBoardNo);
	
	/** 문의글 등록 */
	public int insertQnABoard(QnABoard dto);
	
	/** 게시판 목록(페이징 적용) */
    public List<QnABoard> getListPaging(Criteria cri);
	
	/** 게시판 총 갯수 */
	public int getTotal(Criteria cri);
	
	/** 문의글 수정 */
	public int updateQnABoard(QnABoard dto);

	/** 문의글 삭제 */
	public int deleteQnABoardList(int qnaBoardNo);

	/** 다중조건 조회 */
	public List<QnABoard> selectQnAListByCondition(String condition, String keyword);

	/** 문의글 조회수 증가 */
	public int updateQnABoardViews(int qnaBoardNo);

	
	
	

	

	

}
