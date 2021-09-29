package com.work.model.dto;

import java.time.LocalDate;

/**
 * <pre>
 * 회원 도메인 클래스 
 * -- encapsulation 설계 반영 변경
 * ## 회원 검증조건
 *	1. 아이디 : 6자리 ~ 30자리 이내
 *	2. 비밀번호 : 6자리 ~ 20자리 이내
 *	3. 이름
 *	4. 휴대폰 : 형식 01012341234
 *	5. 이메일
 *	6. 가입일 : 형식 2021-05-26, 시스템 현재날짜 제공
 *	7. 등급 : 일반(G), 우수(S), 관리자(A), 시스템 제공
 *	8. 마일리지
 *	9. 담당자
 * </pre>
 * @author 김재현
 * @version ver.1.01
 * @since jdk1.8
 */
public class Member {
	/** 1. 아이디, 식별키 */
	private String memberId;
	
	/** 2. 비밀번호 */
	private String memberPw;
	
	/** 3. 이름 */
	private String name;
	
	/** 4. 휴대폰, 형식 01012341234 */
	private String mobile;
	
	/** 5. 이메일 */
	private String email;
	
	/** 6. 가입일, 필수, 형식 2021-05-26, 시스템 현재날짜 제공 */
	private String entryDate;
	
	/** 7. 등급, 필수, 일반(G), 우수(S), 관리자(A), 시스템 제공 */
	private String grade;

	/** 8. 일반회원 마일리지 */
	private int mileage;

	/** 우수회원 담당자 */
	private String manager;
	
	/**회비 납부 여부 : 납부 or 미납 */
	private boolean dues;
	
	/**회비 납부일, 형식 2021-05-26, 시스템 현재날짜 제공*/
	private String startDateDues;
	
	/**회비 납부일, 형식 2021-05-26, 시스템 현재날짜 제공*/
	private String endDateDues;
	
	/** 기본 생성자, 형식 2021-05-26, 시스템 마감날짜 제공 */
	public Member() {}
	
	
	/** 
	 * 사용자 입력데이터 초기화 생성자
	 * @param memberId 아이디
	 * @param memberPw 패스워드
	 * @param name 이름
	 * @param mobile 휴대폰 
	 * @param email 이메일
	 */
	public Member(String memberId, String memberPw, String name, String mobile, String email) {
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.name = name;
		this.mobile = mobile;
		this.email = email;
	}
	
	
	/** 
	 * 회원 필수데이터 초기화 생성자
	 * @param memberId 아이디
	 * @param memberPw 패스워드
	 * @param name 이름
	 * @param mobile 휴대폰 
	 * @param email 이메일
	 * @param entryDate 가입일
	 * @param grade 등급
	 * @param dues 회비
	 * @param startDateDues 회비납부일
	 * @param endDateDues 회비마감일
	 */
	public Member(String memberId, String memberPw, String name, String mobile, String email, String entryDate,
			String grade, Boolean dues, String startDateDues, String endDateDues) {
		this(memberId, memberPw, name, mobile, email);
		this.entryDate = entryDate;
		this.grade = grade;
		this.dues = dues;
		this.startDateDues = startDateDues;
		this.endDateDues = endDateDues;
	}

	
	/**
	 * 회원 전체데이터 초기화 생성자
	 * @param memberId 아이디
	 * @param memberPw 패스워드
	 * @param name 이름
	 * @param mobile 휴대폰 
	 * @param email 이메일
	 * @param entryDate 가입일
	 * @param grade 등급
	 * @param mileage 마일리지
	 * @param manager 담당자
	 * @param dues 회비
	 * @param startDateDues 회비납부일
	 * @param endDateDues 회비마감일
	 */
	public Member(String memberId, String memberPw, String name, String mobile, String email, String entryDate,
			String grade, int mileage, String manager, Boolean dues, String startDateDues, String endDateDues) {
		this(memberId, memberPw, name, mobile, email);
		this.entryDate = entryDate;
		this.grade = grade;
		this.mileage = mileage;
		this.manager = manager;
		this.dues = dues;
		this.startDateDues = startDateDues;
		this.endDateDues = endDateDues;
	}


	/**
	 * @return the memberId
	 */
	public String getMemberId() {
		return memberId;
	}


	/**
	 * @param memberId the memberId to set
	 */
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	/**
	 * @return the memberPw
	 */
	public String getMemberPw() {
		return memberPw;
	}


	/**
	 * @param memberPw the memberPw to set
	 */
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}


	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}


	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}


	/**
	 * @return the mobile
	 */
	public String getMobile() {
		return mobile;
	}


	/**
	 * @param mobile the mobile to set
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}


	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}


	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}


	/**
	 * @return the entryDate
	 */
	public String getEntryDate() {
		return entryDate;
	}


	/**
	 * @param entryDate the entryDate to set
	 */
	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}


	/**
	 * @return the grade
	 */
	public String getGrade() {
		return grade;
	}


	/**
	 * @param grade the grade to set
	 */
	public void setGrade(String grade) {
		this.grade = grade;
	}


	/**
	 * @return the mileage
	 */
	public int getMileage() {
		return mileage;
	}


	/**
	 * @param mileage the mileage to set
	 */
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}


	/**
	 * @return the manager
	 */
	public String getManager() {
		return manager;
	}


	/**
	 * @param manager the manager to set
	 */
	public void setManager(String manager) {
		this.manager = manager;
	}


	/**
	 * @return the dues
	 */
	public boolean isDues() {
		return dues;
	}


	/**
	 * @param dues the dues to set
	 */
	public void setDues(boolean dues) {
		this.dues = dues;
	}


	/**
	 * @return the startDateDues
	 */
	public String getStartDateDues() {
		return startDateDues;
	}


	/**
	 * @param startDate the startDateDues to set
	 */
	public void setStartDateDues(String startDate) {
		this.startDateDues = startDate;
	}


	/**
	 * @return the endDateDues
	 */
	public String getEndDateDues() {
		return endDateDues;
	}


	/**
	 * @param endDateDues the endDateDues to set
	 */
	public void setEndDateDues(String endDateDues) {
		this.endDateDues = endDateDues;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
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
		Member other = (Member) obj;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		return true;
	}
	

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ID : ");
		builder.append(memberId.substring(0,2) + "****");
		builder.append("\n비밀번호 : ");
		builder.append(memberPw.substring(0,2) + "****");
		builder.append("\n이름 : ");
		builder.append(name);
		builder.append("\n휴대폰 : ");
		builder.append(mobile);
		builder.append("\n이메일 : ");
		builder.append(email);
		builder.append("\n가입일 : ");
		builder.append(entryDate);
		builder.append("\n등급 : ");
		builder.append(grade);
		builder.append("\n마일리지 : ");
		builder.append(mileage);
		builder.append("\n담당자 : ");
		builder.append(manager);
		builder.append("\n회비납부 : ");
		builder.append(dues);
		builder.append("\n회비납부일 : ");
		builder.append(startDateDues);
		builder.append("\n회비종료일 : ");
		builder.append(endDateDues);
		builder.append("\n");
		return builder.toString();
	}
}