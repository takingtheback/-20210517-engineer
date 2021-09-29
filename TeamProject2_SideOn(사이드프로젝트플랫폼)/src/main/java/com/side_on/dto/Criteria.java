package com.side_on.dto;

import java.util.Arrays;

public class Criteria {

	/** 현재 페이지 */
	private int pageNum;
	
	/** 한 페이지 당 보여질 게시물 갯수 */
	private int amount;
	
	/** 검색 키워드 */
	private String keyword;
	
	/** 검색 타입 */
	private String type;
	
	/** 검색 타입 배열 변환 */
	private String[] typeArr;
	
	/** 기본 생성자 -> 기봅 세팅 : pageNum = 1, amount = 10 */
	public Criteria() {
		this(1,10);
	}
	
	/** 생성자 => 원하는 pageNum, 원하는 amount */
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	/**
	 * getter
	 * @return pageNum
	 */
	public int getPageNum() {
		return pageNum;
	}
	
	/**
	 * setter
	 * @param pageNum
	 */
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	/**
	 * getter
	 * @return amount
	 */
	public int getAmount() {
		return amount;
	}

	/**
	 * setter
	 * @param amount
	 */
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	/**
	 * getter
	 * @return keyword
	 */
	public String getKeyword() {
		return keyword;
	}

	/**
	 * setter
	 * @param keyword
	 */
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	/**
	 * getter
	 * @return type
	 */
	public String getType() {
		return type;
	}

	/**
	 * setter
	 * @param type
	 */
	public void setType(String type) {
		this.type = type;
		this.typeArr = type.split("");
	}

	/**
	 * getter
	 * @return typeArr
	 */
	public String[] getTypeArr() {
		return typeArr;
	}
	
	/**
	 * setter
	 * @param typeArr
	 */
	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}
	
	
	/**
	 * toString
	 */
	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + ", type=" + type
				+ ", typeArr=" + Arrays.toString(typeArr) + "]";
	}	
}
