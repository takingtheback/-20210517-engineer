package com.work.exception;

import sun.print.resources.serviceui;

public class NumberFormatException extends Exception {
	public NumberFormatException() {
		super("번호 입력 오류 ");
	}
	
	public NumberFormatException(String message) {
		super("번호 입력 오류 : " + message);
	}
	
	
}
