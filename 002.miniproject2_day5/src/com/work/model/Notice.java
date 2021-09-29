package com.work.model;

import java.io.Serializable;
/**
 * 게시판 클래스
 * 1. 게시물 번호
 * 2. 게시물 제목
 * 3. 게시물 내용
 * 4. 게시물 작성자
 * 5. 게시물 생성일
 * 6. 게시물 조회수
 * 
 * @author 김재현
 * @version ver2.0
 * @since jdk1.8
 */
public class Notice {
	
	/** 게시물 번호 */
	private int noticeNo;
	
	/** 게시물 제목 */
	private String noticeTitle;
	
	/** 게시물 내용 */
	private String noticeContents;
	
	/** 게시물 작성자 : PK MEMBER */
	private String member_Id;
	
	/** 게시물 생성일 */
	private String noticeCreationDate;
	
	/** 게시물 조회수 */
	private int noticeViews;

	/** 기본생성자 */
	public Notice() {
		super();
	}

	/**
	 * 게시판 입력데이터 초기화 생성자
	 * @param noticeTitle 게시물 제목
	 * @param noticeContents 게시물 내용
	 */
	public Notice(String noticeTitle, String noticeContents) {
		super();
		this.noticeTitle = noticeTitle;
		this.noticeContents = noticeContents;
	}

	
	/**
	 * 게시판 필수데이터 초기화 생성자
	 * @param noticeNo 게시물 번호 
	 * @param noticeTitle 게시물 제목
	 * @param noticeContents 게시물 내용
	 * @param member_Id 게시물 작성자
	 * @param noticeCreationDate 게시물 생성일
	 * @param noticeViews 게시물 조회수
	 */
	public Notice(int noticeNo, String noticeTitle, String noticeContents, String member_Id, String noticeCreationDate,
			int noticeViews) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContents = noticeContents;
		this.member_Id = member_Id;
		this.noticeCreationDate = noticeCreationDate;
		this.noticeViews = noticeViews;
	}

	/**
	 * @return the noticeNo
	 */
	public int getNoticeNo() {
		return noticeNo;
	}

	/**
	 * @param noticeNo the noticeNo to set
	 */
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	/**
	 * @return the noticeTitle
	 */
	public String getNoticeTitle() {
		return noticeTitle;
	}

	/**
	 * @param noticeTitle the noticeTitle to set
	 */
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	/**
	 * @return the noticeContents
	 */
	public String getNoticeContents() {
		return noticeContents;
	}

	/**
	 * @param noticeContents the noticeContents to set
	 */
	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}

	/**
	 * @return the member_Id
	 */
	public String getMember_Id() {
		return member_Id;
	}

	/**
	 * @param member_Id the member_Id to set
	 */
	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}

	/**
	 * @return the noticeCreationDate
	 */
	public String getNoticeCreationDate() {
		return noticeCreationDate;
	}

	/**
	 * @param noticeCreationDate the noticeCreationDate to set
	 */
	public void setNoticeCreationDate(String noticeCreationDate) {
		this.noticeCreationDate = noticeCreationDate;
	}

	/**
	 * @return the noticeViews
	 */
	public int getNoticeViews() {
		return noticeViews;
	}

	/**
	 * @param noticeViews the noticeViews to set
	 */
	public void setNoticeViews(int noticeViews) {
		this.noticeViews = noticeViews;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((member_Id == null) ? 0 : member_Id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Notice other = (Notice) obj;
		if (member_Id == null) {
			if (other.member_Id != null)
				return false;
		} else if (!member_Id.equals(other.member_Id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("게시물 번호 : ");
		builder.append(noticeNo);
		builder.append("\n게시물 제목 : ");
		builder.append(noticeTitle);
		builder.append("\n게시물 내용 : ");
		builder.append(noticeContents);
		builder.append("\n게시물 작성자 : ");
		builder.append(member_Id);
		builder.append("\n게시물 작성일 : ");
		builder.append(noticeCreationDate);
		builder.append("\n게시물 조회수 : ");
		builder.append(noticeViews);
		builder.append("\n");
		return builder.toString();
	}
	
	
}
