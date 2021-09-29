package com.side_on.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Rest {
	
	private String restNo;
	
	private String noticeNo;
	
	private String memberId;
	
	private String reason;
	
	private String restEnroll;
	
	private String restConfirm;
	
	private String restCheck;

}
