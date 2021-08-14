package com.side_on.dto;

public class PageMakerRc {
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	//Criteria안에 page, pageSize 있음
	private CriteriaRc cri;
	
	//화면에 보여지는 페이지블럭의 수
	private int displayPageNum = 10;

	public PageMakerRc() {}
	public PageMakerRc(int totalCount, int startPage, int endPage, boolean prev, boolean next, CriteriaRc cri,
			int displayPageNum) {
		super();
		this.totalCount = totalCount;
		this.startPage = startPage;
		this.endPage = endPage;
		this.prev = prev;
		this.next = next;
		this.cri = cri;
		this.displayPageNum = displayPageNum;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) { //변경
		this.totalCount = totalCount;
		System.out.println("DB에서 총 글의 개수를 계산");
		//총 글의 개수를 가지고 왔을때 필요한 정보를 계산
		calcDate();
	}
	
	private void calcDate() {
		endPage = (int) (Math.ceil(cri.getPage()/(double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) +1;
		int tempEndPage = (int) (Math.ceil(totalCount/(double)cri.getPageSize()));
		if(endPage > tempEndPage) endPage = tempEndPage;
		prev = (startPage == 1? false:true);
		next = (endPage * cri.getPageSize() >= totalCount? false:true);
		System.out.println("페이징처리정보 계산");
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public CriteriaRc getCri() {
		return cri;
	}

	public void setCri(CriteriaRc cri) { //변경
		this.cri = cri;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	
	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", cri=" + cri + ", displayPageNum=" + displayPageNum + "]";
	}	
}
