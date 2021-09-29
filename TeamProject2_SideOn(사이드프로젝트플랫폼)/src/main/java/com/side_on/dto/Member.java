package com.side_on.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	
	private String memberId;
	
	private String memberPw;
	
	private String email;

	private String grade;
	
	private String name;
	
	private String mobile;
	
	private String entryDate;
	
	private String restCount;
	
	private String reward;
	
	// find 연결
	private String find_title;
	
	private int find_no;
	
	private String find_date;
}
