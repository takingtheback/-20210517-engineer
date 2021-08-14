package com.side_on.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	private String noticeNo;
	
	private String noticeTitle;
	
	private String noticeContent;
	
	private String memberId;
	
	private String noticeDate;
	
	private String viewCount;
	
	private String visibleCheck;
}
