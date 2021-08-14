package com.side_on.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VoteController {
	
	@RequestMapping("/vote/pollInsert")
	public String pollInsert() {
	
		return "vote/pollInsert";
	}
	
	@RequestMapping("/vote/pollInsertProc")
	public String pollInsertProc() {
	
		return "vote/pollInsertProc";
	}
	
	@RequestMapping("/vote/pollForm")
	public String pollForm() {
	
		return "vote/pollForm";
	}
	
	@RequestMapping("/vote/pollList")
	public String pollList() {
	
		return "vote/pollList";
	}
	
	@RequestMapping("/vote/pollFormProc")
	public String pollFormProc() {
	
		return "vote/pollFormProc";
	}
	
	@RequestMapping("/vote/pollView")
	public String pollView() {
	
		return "vote/pollView";
	}
}
