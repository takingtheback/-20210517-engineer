package com.side_on.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
public class Apply {
	
	private int apply_num;
	private String titie;
	private int recruit_num;
	private String member_id;
	private String part;
	private String message;
	private String join_yn;
	private String pay_check;
	
	private String payment_date;

}
