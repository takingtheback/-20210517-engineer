package com.work.exception;

import com.work.model.dto.Member;
import com.work.model.service.MemberService;

import sun.print.resources.serviceui;

public class DuplicateException extends Exception {
	public DuplicateException() {
		super("중복오류 ");
	}
	
	public DuplicateException(String message) {
		super("사용자 중복 : " + message);
	}
	
	
}
