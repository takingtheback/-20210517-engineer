package com.side_on.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.side_on.dao.RestDao;
import com.side_on.dto.Rest;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class RestService {

	@Autowired
	private RestDao restDao;
	
	public List<Rest> dashboardRestList(){
		List<Rest> restList = restDao.selectDashboardRestList();
		return restList;
	}
	
	/**
	 * rest List
	 * @return 신고 목록
	 */
	public List<Rest> restList() {
		List<Rest> restList = restDao.selectRestList();
		return restList;
	}
	
	/**
	 * rest detail
	 * @param restNo
	 * @return rest domain
	 */
	public Rest restDetail(String restNo) {
		Rest dto = restDao.selectRest(restNo);
		log.debug("No.dto REST :: " + restNo + ", " + dto);
		return dto;
	}

}
