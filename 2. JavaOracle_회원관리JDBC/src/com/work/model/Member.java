package com.work.model;

import java.io.Serializable;

/**
 * 멤버 클래스
 *	1. 아이디 : 6자리 ~ 30자리 이내
 *	2. 비밀번호 : 6자리 ~ 20자리 이내
 *	3. 이름
 *	4. 휴대폰 : 형식 01012341234
 *	5. 이메일
 *	6. 가입일 : 형식 2021-05-26, 시스템 현재날짜 제공
 *	7. 등급 : 일반(G), 우수(S), 관리자(A), 시스템 제공
 *	8. 마일리지
 *	9. 담당자	
 * @author 김재현
 * @version ver2.0
 * @since jdk1.8
 */

public class Member implements Serializable {

	/** 1. 아이디, 식별키 */
	private String member_Id;
	
	/** 2. 비밀번호 */
	private String member_Pw;
	
	/** 3. 이름 */
	private String name;
	
	/** 4. 휴대폰, 형식 01012341234 */
	private String mobile;
	
	/** 5. 이메일 */
	private String email;
	
	/** 6. 가입일, 필수, 형식 2021-05-26, 시스템 현재날짜 제공 */
	private String entry_Date;
	
	/** 7. 등급, 필수, 일반(G), 우수(S), 관리자(A), 시스템 제공 */
	private String grade;

	/** 8. 일반회원 마일리지 */
	private int mileage;

	/** 우수회원 담당자 */
	private String manager;

	/** 로그인 상태 */
	private int login;
	
	
	/**
	 * 기본생성자
	 */
	public Member() {}

	
	/**
	 * 사용자 입력데이터 초기화 생성자
	 * @param member_Id 아이디
	 * @param member_Pw 패스워드
	 * @param name 이름
	 * @param mobile 휴대폰 
	 * @param email 이메일
	 */
	public Member(String member_Id, String member_Pw, String name, String mobile, String email) {
		this.member_Id = member_Id;
		this.member_Pw = member_Pw;
		this.name = name;
		this.mobile = mobile;
		this.email = email;
	}

	/**
	 * 회원 필수데이터 초기화 생성자
	 * @param member_Id 아이디
	 * @param member_Pw 패스워드
	 * @param name 이름
	 * @param mobile 휴대폰 
	 * @param email 이메일
	 * @param entry_Date 가입일
	 * @param grade 등급
	 */
	public Member(String member_Id, String member_Pw, String name, String mobile, String email, String entry_Date,
			String grade) {
		this(member_Id, member_Pw, name, mobile, email);
		this.entry_Date = entry_Date;
		this.grade = grade;
	}

	/**
	 * 회원 전체데이터 초기화 생성자
	 * @param member_Id 아이디
	 * @param member_Pw 패스워드
	 * @param name 이름
	 * @param mobile 휴대폰 
	 * @param email 이메일
	 * @param entry_Date 가입일
	 * @param grade 등급
	 * @param mileage 마일리지
	 * @param manager 담당자
	 * @param login 로그인
	 */
	public Member(String member_Id, String member_Pw, String name, String mobile, String email, String entry_Date,
			String grade, int mileage, String manager, int login) {
		this(member_Id, member_Pw, name, mobile, email, entry_Date, grade);
		this.mileage = mileage;
		this.manager = manager;
		this.login = login;
	}

	/**
	 * @return the member_Id
	 */
	public String getmember_Id() {
		return member_Id;
	}

	/**
	 * @param member_Id the member_Id to set
	 */
	public void setmember_Id(String member_Id) {
		this.member_Id = member_Id;
	}

	/**
	 * @return the member_Pw
	 */
	public String getmember_Pw() {
		return member_Pw;
	}

	/**
	 * @param member_Pw the member_Pw to set
	 */
	public void setmember_Pw(String member_Pw) {
		this.member_Pw = member_Pw;
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
	 * @return the entry_Date
	 */
	public String getentry_Date() {
		return entry_Date;
	}

	/**
	 * @param entry_Date the entry_Date to set
	 */
	public void setentry_Date(String entry_Date) {
		this.entry_Date = entry_Date;
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
	 * @return the login
	 */
	public int getLogin() {
		return login;
	}


	/**
	 * @param login the login to set
	 */
	public void setLogin(int login) {
		this.login = login;
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
		Member other = (Member) obj;
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
		builder.append("ID : ");
		builder.append(member_Id.substring(0,2) + "****");
		builder.append("\n비밀번호 : ");
		builder.append(member_Pw.substring(0,2) + "****");
		builder.append("\n이름 : ");
		builder.append(name);
		builder.append("\n휴대폰 : ");
		builder.append(mobile);
		builder.append("\n이메일 : ");
		builder.append(email);
		builder.append("\n가입일 : ");
		builder.append(entry_Date);
		builder.append("\n등급 : ");
		builder.append(grade);
		builder.append("\n마일리지 : ");
		builder.append(mileage);
		builder.append("\n담당자 : ");
		builder.append(manager);
		builder.append("\n로그인상태 : ");
		builder.append(login);
		builder.append("\n");
		return builder.toString();
	}


	
}

