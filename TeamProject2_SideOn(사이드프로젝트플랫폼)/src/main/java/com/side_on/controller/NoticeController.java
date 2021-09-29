package com.side_on.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.side_on.dto.Notice;
import com.side_on.service.NoticeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class NoticeController {

	@Autowired
	public NoticeService noticeService;
	
	@RequestMapping("/notice/noticeList")
	public String noticeList(Model model) {
		log.debug("[member] Notice List");
		List<Notice> noticeList = noticeService.noticeList(); 
		model.addAttribute("noticeList", noticeList);
		return "notice/noticeList";
	}
	
	@RequestMapping("/notice/noticeDetail")
	public String noticeDetail(String noticeNo, Model model) {
		log.debug("[member] Notice Detail");
		Notice dto = noticeService.noticeDetail(noticeNo);
		model.addAttribute("dto",dto);
		return "notice/noticeDetail";
	}
	
	@RequestMapping("/notice/adminNoticeList")
	public String adminNoticeList(Model model) {
		log.debug("[admin] Notice List");
		List<Notice> noticeList = noticeService.adminNoticeList(); 
		model.addAttribute("noticeList", noticeList);
		return "notice/adminNoticeList";
	}
	
	@RequestMapping("/notice/adminNoticeDetail")
	public String adminNoticeDetail(String noticeNo, Model model) {
		log.debug("[admin] Notice Detail");
		Notice dto = noticeService.adminNoticeDetail(noticeNo);
		model.addAttribute("dto",dto);
		return "notice/adminNoticeDetail";
	}
	
	@RequestMapping("/notice/adminNoticeForm")
	public String adminNoticeForm() {
		log.debug("[admin] notice Write Form");
		return "notice/adminNoticeForm";
	}
	
	@RequestMapping("/notice/noticeWrite")
	public String noticeWrite(Notice dto, Model model) {
		int result = noticeService.addNotice(dto);
		if(result == 1) {
			log.debug("[amdin] Notice Write Success :: ");
			return "notice/adminNoticeList";
		} else {
			log.debug("[admin] Notice Write Fail :: please try again.");
			return "notice/adminNoticeForm";
		}
	}
}
