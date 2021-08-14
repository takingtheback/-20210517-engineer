package com.side_on.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.side_on.dao.RecruitDao;
import com.side_on.dto.Criteria;
import com.side_on.dto.CriteriaRc;
import com.side_on.dto.QnABoard;
import com.side_on.dto.RecruitBoard;
import com.side_on.dto.RecruitCriteria;
import com.side_on.dto.RecruitPaging;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class RecruitService {

	@Autowired
	private  RecruitDao dao;

	/** 모집 게시글 등록*/
	public int insertRecruitBoard(RecruitBoard recruitBoard) {
		int result = dao.insertRecruitBoard(recruitBoard);
		return result;
	}

	/** 모집 게시글 총 갯수 조회*/
	public int allCount(Criteria cri) {
		return dao.allCount(cri) ;
	}

	/** 모집 게시글 데이터 전체 조회 */
	public List<RecruitBoard>  getListPaging(Criteria cri) {
		return dao.getListPaging(cri);
	}

	public ArrayList<RecruitBoard> memberAll() {
		return dao.memberAll();
	}

	public RecruitBoard memberDetail(int recruit_num) {
		return dao.memberDetail(recruit_num);
	}

	



	
	/**게시글 목록 조회*/

	
	/**게시글 총 조회*/
	

}
