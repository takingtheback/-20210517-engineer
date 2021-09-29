package com.work.exception;

import com.work.model.dto.Member;
import com.work.model.service.MemberService;

import sun.print.resources.serviceui;

public class NumberFormatException extends Exception {
	public NumberFormatException() {
		super("번호 입력 오류 ");
	}
	
	public NumberFormatException(String message) {
		super("번호 입력 오류 : " + message);
	}
	
	
}
