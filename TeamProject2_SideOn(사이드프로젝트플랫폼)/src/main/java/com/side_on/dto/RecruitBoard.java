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
public class RecruitBoard {
	
		/** 글 번호 */
		private int  recruit_num;
		/** 아이디 */
		private String memberId;
		/** 조회수 */
		private int hit;
		/** 프로젝트 시작 날짜 */
		private String start_date;
		/** 프로젝트 마감 날짜 */
		private String end_date;
		/** 글 작성 날짜  */
		private String save_date;
		/** 글 제목 */
		private String title;
		/** 프로젝트 제목 */
		private String project_name;
		/** 프로젝트 간단 설명 */
		private String simple_info;
		/** 지원 유/무료 여부 */
		private String pay_check;
		/** 유료일 때, 가격*/
		private String pay_amount;
		/** 프로젝트 소개글 */
		private String pj_content;
		/** 프로젝트 리더 소개글 */
		private String content;
		/** 숨김 체크*/
		private String visible_check;
		
		private String status;
		
		/** 모집 분야 */
		private int Front;
		private int Back;
		private int aos;
		private int ios;
		private int server;
		private int uxui;
		private int plan;
		private int pm;

		

}
