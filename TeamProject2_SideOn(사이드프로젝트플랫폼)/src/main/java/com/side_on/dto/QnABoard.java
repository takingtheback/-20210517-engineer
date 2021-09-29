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
	
	/** QnA 게시판 번호 */
	private int qnaBoardNo;
	
	/** QnA 게시판 제목 */
	private String qnaBoardTitle;
	
	/** QnA 게시판 내용 */
	private String qnaBoardContents;
	
	/** 작성자(memberId fk) */
	private String memberId;
	
	/** QnA 게시판 작성일*/
	private String qnaBoardDate;
	
	/** QnA 게시판 조회수 */
	private int qnaBoardViews;
	
	/** 등급(페이지 접속시 세션관련) */
	private String grade;
}