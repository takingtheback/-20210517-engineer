package com.work.model;

import java.util.ArrayList;
import java.util.Random;
import java.util.regex.Pattern;

import com.work.exception.AuthException;
import com.work.util.Utility;
import com.work.view.CUIMenu;



/**
 * MemberService 구현
 * @author 김재현
 * @version ver2.0
 * @since jdk1.8
 */
public class MemberService {
	/** MemberDao 객체 생성 */
		private MemberDao dao = MemberDao.getInstance();
	
		
	/** 회원들을 저장관리하기 위한 자료 저장구조 : Generic */
	private ArrayList<Member> list = new ArrayList<Member>();

	
	/**
	 * 로그인1
	 * @param member_Id 아이디
	 * @param member_Pw 비밀번호
	 * @return 회원등급, 미존재시 null
	 */
	public String loginGrade(String member_Id, String member_Pw) {
		String grade = dao.loginGrade(member_Id,member_Pw);
		if(grade != null) {
			
			return grade;
		}
		return null;
	}

	
	/**
	 * 로그인
	 * @param member_Id 아이디
	 * @param member_Pw 비밀번호
	 * @return 회원아이디, 미존재시 null
	 */
	public String loginId(String member_Id, String member_Pw) {
		String memberId = dao.loginId(member_Id,member_Pw);
		if(memberId != null) {
			return memberId;
		}
		return null;
	}
	
	
	/**
	 * 아이디 중복여부
	 * @param memberId 아이디
	 * @return 중복된 아이디 있으면 true
	 */
	public boolean existMemberId(String memberId) {
		return dao.selectMemberId(memberId);
	}
	
	
	/**
	 * 이메일 중복여부
	 * @param email 이메일
	 * @return 중복된 이메일 있으면 true
	 */
	public boolean existEmail(String email) {
		return dao.selectEmail(email);
	}
	


	/**
	 * 회원가입 : 
	 * -- 신입 회원 입력 정보 : 아이디, 비밀번호, 이름, 휴대폰, 이메일
	 * -- 시스템에서 설정 정보 : 가입일, 등급 [, 마일리지]
	 * @param memberId 아이디
	 * @param memberPw 비밀번호
	 * @param name 이름
	 * @param mobile 휴대폰
	 * @param email 이메일
	 * @return 회원가입
	 * @throws AuthException 인증 예외
	 */
	public int addMember(String memberId, String memberPw, String name, String mobile, String email) throws AuthException {
		Member dto = new Member(memberId, memberPw, name, mobile, email);
		dto.setentry_Date(Utility.getCurrentDate());
		dto.setGrade("G");
		dto.setMileage(1000);
		dto.setLogin(0);
		return addMember(dto);
	}
	
	
	/**
	 * 회원가입 인증조건
	 * @param dto 회원정보 
	 * @return true 회원정보 false 오류 메세지
	 */
	public int addMember(Member dto) {
		if (existMemberId(dto.getmember_Id())) {
			System.out.println("[오류] 사용할 수 없는 아이디 : " + dto.getmember_Id());
			return 0;
		}
		
		if (existEmail(dto.getEmail())) {
			System.out.println("[오류] 사용할 수 없는 이메일 : " + dto.getEmail());
			return 0;
		}
		return dao.insertMember(dto);
	}
	
	
	/**
	 * 내정보조회 / 회원상세조회
	 * @param member_Id 아이디
	 * @return 회원정보
	 */
	public Member getMember(String member_Id) {
		return dao.selectOne(member_Id);
	}

	
	/**
	 * 회원 전체 조회
	 * @return 전체 회원 정보
	 */
	public ArrayList<Member> getMemberList() {
		return dao.selectList();
	}

	
	/**
	 * 회원 등급별 조회
	 * @param grade 등급
	 * @return 등급별 회원 정보
	 */
	public ArrayList<Member> getMemberListByGrade(String grade) {
		return dao.selectListByGrade(grade);
	}
	

	/**
	 * ## 아이디찾기
	 * @param name 이름
	 * @param email 이메일
	 * @return 성공시 아이디 반환
	 */
	public String getMemberId(String name, String email) {
		return dao.findId2(name, email);
	}
	
	
	/**
	 * ## 아이디찾기2
	 * @param name 이름
	 * @param mobile 휴대폰
	 * @return 성공시 아이디 반환
	 */
	public String getMemberId2(String name, String mobile) {
		return dao.findId1(name, mobile);
	}
	
	
	/**
	 * ## 비밀번호찾기
	 * @param name 이름
	 * @param mobile 휴대폰
	 * @param email 이메일
	 * @return 성공시 비밀번호 (추후 비밀번호 변경 페이지로)
	 */
	public String getMemberPw(String name, String mobile, String email) {
		return dao.findPw(name, mobile, email);
	}


	/**
	 * 회원 마일리지 조회
	 * @param number 숫자
	 * @return 마일리지 해당 회원 검색
	 */
	public ArrayList<Member> getMemberListByMileage(int number) {
		return dao.selectListByMileage(number);
	}


	/**
	 * ## 비밀번호찾기 1단계 : 해당회원 존재유무 채크
	 * @param member_Id 아이디
	 * @param name 이름
	 * @param email 이메일
	 * @return 성공시 임시발급암호, 정보불일치 null
	 */
	public String findMemberPw(String member_Id, String name, String email) {
		if(dao.findMemberPwByEmail(member_Id, name, email) == true) {
			String memberTempPw = Utility.getSecureNumberString();
			dao.updateMemberPw(member_Id, memberTempPw);
			return memberTempPw;
		} else {
		}
		
		return null;
		
	} 


	/**
	 * 비밀번호찾기 2단계 : 패스워드 변경
	 * @param member_Id 아이디
	 * @param name 이름
	 * @param email 이메일
	 * @return 변경될 패스워드 
	 */
	public String changeMemberPw(String member_Id,String name, String email) {
		if(dao.findMemberPwByEmail(member_Id, name, email) == true) {
			System.out.print("변경할 비밀번호 입력 : ");
			String memberTempPw = Utility.inputString();
			
			System.out.print("변경할 비밀번호 재입력 : ");
			String memberTempPwConfirm = Utility.inputString();
			
			if(memberTempPw.equals(memberTempPwConfirm)) {
				dao.updateMemberPw(member_Id, memberTempPw);
				System.out.println("비밀번호 변경 성공");
				
			} else {
				System.out.println("[오류] 비밀번호 불일치");
			}
				
		} else {
			System.out.println("[오류] 회원정보 불일치");
		}
		return null;
	} 


	/**
	 * 내정보 비밀번호 변경  : 패스워드 변경
	 * @param member_Id 아이디
	 * @return 변경될 비밀번호
	 */
	public String updateMemberPw(String member_Id) {
		if(dao.selectMemberIdByLogin().equals(member_Id)) {
			System.out.print("변경할 비밀번호 입력 : ");
			String memberTempPw = Utility.inputString();
			
			System.out.print("변경할 비밀번호 재입력 : ");
			String memberTempPwConfirm = Utility.inputString();
			
			if(memberTempPw.equals(memberTempPwConfirm)) {
				dao.updateMemberPw(member_Id, memberTempPw);
				System.out.println("비밀번호 변경 성공");
				
			} else {
				System.out.println("[오류] 비밀번호 불일치");
			}
		} else {
			System.out.println("[오류] 회원정보 불일치");
		}
		return null;
	} 	

	
	/**
	 * 내정보 이름 변경 : 이름 변경
	 * @param member_Id 아이디
	 * @return 변경될 이름
	 */
	public String updateName(String member_Id) {
		if(dao.selectMemberIdByLogin().equals(member_Id)) {
			System.out.print("변경할 이름 입력 : ");
			String memberModifiedName = Utility.inputString();
			
			dao.updateMemberName(member_Id, memberModifiedName);
			System.out.println("이름 변경 성공");
		}
		else {
			System.out.println("[오류] 회원정보 불일치");
		}
		return null;
	} 	

	
	/**
	 * 내정보 휴대폰 변경 : 휴대폰 변경
	 * @param member_Id 아이디
	 * @return 변경될 휴대폰
	 */
	public String updateMobile(String member_Id) {
		if(dao.selectMemberIdByLogin().equals(member_Id)) {
			System.out.print("변경할 휴대폰 입력(***-****-****) : ");
			String memberModifiedMobile = Utility.inputString();
			
			dao.updateMemberMobile(member_Id, memberModifiedMobile);
			System.out.println("휴대폰 변경 성공");
		}
		else {
			System.out.println("[오류] 회원정보 불일치");
		}
		return null;
	} 	

	
	/**
	 * 내정보 이메일 변경 : 이메일 변경
	 * @param member_Id 아이디
	 * @return 변경될 이메일
	 */
	public String updateEmail(String member_Id) {
		if(dao.selectMemberIdByLogin().equals(member_Id)) {
			System.out.print("변경할 이메일 입력(****@***.com) : ");
			String memberModifiedEmail = Utility.inputString();
			
			dao.updateMemberEmail(member_Id, memberModifiedEmail);
			System.out.println("이메일 변경 성공");
		}
		else {
			System.out.println("[오류] 회원정보 불일치");
		}
		return null;
	} 	

	
	
	/**
	 * 관리자용 이름 변경 
	 * @return 변경될 이름
	 */
	public String updateName() {
		System.out.print("변경할 회원 아이디 : ");
		String member_Id = Utility.inputString();
		
		System.out.print("변경할 회원 이름 : ");
		String memberModifiedName = Utility.inputString();
		
		if(dao.selectMemberId(member_Id) == true) {
			dao.updateMemberName(member_Id, memberModifiedName);
			System.out.println("이름 변경 성공");
		}
		else {
			System.out.println("[오류] 회원정보 불일치");
		}
		return null;
	} 	
	
	
	/**
	 * 관리자용 휴대폰 변경 
	 * @return 변경될 휴대폰
	 */
	public String updateMobile() {
		System.out.print("변경할 회원 아이디 : ");
		String member_Id = Utility.inputString();
		
		System.out.print("변경할 회원 휴대폰 : ");
		String memberModifiedMobile = Utility.inputString();
		
		if(dao.selectMemberId(member_Id) == true) {
			dao.updateMemberMobile(member_Id, memberModifiedMobile);
			System.out.println("휴대폰 변경 성공");
		}
		else {
			System.out.println("[오류] 회원정보 불일치");
		}
		return null;
	} 	
	
	
	/**
	 * 관리자용 이메일 변경 
	 * @return 변경될 이메일
	 */
	public String updateEmail() {
		System.out.print("변경할 회원 아이디 : ");
		String member_Id = Utility.inputString();
		
		System.out.print("변경할 회원 이메일 : ");
		String memberModifiedEmail = Utility.inputString();
		
		if(dao.selectMemberId(member_Id) == true) {
			dao.updateMemberEmail(member_Id, memberModifiedEmail);
			System.out.println("이메일 변경 성공");
		}
		else {
			System.out.println("[오류] 회원정보 불일치");
		}
		return null;
	} 	
	
	
	/**
	 * 관리자용 가입일 변경 
	 * @return 변경될 가입일
	 */
	public String updateEntryDate() {
		System.out.print("변경할 회원 아이디 : ");
		String member_Id = Utility.inputString();
		
		System.out.print("변경할 회원 가입일 : ");
		String memberModifiedEntryDate = Utility.inputString();
		
		if(dao.selectMemberId(member_Id) == true) {
			dao.updateMemberEntryDate(member_Id, memberModifiedEntryDate);
			System.out.println("가입일 변경 성공");
		}
		else {
			System.out.println("[오류] 회원정보 불일치");
		}
		return null;
	} 	
	
	
	/**
	 * 관리자용 등급 변경 
	 * @return 변경될 등급
	 */
	public String updateGrade() {
		System.out.print("변경할 회원 아이디 : ");
		String member_Id = Utility.inputString();
		
		System.out.print("변경할 회원 등급(일반: G, 우수: S, 관리자: A) => ");
		String memberModifiedGrade = Utility.inputString();
		if (memberModifiedGrade.equals("G") || memberModifiedGrade.equals("S") || memberModifiedGrade.equals("A")) {
			return memberModifiedGrade;
		} else {
			System.out.println("등급 확인 후 다시 입력바랍니다.");
			updateGrade();
		}
		if(dao.selectMemberId(member_Id) == true) {
			dao.updateMemberGrade(member_Id, memberModifiedGrade);
			System.out.println("등급 변경 성공");
		}
		else {
			System.out.println("[오류] 회원정보 불일치");
		}
		return null;
	} 	
	
	
	/**
	 * 관리자용 마일리지 변경 
	 * @return 변경될 마일리지
	 */
	public String updateMileage() {
		System.out.print("변경할 회원 아이디 : ");
		String member_Id = Utility.inputString();
		
		System.out.print("변경할 회원 마일리지 : ");
		int memberModifiedMileage = Utility.inputNumber();
		
		if(dao.selectMemberId(member_Id) == true) {
			dao.updateMemberMileage(member_Id, memberModifiedMileage);
			System.out.println("마일리지 변경 성공");
		}
		else {
			System.out.println("[오류] 회원정보 불일치");
		}
		return null;
	} 	
	
	
	/**
	 * 관리자용 담당자 변경 
	 * @return 변경될 담당자
	 */
	public String updateManager() {
		System.out.print("변경할 회원 아이디 : ");
		String member_Id = Utility.inputString();
		
		System.out.print("변경할 회원 담당자 : ");
		String memberModifiedManager = Utility.inputString();
		
		if(dao.selectMemberId(member_Id) == true) {
			dao.updateMemberManager(member_Id, memberModifiedManager);
			System.out.println("담당자 변경 성공");
		}
		else {
			System.out.println("[오류] 회원정보 불일치");
		}
		return null;
	} 	
	
	
	/**
	 * 관리자용 회원 탈퇴처리
	 * @return 회원 탈퇴처리
	 */
	public String deleteMemberIdByAdmin() {
		System.out.print("탈퇴처리할 회원 아이디 : ");
		String member_Id = Utility.inputString();
		
		System.out.print("정말 탈퇴처리하시겠습니까? 탈퇴처리 후 복구 불가능합니다."
				+ "\n 탈퇴처리하시면 회원 아이디 재입력해주세요. => ");
		String member_IdConfirm = Utility.inputString();
		if(member_Id.equals(member_IdConfirm)) {
			if(dao.selectMemberId(member_Id) == true) {
				dao.deleteMemberId(member_Id);
				System.out.println(member_Id + "탈퇴 처리 완료");
			}
			else {
				System.out.println("[오류] 회원정보 불일치");
			}
		} 
		return null;
	} 	
	
	
	/**
	 * 회원탈퇴
	 * 로그인(아이디 비밀번호) 정보 맞으면
	 * 탈퇴처리 후 메인메뉴, 틀리면 오류
	 * @return 회원정보 삭제
	 */
	public String deleteMemberId() {
		System.out.println("탈퇴하실 아이디와 비밀번호를 입력하세요.");
		System.out.print("아이디 : ");
		String member_Id = Utility.inputString();
	
		System.out.print("비밀번호 : ");
		String member_Pw = Utility.inputString();
		
		if(dao.loginId(member_Id, member_Pw).equals(member_Id)) {
			dao.deleteMemberId(member_Id);
			System.out.println(member_Id + "님의 회원탈퇴 처리가 완료되었습니다.");
		}
		else {
			System.out.println("[오류] 회원정보 불일치");
		}
		return null;
	}
	
	
	/**
	 * 로그인상태 전환
	 * @param member_Id 아이디
	 * @return 로그인상태로 유지
	 */
	public String updateLogin(String member_Id) {
		if(dao.updateLogin(member_Id) == true) {
			return member_Id;
		}
		return null;
	}
	
	
	/**  로그아웃상태 전환 */
	public void updateLogout() {
		if(dao.updateLogout() == true) {
		}
	}
	
	/**
	 * 로그인상태인 아이디 추적
	 * @return 로그인된 아이디 반환
	 */
	public String selectIdByLogin() {
		String member_Id = dao.selectMemberIdByLogin();
		if(member_Id != null) {
			return member_Id;
		}
		return null;
	}
	
}












