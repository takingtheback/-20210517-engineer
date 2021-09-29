package com.side_on.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.side_on.dao.NoticeDao;
import com.side_on.dto.Notice;
import com.side_on.util.Utility;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NoticeService {
	
	@Autowired
	private NoticeDao noticeDao;
	
	/**
	 * dashboard 노출 공지 상위 5 개 글 
	 * @return
	 */
	public List<Notice> dashboardNoticeList(){
		List<Notice> noticeList = noticeDao.selectDashboardNoticeList();
		return noticeList;
	}
	
	/**
	 * notice List
	 * @return 글 목록
	 */
	public List<Notice> noticeList() {
		List<Notice> noticeList = noticeDao.selectNoticeList();
		return noticeList;
	}
	
	/**
	 * notice detail
	 * @param noticeNo 글번호
	 * @return notice doamin
	 */
	public Notice noticeDetail(String noticeNo) {
		Notice dto = noticeDao.selectNotice(noticeNo);
		log.debug("No.dto NOTICE :: " + noticeNo + ", " + dto);
		return dto;
	}
	
	/**
	 * admin notice List
	 * @return 글 목록
	 */
	public List<Notice> adminNoticeList() {
		List<Notice> noticeList = noticeDao.selectAdminNoticeList();
		return noticeList;
	}
	
	/**
	 * admin notice detail
	 * @param noticeNo 글번호
	 * @return notice doamin
	 */
	public Notice adminNoticeDetail(String noticeNo) {
		Notice dto = noticeDao.selectAdminNotice(noticeNo);
		log.debug("No.dto NOTICE :: " + noticeNo + ", " + dto);
		return dto;
	}
	

	/**
	 * notice write
	 * @param dto 
	 * @return 
	 */
	public int addNotice(Notice dto) {
		dto.setNoticeDate(Utility.getCurrentDate());
		int result = noticeDao.insertNotice(dto);
		log.debug("dto :: " + dto);
		log.debug("notice dao result :: " + result);
		return result;
	}

	/**
	 * notice delete
	 * @param noticeNo
	 */
	public void deleteNoticeDetail(String noticeNo) {
		noticeDao.deleteNoticeDetailNo(noticeNo);
		log.debug("notice delete No. " + noticeNo);
	}

	
}
