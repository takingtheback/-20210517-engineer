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
public class RecruitMyPage {

	private int recruit_num;
	private int apply_num;
	private String titie;
	private String member_id;
	private String join_yn;
}
