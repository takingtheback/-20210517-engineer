package com.side_on.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QnABoard {
	private int qnaBoardNo;
	private String qnaBoardTitle;
	private String qnaBoardContents;
	private String memberId;
	private String qnaBoardDate;
	private int qnaBoardViews;
	private String grade;
		
}