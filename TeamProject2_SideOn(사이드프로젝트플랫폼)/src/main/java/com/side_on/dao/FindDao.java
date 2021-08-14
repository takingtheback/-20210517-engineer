package com.side_on.dao;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.side_on.dto.Find;


@Mapper
public interface FindDao {
	
	/** 게시판 전체조회 */
	public List<Find> selectFindList();
	
	/** 게시글 세부조회 */
	public Find selectFindDetail(String find_writer);
	
	/** 게시글 등록 */
	public int insertFindMember(Find dto);
	
	/** 게시글 수정 */
	public int updateFindMember(Find dto);

	/** 게시글 삭제 */
	public int deleteFindList(String find_writer);


}
