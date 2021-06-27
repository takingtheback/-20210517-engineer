package com.work.exception;

import com.work.model.dto.Member;
import com.work.model.service.MemberService;


public class CommonException extends Exception {
	public CommonException() {
		super("사용자 오류 ");
	}
	
	public CommonException(String message) {
		super("사용자 오류 : " + message);
	}
	
	
}
