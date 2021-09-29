package com.work.model.service;

import java.util.ArrayList;

import com.work.exception.CommonException;
import com.work.exception.DuplicateException;
import com.work.exception.RecordNotFoundException;
import com.work.model.dto.Member;
import com.work.util.Utility;
import com.work.view.MMS_Menu;

/**
 * <pre>
 * Collection API 활용 방법
 * -- ArrayList
 * -- Generic Collection 
 * 
 *</pre>
 * @author 김재현
 * @version ver.1.01
 * @since jdk1.8
 */
public class MemberService {
	/** 회원 저장위한 자료 저장구조 */
	private static ArrayList<Member> list = new ArrayList<Member>();
	
	
	/** 기본생성자 : 초기화 회원 등록 수행 */
	public MemberService() {
	}
	
	/**
	 * 1. 로그인 서비스
	 * @param memberId 아이디
	 * @param memberPw 패스워드
	 * @throws Exception 예외
	 */
	public static void loginService(String memberId, String memberPw) throws Exception {
		
		if(exist(memberId) == -1) {
			System.out.println("잘못된 회원정보입니다.\n메인메뉴로 복귀합니다.");
			MMS_Menu.mainMenu();
		}
		
		Member dto = getMember(memberId);
		if (dto.getMemberPw().equals(memberPw)) {
			if(dto.getGrade().equals("G") || dto.getGrade().equals("S")) {
				System.out.println("일반회원 로그인 성공");
				
				Utility.printTitle("일반 회원 메뉴");
				System.out.println("내정보 조회");
				System.out.println(dto);
				Utility.singleLine();
				System.out.println("1. 내정보 변경");
				System.out.println("9. 로그아웃");
				System.out.println("0. 종료");
				Utility.singleLine();
				System.out.print("메뉴번호 입력 => ");
				
				while(true) {
					int menuNo = Utility.inputNumber();
					switch(menuNo) {
					case 1:
						MMS_Menu.changeMemberInfo();
						break;
					case 9:
						MMS_Menu.logoutMenu();
						break ;
					case 0:
						MMS_Menu.exitMenu();
						break;
					default:
						System.out.println("메뉴번호를 다시 눌러주세요.");
						continue;
					}
				}
			} else if (dto.getGrade().equals("A")) {
				System.out.println("관리자 로그인 성공");
				MMS_Menu.adminMemberMenu();
			} 
		}	 
	}
	
	
	/**
	 * 회원 탈퇴
	 * -- 비밀번호 변경과 동일 
	 * @param memberId 아이디
	 * @param memberPw 비밀번호
	 * @return 회원탈퇴 성공시 회원정보에 null 값 반환, 실패시 오류 메세지
	 * @throws Exception 예외
	 */
	public static Member removeMember(String memberId, String memberPw) throws Exception {
		if(exist(memberId) == -1) {
			System.out.println("잘못된 회원정보입니다.\n회원탈퇴메뉴로 되돌아갑니다.");
			MMS_Menu.removeMemberInfo();
		}
		int index = exist(memberId);
		if (index >= 0 && list.get(index).getMemberPw().equals(memberPw)) {
			System.out.println("탈퇴처리가 완료되었습니다.\n메인메뉴로 돌아갑니다.");
			return list.remove(index);
		} else if (index >= 0 && !(list.get(index).getMemberPw().equals(memberPw))) {
			System.out.println("회원정보가 일치하지 않습니다.\n회원탈퇴메뉴로 되돌아갑니다.");
			MMS_Menu.removeMemberInfo();
		}
		return null;
	}

	
//	/**
//	 *  회원정보 삭제
//	 * @param memberId 아이디
//	 * @return 회원 정보 삭제
//	 * @throws RecordNotFoundException 저장값 없음 오류
//	 */
//	public Member deleteMember(String memberId) throws RecordNotFoundException {
//		int index = exist(memberId);
//		if(index >= 0) {
//		return (Member)list.remove(index);
//		}
//		return null;
//	}
	
	
	/**
	 * 2. 회원 가입
	 * -- 사용자 입력 데이터 : 아이디, 비밀번호, 이름, 휴대폰, 이메일
	 * -- 시스템 최초 가입처리 : 가입일, 등급, [마일리지] 
	 * @param dto 등록회원
	 * @throws DuplicateException 중복 오류 중복정의 오류
	 */
	public static void addMember(Member dto) throws DuplicateException {
		int index = exist(dto.getMemberId());
		if(index >= 0) {
			throw new DuplicateException(dto.getMemberId());
		}
		list.add(dto);
	}
	
	
	/**
	 * 2-a 회원 가입
	 * -- 사용자 입력 데이터 : 아이디, 비밀번호, 이름, 휴대폰, 이메일
	 * -- 시스템 최초 가입처리 : 가입일, 등급, [마일리지] 
	 * @param memberId 아이디
	 * @param memberPw 비밀번호
	 * @param name 이름
	 * @param mobile 휴대폰
	 * @param email 이메일
	 * @throws Exception 예외
	 */
	public static void addMember(String memberId, String memberPw, String name, String mobile, String email) throws Exception {
		Member dto = new Member(memberId, memberPw, name, mobile, email);
		dto.setGrade("G");
		dto.setEntryDate(Utility.getCurrentDate());
		dto.setMileage(1000);
		
		try {
			addMember(dto);
		} catch (DuplicateException e) {
			System.out.println("사용할 수 없는 회원정보가 있습니다.\n메인메뉴로 돌아갑니다.");
			MMS_Menu.mainMenu();
		}
	}
	
	
	/**
	 * 3. 아이디 찾기
	 * -- 처리절차
	 * 	1. 이름, 휴대폰, 이메일을 입력 후 세가지 정보가 동일하면
	 * 	- true : 아이디 반환
	 * 	- false : 오류 출력
	 * 	2. 휴대폰, 이메일 값이 다른 경우? 아예 방법이 없나?
	 * -- 메서드명 findMemberId
	 * -- 매개변수 name, mobile, email
	 * -- 반환타입 memberId
	 * @param name 이름
	 * @param mobile 휴대폰
	 * @param email 이메일
	 * @return 이름 휴대폰 이메일 값 동일 : 아이디 반환, 다른 경우 오류 메세지
	 * @throws RecordNotFoundException 저장값 없음 오류
	 */
	public static boolean findMemberId(String name, String mobile, String email) throws RecordNotFoundException {
		int index = existName(name);
		if (index >=0 && list.get(index).getMobile().equals(mobile) && list.get(index).getEmail().equals(email)) {
			System.out.println("당신의 ID는 " + list.get(index).getMemberId() + "입니다.");
				return true;
				} else {
					System.out.println("회원정보를 다시 확인해주시기 바랍니다.");
					return false; 
		}
	}
	
	
	/**
	 * 4. 비밀번호 찾기
	 * -- 처리절차
	 * 	1. 아이디, 이름, 휴대폰, 이메일 정보가 동일하면 
	 * 		- true 	: 패스 변경 직행
	 * 		- false : 오류 출력
	 *  2. 패스워드 변경값과 패스워드 변경값 재입력이 동일하면
	 *  	- true  : 패스워드 변경
	 *  	- false : 패스워드 변경 실패시, 패스워드 재입력  
	 * -- 메서드명 findMemberPw
	 * -- 매개변수 memberId, name, mobile, email
	 * -- 반환타입 memberPw
	 * @param memberId 아이디
	 * @param name 이름
	 * @param mobile 휴대폰
	 * @param email 이메일
	 * @param modifyPw 변경할 비밀번호
	 * @param modifyPwConfirm 변경할 비밀번호 확인
	 * @return 아이디, 이름, 휴대폰, 이메일 정확하고, 새비밀번호와 새비밀번호 확인 동일하면 비밀번호 변경, 하나라도 값이 다르면 오류
	 * @throws Exception 예외
	 */
	public static boolean findMemberPw(String memberId, String name, String mobile, String email, String modifyPw, String modifyPwConfirm) throws Exception {
		if(exist(memberId) == -1) {
			System.out.println("잘못된 회원정보입니다.\n메인메뉴로 복귀합니다.");
			MMS_Menu.mainMenu();
		}
		int index = exist(memberId);
		if (index >= 0 && list.get(index).getName().equals(name) && list.get(index).getMobile().equals(mobile) && list.get(index).getEmail().equals(email)) {
			if(modifyPw.equals(modifyPwConfirm)) {
				list.get(index).setMemberPw(modifyPw);
				System.out.println("[패스워드 변경 완료]");
				System.out.println(list.get(index));
				MMS_Menu.mainMenu();
				return true;
			} else {
				System.out.println("회원정보를 다시 확인해주시기 바랍니다.");
				
				MMS_Menu.mainMenu();
			}
		}
		return false; 
	}
	
	
	/**
	 *  회원 정보 조회
	 * @param memberId 회원아이디
	 * @return 회원아이디가 속한 인덱스 번호
	 * @throws Exception 예외
	 */
	public static Member getMember(String memberId) throws Exception {
		int index = exist(memberId);
		if(index >= 0) {
			return (Member)list.get(index);
		}
		System.out.println("회원정보를 다시 확인해주시기 바랍니다.");
		MMS_Menu.adminMemberMenu();
		return null;
	}
	

	/**
	 * 회원정보 전체 변경 
	 * @param dto 멤버 저장값
	 * @return 성공시 true, 실패시 false (아이디가 존재하지 않을 때)
	 * @throws RecordNotFoundException 저장값 없음 오류
	 */
	public boolean setMember(Member dto) throws RecordNotFoundException {
		int index = exist(dto.getMemberId());
		if(index >= 0) {
			list.set(index, dto);
			return true;
		}
		return false;
	}

	
	/**
	 * 비밀번호 변경
	 * -- 아규먼트 : 아이디, 비밀번호, 변경될 비밀번호
	 * -- 도메인 데이터 각각 : 아이디, 비밀번호, 변경비밀번호
	 * -- 도메인 객체? : Member? 안됨 도메인 속성에 변경비밀번호가 없음
	 * -- Map 사용 : Key : value
	 * @param memberId 아이디
	 * @param memberPw 비밀번호
	 * @param modifyMemberPw 변경할 비밀번호
	 * @return 성공시 변경된 비밀번호 반환, 실패시 오류 메세지
	 * @throws RecordNotFoundException 저장값 없음
	 */
	public boolean setMemberPw(String memberId, String memberPw, String modifyMemberPw) throws RecordNotFoundException {
		int index = exist(memberId);
		if (index >=0 && list.get(index).getMemberPw().equals(memberPw)) {
			list.get(index).setMemberPw(modifyMemberPw);
				return true;
				}
			System.out.println("[오류] 아이디나 비밀번호가 잘못되었습니다.");
			return false; 
	}
			
			
	/** 
	 * 현재 등록한 전체 회원 조회 
	 * @return 멤버값 저장된 리스트
	 */
	public static ArrayList getMember() {
		return list;
	}
	
	/**
	 * 현재 등록 인원수 조회
	 * @return 현재 등록 인원수
	 */
	public int getCount() {
		return list.size();
	}
	
	
	/**
	 * 회원 존재 유무 조회 : 저장된 회원 크기만큼 반복, 저장객체 조회 (Object), instanceof, type casting, equals()
	 * @since jdk 1.4
	 * @param memberId 아이디
 	 * @return 존재시 저장위치 인덱스번호 반환, 미존재시 -1
	 */
	public static int exist(String memberId) {		// memberId로 존재여부 확인하는 int exist
		for(int index = 0; index < list.size(); index++) {
			if(list.get(index).getMemberId().equals(memberId)) {
				return index;
			}
		}
		return -1;
	}
	

	/**
	 * 이름 존재 유무 조회 : 저장된 회원 크기만큼 반복, 저장객체 조회 (Object), instanceof, type casting, equals()
	 * @since jdk 1.4
	 * @param name 이름
 	 * @return 존재시 저장위치 인덱스번호 반환, 미존재시 -1
	 */
	public static int existName(String name) {		
		for(int index = 0; index < list.size(); index++) {
			if(list.get(index).getName().equals(name)) {
				return index;
			}
		}
		return -1;
	}
	
	
	/** 관리자 조회 
	 * 이름 존재 유무 조회 : 저장된 회원 크기만큼 반복, 저장객체 조회 (Object), instanceof, type casting, equals()
	 * @since jdk 1.4
	 * @param grade 등급
	 * @return 관리자가 있으면 해당 아이디 반환 없으면 -1 반환
	 * @throws RecordNotFoundException 저장값없음 
	 */
	public static int existAdmin(String grade) throws RecordNotFoundException {		
		for(int index = 0; index < list.size(); index++) {
			if(list.get(index).getGrade().equals("A")) {
//				return index;
				System.out.println(list.get(index).getMemberId());
			}
		}
		return -1;
	}
					
	
	
	
	/**
	 * 테스트를 위한 회원 초기화 등록 메서드
	 * @return 초기화 회원등록 인원수
	 * @throws DuplicateException 중복 오류 
	 */
	public int initMember() throws DuplicateException {
		Member dto1 = new Member("test01", "password01", "홍길동", "01012341000", "user01@work.com", "2020-12-15", "G", 50000, null, true, "2020-12-15", "2021-12-14");
		Member dto2 = new Member("test02", "password02", "강감찬", "01012342000", "user02@work.com", "2021-01-05", "G", 950000, null, false, null, null);
		Member dto3 = new Member("test03", "password03", "이순신", "01012343000", "user03@work.com", "2020-11-15", "S", 0, "강동원", false, null, null);
		Member dto4 = new Member("test04", "password04", "김유신", "01012344000", "user04@work.com", "2021-01-05", "S", 0, "김하린", false, null, null);
		Member dto5 = new Member("admin", "admin1004", "유관순", "01012345000", "administrator@work.com", "2020-04-01", "A", false, null, null);
		Member dto6 = new Member("t1", "p1", "김재현", "01012345678", "1@com", "2020-04-01", "A", false, null, null);
		
		addMember(dto1);
		addMember(dto2);
		addMember(dto3);
		addMember(dto4);
		addMember(dto5);
		addMember(dto6);
		
		return list.size();
	}



/**
 * 미구현 옵션들
 * 1. 회비 납부 : 1.01 반영
 * 2. 등급 업그레이드
 * 3. 운동 종목 선택시 해당 분야에 해당하는 등급표시
 * 4. 할인 등급
 */


/**
 * 회비 납부
 * -- 처리절차
 * 	1. 회비납부여부 확인
 * 		- true  : 회비 납부
 * 		- false : 미납부 
 * 	1-1. 회원관리 페이지에서 납부여부, 남은기간 확인
 *  1-2. 관리자 페이지에서 납부여부, 남은 기간 확인 / 납부여부 설정 가능
 *  1-3. 납부설정 : 회비납부 여부 설정, 납부일 설정(기본 오늘날짜) / 마감일 (기본 계산값) 설정
 * 	2. 회비납부일자 입력 : 납부일 기본값 : 오늘날짜
 * 	3. 회비마감일 출력 : 회비마감까지 남은 기간 표시 
 * -- 메서드명 fee, feePeriodstart, feePeriodEnd
 * -- 매개변수 getCurrentDate
 * -- 반환타입 String
 */


/**
 * 마일리지 정책?
 * 1. 로그인시마다 일반회원은 마일리지 500 추가
 * 2. ... ...
 */

/**
 * 로그인시 등급 업그레이드
 * -- 처리절차
 * 		- 아이디와 패스워드를 입력해서
 * 			- true : 회원관리 서비스 접속
 * 			- false : 오류 출력
 * -- 메서드명 : login
 * -- 매개변수 : memberId, memberPw
 * -- 반환타입 : boolean
 * 					- true 	: 접속성공
 * 					- false : 접속실패 
 * 1. 회원전용서비스 : boolean
 * 2. 회원등급별차등서비스 : 로그인성공 - 해당 회원의 등급(String), 로그인 실패(null) - 아이디 미존재, 아이디 비밀번호 불일치
 * [3. 우수회원 등업처리 연동]
 * 		3.1 : 로그인 성공시
 * 		3.2 : 등급은 일반회원 & 마일리지 100,000 이하?
 * 			- 로그인시 마일리지 추가
 * 		3.3 : 등급은 일반회원 & 마일리지 100,000 이상?
 * 			- 우수회원 등업처리 메서드 호출
 * 		
 */	

/**
 * 우수회원 등업메서드
 * -- 처리절차 
 * 1. 아이디 매개변수 전달 - 일반회원이고, 마일리지 100000
 * 2. 등급 : 우수회원 변경
 * 3. 담당자 : 배정
 * 4. 마일리지 : 0 변경
 * 5. 배정된 담당자
 * 		1. 일반회원의 마일리지가 100000 같거나 클 때,
 * 		2. grade 를 "S" 로 변경
 * 		3. manager 를 String 타입 배정
 * 			- 담당자 배정 
 * 				1. 담당자 리스트 중 배정받지 않은 순서대로
 * 				2. 미배정 담당자가 없으면 랜덤
 * -- 메서드명 : 
 * -- 매개변수 : 회원아이디
 * -- 반환타입 : 담당자
 * @param memberId 
 * @throws RecordNotFoundException 저장값없음 오류
 */
}