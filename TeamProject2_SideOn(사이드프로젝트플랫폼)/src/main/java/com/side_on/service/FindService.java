package com.side_on.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.side_on.dao.FindDao;
import com.side_on.dto.Criteria;
import com.side_on.dto.Find;
import com.side_on.dto.QnABoard;
import com.side_on.util.Utility;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FindService {

	@Autowired
	private FindDao findDao;

	
	/** 게시글 전체조회 */
	public ArrayList<Find> findMemberList() {
		return findDao.findMemberList();
	}

	/** 게시글 상세조회 */
	public Find findMemberDetail(int find_no) {
		return findDao.selectFindDetail(find_no);
	}

	/** 게시글 작성 */
	public int insertFindMember(Find dto) {
		dto.setFind_date(Utility.getCurrentDate());
		int result = findDao.insertFindMember(dto);
		log.debug("dao result: " + result);
		return result;
	}


	/** 게시글 수정 */
	public int updateFindMember(Find dto) {
		dto.setFind_date(Utility.getCurrentDate());
		int result = findDao.updateFindMember(dto);
		log.debug("dao result: " + result);
		return result;
	}

	
	/** 게시글 삭제 */
	public int findMemberDelete(int find_no) {
		log.debug("### FindMember Delete :: ");
		int result = findDao.deleteFindList(find_no);
		return result;
	}

	
	


	
}
