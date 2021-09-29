package com.work.exception;

public class ParseException extends Exception {
	public ParseException() {
		super("사용자 오류 ");
	}
	
	public ParseException(String message) {
		super("사용자 오류 : " + message);
	}
	
}


