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

public class Reward {

	private int payment_id;
	private int recruit_num;
	private int apply_num;
	private String writer_memberId;
	private String apply_memberId;
	private String pay_amount;
	private String payment_date;
	private String reward_yn;
}
