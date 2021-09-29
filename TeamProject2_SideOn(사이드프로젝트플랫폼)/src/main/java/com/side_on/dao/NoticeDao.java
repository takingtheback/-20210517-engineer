package com.side_on.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.side_on.dto.Notice;


@Mapper
public interface NoticeDao {

	public List<Notice> selectDashboardNoticeList();

	public List<Notice> selectNoticeList();

	public Notice selectNotice(String noticeNo);
	
	public int insertNotice(Notice dto);

	public List<Notice> selectAdminNoticeList();

	public Notice selectAdminNotice(String noticeNo);

}
