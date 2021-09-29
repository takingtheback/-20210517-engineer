package com.work.exception;

import com.work.model.dto.Member;
import com.work.model.service.MemberService;
import com.work.view.MMS_Menu;

import sun.print.resources.serviceui;

public class RecordNotFoundException extends Exception {
	public RecordNotFoundException() {
		super("저장값 찾을 수 없음");
	}
	
	public RecordNotFoundException(String message) {
		super("저장값 없음 : " + message);
		System.out.println("올바르지 않은 정보입니다. 다시 입력해주세요.");
		
	}
	
	
}
