package com.side_on.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.side_on.dao.MemberDao;
import com.side_on.dao.NoticeDao;
import com.side_on.dao.RestDao;
import com.side_on.dto.Rest;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class RestService {

	@Autowired
	private RestDao restDao;
		
	@Autowired 
	private MemberDao memberDao;
	
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
	 * 신고 처리 
	 * @param restNo 신고 번호
	 * @param restResult 신고 처리 결과
	 */
	public void restManageModal(String restNo, String restResult) {
		log.debug(restNo + " / " + restResult);
		restDao.updateRestManageModal(restNo, restResult);
		if(restResult.equals("신고접수")) {
			String memberId = restDao.selectRestUserForCount(restNo);
			log.debug("### " + memberId);
			restDao.updateRestCount(memberId);
		} else {
			int recruit_num = restDao.selectRestPostNo(restNo);
			log.debug("### " + recruit_num);
			restDao.updatePostCondition(recruit_num);
		}
	}

	/**
	 * 신고 접수
	 * @param noticeNo 글 번호
	 * @param reason 신고 사유
	 */
	public void restReportModal(int recruit_num, String reason) {
		log.debug(recruit_num + "/" + reason);
		if(reason != null) {			
			String memberId = restDao.selectRestWriteUser(recruit_num);
			log.debug("### " + memberId);
			restDao.updatePostCondition(recruit_num);
			if(memberId != null) {
				restDao.insertRest(recruit_num, memberId, reason);
				log.debug(memberId + "/" + recruit_num + "/" + reason);
			}
		} else { 
			log.debug("사유 부재 업데이트 실패" + recruit_num);
		}
	}
	
	public int restUnConfirmCount() {
		log.debug("### restUnConfirmCount :: ");
		int result = restDao.selectRestUnConfirmCount();
		return result;
	}

}
