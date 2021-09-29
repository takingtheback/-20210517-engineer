package com.side_on.dao;

import java.util.ArrayList;
import java.util.List;



import org.apache.ibatis.annotations.Mapper;

import com.side_on.dto.Criteria;
import com.side_on.dto.Find;
import com.side_on.dto.QnABoard;


@Mapper
public interface FindDao {
	
	/** 게시판 전체조회 */
	public ArrayList<Find> findMemberList();
	
	/** 게시글 세부조회 */
	public Find selectFindDetail(int find_no);
	
	/** 게시글 등록 */
	public int insertFindMember(Find dto);
	
	/** 게시글 수정 */
	public int updateFindMember(Find dto);

	/** 게시글 삭제 */
	public int deleteFindList(int find_no);


}
