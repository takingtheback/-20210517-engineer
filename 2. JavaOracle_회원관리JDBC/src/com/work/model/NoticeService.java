package com.work.model;

import java.util.ArrayList;

import com.work.util.Utility;

/**
 * NoticeService 구현
 * @author 김재현
 * @version ver2.0
 * @since jdk1.8
 */
public class NoticeService {
	/** MemberDao 객체 생성 */
	private NoticeDao daoN = NoticeDao.getInstance();

	
	/** 회원들을 저장관리하기 위한 자료 저장구조 : Generic */
	private ArrayList<Notice> list = new ArrayList<Notice>();


	/**
	 * 게시판 전체 조회
	 * @return 게시판
	 */
	public ArrayList<Notice> getNoticeList() {
		return daoN.selectList();
	}
	

	/**
	 * 게시물 상세 검색 : 작성자
	 * @return 작성자로 검색된 게시물
	 */
	public ArrayList<Notice> searchMemberId() {
		System.out.print("검색할 작성자 : ");
		String member_Id = "%" + Utility.inputString() + "%";
		
		if(daoN.selectListByMemberId(member_Id) == null) {
			 System.out.println("조회 결과 없음");
		 }
		 return daoN.selectListByMemberId(member_Id);
	}
	
	
	/**
	 * 게시물 상세 검색 : 제목
	 * @return 작성자로 검색된 게시물
	 */
	public ArrayList<Notice> searchNoticeTitle() {
		System.out.print("검색할 제목 : ");
		String noticeTitle = "%" + Utility.inputString() + "%";
		
		if(daoN.selectListByNoticeTitle(noticeTitle) == null) {
			 System.out.println("조회 결과 없음");
		 }
		 return daoN.selectListByNoticeTitle(noticeTitle);
	}
	
	
	/**
	 * 게시물 상세 검색 : 내용
	 * @return 작성자로 검색된 게시물
	 */
	public ArrayList<Notice> searchNoticeContents() {
		System.out.print("검색할 내용 : ");
		String noticeContents = "%" + Utility.inputString() + "%";
		
		if(daoN.selectListByNoticeContents(noticeContents) == null) {
			 System.out.println("조회 결과 없음");
		 }
		 return daoN.selectListByNoticeContents(noticeContents);
	}
	
	
	/**
	 * 게시물 상세 검색 : 제목 + 내용
	 * @return 작성자로 검색된 게시물
	 */
	public ArrayList<Notice> searchNoticeTitleContents() {
		System.out.print("검색할 내용 : ");
		String word = "%" + Utility.inputString() + "%";
		
		if(daoN.selectListByNoticeTitleContents(word) == null) {
			 System.out.println("조회 결과 없음");
		 }
		 return daoN.selectListByNoticeTitleContents(word);
	}
	
	
	/**
	 * 게시물 작성
	 * @param member_Id 작성자 아이디
	 * @return 작성자로 생성된 게시물
	 */
	public ArrayList<Notice> createNoticeTitleContents(String member_Id) {
		System.out.print("게시물 제목(50자 이내) : ");
		String noticeTitle = Utility.inputString();
		
		System.out.print("게시물 제목(4천자 이내) : ");
		String noticeContents = Utility.inputString();
		
		daoN.createNoticeTitleContents(noticeTitle, noticeContents, member_Id);
	
		 return null;
	}
	
	
	/**
	 * 사용자 게시물 삭제
	 * 1단계 : 본인 게시물 확인
	 * 2단계 : 삭제할 게시물 번호 입력 : 삭제할 게시물 존재여부 확인
	 * 3단계 : 삭제여부 확인
	 * @param member_Id 아이디
	 * @return 게시물 삭제
	 */
	public ArrayList<Notice> deleteNoticeTitleContents(String member_Id) {
		
		System.out.print("삭제할 게시물 번호 입력 : ");
		int noticeNo = Utility.inputNumber();
		
		if(daoN.selectNoticeNo(member_Id, noticeNo) == true) {
			System.out.print("정말 삭제하시겠습니까? 삭제 후에는 복구가 불가능합니다.\n삭제하시려면 게시물 번호를 다시 입력 => ");
			int noticeNoConfirm = Utility.inputNumber();
		
			if(noticeNo == noticeNoConfirm) {
				return daoN.deleteNoticeContents(member_Id, noticeNo);
			} 
		} 
		System.out.println("입력 정보가 정확하지 않습니다.");
		
		return null;
	}
	
	
	/**
	 * 전체게시물 삭제
	 * @return 게시물 삭제
	 */
	public ArrayList<Notice> deleteAllNoticeTitleContents() {
		
		System.out.print("정말 전부 삭제하시겠습니까? [Yes or No] : ");
		String confirm = Utility.inputString();
		
		if (confirm.equals("Yes") || confirm.equals("YES") || confirm.equals("yes")) {
			System.out.print("정말 삭제하시겠습니까? 삭제 후에는 복구가 불가능합니다.\n전부 삭제 진행 Yes 다시 입력 => ");
			String noticeConfirm = Utility.inputString();
	
			if(confirm.equals(noticeConfirm)) {
				return daoN.deleteAllNoticeContents();
			} 
		} System.out.println("입력문구가 정확하지 않습니다.");
		return null;
	}
	
	
}
