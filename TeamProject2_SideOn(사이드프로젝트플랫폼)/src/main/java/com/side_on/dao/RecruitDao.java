package com.side_on.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.side_on.dto.Criteria;
import com.side_on.dto.CriteriaRc;
import com.side_on.dto.RecruitBoard;
import com.side_on.dto.RecruitCriteria;

@Mapper
public interface RecruitDao {


	//게시글 등록
	public int insertRecruitBoard(RecruitBoard recruitBoard);

	//게시글 총 갯수
	public int allCount(Criteria cri);
	
	//게시글 전체 리스트
	public List<RecruitBoard> getListPaging(Criteria cri);
	public ArrayList<RecruitBoard> memberAll();

	public RecruitBoard memberDetail(int recruit_num);
	





	

}
