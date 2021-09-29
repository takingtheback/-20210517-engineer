package com.work.view;

import java.sql.Date;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import com.work.exception.CommonException;
import com.work.exception.DuplicateException;
import com.work.exception.RecordNotFoundException;
import com.work.model.dto.Member;
import com.work.model.service.MemberService;
import com.work.util.Utility;

/**
 * <pre>
 * 회원관리 시스템 메인메뉴 
 *  -- show 링크 참조 : 피그마를 통한 작업 전개도 작성
 * 
 * </pre>
 * @author 김재현
 * @version ver.1.01
 * @since jdk1.8
 * 브레인스토밍작업
 * -- 피그마 https://www.figma.com/file/8mZnhKYhsFe8T9dI2owwQA/Untitled?node-id=0%3A1
 */
public class MMS_Menu {

	public static void main(String[] args) throws Exception {
		/** 회원관리 서비스 이용위한 객체 생성 */
		MemberService service = new MemberService();
		
		
		/** 테스트용 초기맴버 생성 */
		try {
			service.initMember();
		} catch (DuplicateException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		
		/** 테스트용 현재 맴버수 확인 */
//		Utility.print("현재 등록 인원 : " + service.getCount());
		
		
		/** 메인메뉴 화면 실행 */
		mainMenu();
	}	
	
			
	/** 0. 메인메뉴 화면 
	 * 	- case 1 : 로그인 
	 * 	- case 2 : 회원가입
	 * 	- case 3 : 아이디찾기
	 * 	- case 4 : 비밀번호찾기
	 * 	- case 0 : 시스템 종료
	 * 	- default : 오류
	 * @throws Exception 예외
	 */
	public static void mainMenu() throws Exception {
		Utility.printTitle("회원관리 시스템 메인메뉴 \nVer 1.01 ");
		
		System.out.println("1. 로그인");
		System.out.println("2. 회원가입");
		System.out.println("3. 아이디찾기");
		System.out.println("4. 비밀번호찾기");
		System.out.println("0. 프로그램 종료");
		Utility.singleLine();
		System.out.print("메뉴번호 입력 => ");
		
		while(true) {
			int menuNo = Utility.inputNumber();
			switch(menuNo) {
			case 1:
				loginMenu();
				break;
			case 2:
				addMemberMenu();
				break;
			case 3:
				findIdMenu();
				break;
			case 4:
				findPwMenu();
				break;
			case 0:
				exitMenu();
				break;
			default:
				System.out.println("메뉴번호를 다시 눌러주세요. 재입력해주세요.");
				mainMenu();
				break;
			}
		}
	}
		
	
	/** 1. 로그인 메뉴 화면 
	 * @throws Exception 예외
	 */
	public static void loginMenu() throws Exception {
		Utility.printTitle("로그인 메뉴");
		System.out.print("아이디 : ");
		String memberId = Utility.inputString();
		
		System.out.print("비밀번호 : ");
		String memberPw = Utility.inputString();
		
		MemberService.loginService(memberId, memberPw);
	}
	

	/** 
	 * 1-1. 회원 메뉴 화면 
	 * (진입경로 : 메인메뉴/ 로그인/ 회원메뉴) 
	 * 화면 구성
	 * 	- case 1 : 로그인 
	 * 	- case 2 : 회원가입
	 * 	- case 9 : 아이디찾기
	 * 	- case 0 : 시스템 종료
	 * 	- default : 오류
	 * @throws Exception 예외
	 */ 
	public static void generalMemberMenu() throws Exception {
		Utility.printTitle("일반 회원 메뉴");
		System.out.println("1. 내정보 변경");
		System.out.println("9. 로그아웃");
		System.out.println("0. 종료");
		Utility.singleLine();
		System.out.print("메뉴번호 입력 => ");
		
		while(true) {
			int menuNo = Utility.inputNumber();
			switch(menuNo) {
			case 1:
				changeMemberInfo();
				break;
			case 9:
				logoutMenu();
				break ;
			case 0:
				exitMenu();
				break;
			default:
				System.out.println("메뉴번호를 다시 눌러주세요.");
				generalMemberMenu();
				break;
			}
		}
	}

	
	/**
	 * 내정보 변경 화면 
	 * 	- case 1 : 비밀번호 변경
	 * 	- case 2 : 이름 변경
	 * 	- case 3 : 휴대폰 변경
	 * 	- case 4 : 이메일 변경
	 *  - case 5 : 회원탈퇴
	 * 	- case 8 : 회원 메뉴 복귀
	 * 	- case 9 : 로그아웃
	 * 	- case 0 : 시스템 종료
	 */ 
	public static void changeMemberInfoNumberMenu() {
		System.out.println("1. 비밀번호 변경");
		System.out.println("2. 이름 변경");
		System.out.println("3. 휴대폰 변경");
		System.out.println("4. 이메일 변경");
		System.out.println("5. 회원탈퇴");
		System.out.println("8. 내정보 조회");
		System.out.println("9. 로그아웃");
		System.out.println("0. 프로그램 종료");
		Utility.singleLine();
		System.out.print("메뉴번호 입력 => ");
	}
	
	
	/**
	 * 1-1-2. 내정보 변경 메뉴 
	 * (진입경로 : 메인메뉴/ 로그인/ 회원메뉴/ 내정보 변경) 
	 * 화면 구성
	 * 변경할 항목 선택
	 * @throws Exception 예외
	 */
	public static void changeMemberInfo() throws Exception {
		Utility.printTitle("내정보 변경");
		
		System.out.print("아이디 : ");
		String memberId = Utility.inputString();
		
		System.out.print("비밀번호 : ");
		String memberPw = Utility.inputString();
		Utility.singleLine();
		
		if(MemberService.exist(memberId) == -1) {
			System.out.println("잘못된 회원정보입니다.\n로그인메뉴로 복귀합니다.");
			loginMenu();
		}
		Member dto = MemberService.getMember(memberId);
		if (dto.getMemberPw().equals(memberPw)) {
		
		changeMemberInfoNumberMenu();

		while(true) {
			int menuNo = Utility.inputNumber();
			switch(menuNo) {
			case 1:
				System.out.print("변경할 비밀번호 : ");
				String modifyPw = Utility.inputString();
				dto.setMemberPw(modifyPw);
				System.out.println("변경 후 " + dto.getMemberId() + "님의 회원정보\n" + dto);
				Utility.singleLine();
				changeMemberInfoNumberMenu();
				break ;
			case 2:
				System.out.print("변경할 이름 : ");
				String name = Utility.inputString();
				dto.setName(name);
				System.out.println("변경 후 " + dto.getMemberId() + "님의 회원정보\n" + dto);
				Utility.singleLine();
				changeMemberInfoNumberMenu();
				break ;
			case 3:
				System.out.print("변경할 휴대폰 : ");
				String mobile = Utility.inputString();
				dto.setMobile(mobile);
				System.out.println("변경 후 " + dto.getMemberId() + "님의 회원정보\n" + dto);
				Utility.singleLine();
				changeMemberInfoNumberMenu();
				break ;
			case 4:
				System.out.print("변경할 이메일 : ");
				String email = Utility.inputString();
				dto.setEmail(email);
				System.out.println("변경 후 " + dto.getMemberId() + "님의 회원정보\n" + dto);
				Utility.singleLine();
				changeMemberInfoNumberMenu();
				break ;
			case 5:
				removeMemberInfo();
				break ;
			case 8:
				System.out.println(dto);
				Utility.singleLine();
				changeMemberInfoNumberMenu();
				break ;
			case 9:
				logoutMenu();
				break ;	
			case 0:
				exitMenu();
				break;
			default:
				System.out.println("메뉴번호를 다시 눌러주세요.");
				changeMemberInfo();
				break;
				}
			}
		} else {
			System.out.println("회원 정보가 잘못되었습니다.");
			changeMemberInfo();
		}
	}
	
	
	/**
	 * 1-1-2-5. 회원탈퇴 메뉴
	 * (진입경로 : 메인메뉴/ 로그인/ 회원메뉴/ 내정보 변경/ 회원탈퇴)
	 * 화면구성
	 * - 회원 탈퇴시 안내사항 안내
	 * - 탈퇴 의사 확인
	 * - 아이디, 비밀번호 확인
	 * - true : 삭제 (null 처리) 탈퇴완료 안내문구 후 메인메뉴 복귀
	 * - false : 실패 탈퇴페이지 복구
	 * @throws Exception 예외
	 */  
	public static void removeMemberInfo() throws Exception {
		Utility.printTitle("회원탈퇴");
		System.out.println("회원탈퇴시 기존 정보는 삭제되며 복구가 불가능합니다. \n안내사항을 확인했으며 탈퇴에 동의합니다.");
		System.out.println("1. 동의 후 탈퇴");
		System.out.println("2. 회원 메뉴 복귀");
		Utility.singleLine();
		System.out.print("메뉴번호 입력 => ");
		while(true) {
			int menuNo = Utility.inputNumber();
			switch(menuNo) {
			case 1:
				removePage();
				break ;
			case 2:
				generalMemberMenu();
				break ;
			default:
				System.out.print("메뉴번호를 다시 눌러주세요.");
				removeMemberInfo();
				break ;
			}
		}
	}
	
	
	/**
	 * 회원탈퇴페이지
	 * 아이디 비밀번호 입력후 
	 * 정보 맞으면 탈퇴처리 후 메인메뉴, 틀리면 오류
	 * @throws Exception 예외
	 */
	public static void removePage() throws Exception {
		Utility.printTitle("회원탈퇴");
		System.out.print("아이디 : ");
		String memberId = Utility.inputString();
	
		System.out.print("비밀번호 : ");
		String memberPw = Utility.inputString();
		
		MemberService.removeMember(memberId, memberPw);
		mainMenu();
	}
	
	
	/** 
	 * 1-2. 관리자 메뉴 화면 
	 * (진입경로 : 메인메뉴/ 로그인/ 관리자메뉴) 
	 * 화면구성
	 * 1. 내정보 조회
	 * 2. 내정보 변경
	 * 3. 회원 전체 조회
	 * 4. 회원 상세 조회
	 * 5. 회원 정보 변경
	 * 9. 로그아웃
	 * 0. 프로그램 종료 
	 * @throws Exception 예외
	 */
	public static void adminMemberMenu() throws Exception {
		Utility.printTitle("관리자 메뉴");
		System.out.println("1. 관리자 정보 조회");
		System.out.println("2. 관리자 정보 변경");
		System.out.println("3. 회원 전체 조회");
		System.out.println("4. 회원 상세 조회");
		System.out.println("5. 회원 정보 변경");
		System.out.println("9. 로그아웃");
		System.out.println("0. 프로그램 종료");
		Utility.singleLine();
		System.out.print("메뉴번호 입력 => ");
		
		while(true) {
			int menuNo = Utility.inputNumber();
			switch(menuNo) {
			case 1:
				showAdminInfo();
				break;
			case 2:
				changeAdminInfo();
			case 3:
				allMemberInfo();
				break;
			case 4:
				memberInfo();
				break;
			case 5:
				memberInfoChange();
				break;
			case 9:
				logoutMenu();
				break ;
			case 0:
				exitMenu();
				break;
			default:
				System.out.println("메뉴번호를 다시 눌러주세요.");
				adminMemberMenu();
				break;
			}
		}
	}		
	
	
	/**
	 * 1-2-1. 관리자 정보 조회 화면 
	 * (진입경로 : 메인메뉴/ 로그인/ 관리자메뉴/ 관리자정보 조회) 
	 * 화면 구성
	 * 1. 아이디
	 * 2. 이름
	 * 3. 휴대폰
	 * 4. 이메일
	 * 5. 가입일
	 * 6. 회원등급
	 * 기능 구성
	 * 	- case 1 : 관리자 정보 변경
	 * 	- case 8 : 관리자 메뉴 복귀
	 * 	- case 9 : 로그아웃
	 * 	- case 0 : 시스템 종료
	 * @throws Exception 예외
	 */ 
	public static void showAdminInfo() throws Exception {
		Utility.printTitle("관리자 정보 조회");
		System.out.println("현재 등록된 관리자 명단");
		MemberService.existAdmin("A");
		System.out.println("조회할 관리자 아이디 입력 =>");
		MemberService service = new MemberService();
		Member dto = null;
			dto = service.getMember(Utility.inputString());
			if (dto != null) {
				System.out.println(dto);
		
			Utility.singleLine();
			System.out.println("1. 관리자 정보 변경");
			System.out.println("8. 관리자 메뉴 복귀");
			System.out.println("9. 로그아웃");
			System.out.println("0. 프로그램 종료");
			Utility.singleLine();
			System.out.print("메뉴번호 입력 => ");
		
				while(true) {
					int menuNo = Utility.inputNumber();
					switch(menuNo) {
					case 1:
						changeAdminInfo();
						break ;
					case 8:
						adminMemberMenu();
						break ;
					case 9:
						logoutMenu();
						break ;	
					case 0:
						exitMenu();
						break;
					default:
						System.out.println("메뉴번호를 다시 눌러주세요.");
						showAdminInfo();
						break;
				}
			}
		}
	}
	
	
	/**
	 * 1-2-2. 관리자 정보 변경 화면 
	 * (진입경로 : 메인메뉴/ 로그인/ 관리자메뉴/ 관리자정보 변경) 
	 * 화면 구성
	 * 변경할 항목 선택
	 * 1. 비밀번호
	 * 2. 이름
	 * 3. 휴대폰
	 * 4. 이메일
	 * 기능 구성
	 * 	- case 1 : 비밀번호 변경
	 * 	- case 2 : 이름 변경
	 * 	- case 3 : 휴대폰 변경
	 * 	- case 4 : 이메일 변경
	 * 	- case 8 : 회원 메뉴 복귀
	 * 	- case 9 : 로그아웃
	 * 	- case 0 : 시스템 종료
	 * @throws Exception 예외
	 */ 
	public static void changeAdminInfo() throws Exception {
		MemberService service = new MemberService();
		Member dto = null;
		Utility.printTitle("관리자 정보 변경");
		System.out.println("현재 등록된 관리자 명단");
		MemberService.existAdmin("A");
		System.out.println("변경할 관리자 아이디 입력 =>");
		
			dto = service.getMember(Utility.inputString());
			if (dto != null) {
				System.out.println(dto);
		Utility.singleLine();
		System.out.println("1. 비밀번호 변경");
		System.out.println("2. 이름 변경");
		System.out.println("3. 휴대폰 변경");
		System.out.println("4. 이메일 변경");
		System.out.println("8. 관리자 메뉴 복귀");
		System.out.println("9. 로그아웃");
		System.out.println("0. 프로그램 종료");
		Utility.singleLine();
		System.out.print("메뉴번호 입력 => ");

			while(true) {
				int menuNo = Utility.inputNumber();
				switch(menuNo) {
				case 1:
					System.out.print("변경할 비밀번호 : ");
					String memberPw = Utility.inputString();
					dto.setMemberPw(memberPw);
					System.out.println("변경 후 " + dto.getMemberId() + "님의 회원정보\n" + dto);
					adminMemberMenu();
					break ;
				case 2:
					System.out.print("변경할 이름 : ");
					String name = Utility.inputString();
					dto.setName(name);
					System.out.println("변경 후 " + dto.getMemberId() + "님의 회원정보\n" + dto);
					adminMemberMenu();
					break ;
				case 3:
					System.out.print("변경할 휴대폰 : ");
					String mobile = Utility.inputString();
					dto.setMobile(mobile);
					System.out.println("변경 후 " + dto.getMemberId() + "님의 회원정보\n" + dto);
					adminMemberMenu();
					break ;
				case 4:
					System.out.print("변경할 이메일 : ");
					String email = Utility.inputString();
					dto.setEmail(email);
					System.out.println("변경 후 " + dto.getMemberId() + "님의 회원정보\n" + dto);
					adminMemberMenu();
					break ;
				case 8:
					adminMemberMenu();
					break ;
				case 9:
					logoutMenu();
					break ;	
				case 0:
					exitMenu();
					break;
				default:
					System.out.println("메뉴번호를 다시 눌러주세요.");
					changeAdminInfo();
					break;
				}
			}
		}
	}
	
	
	/** 
	 * 1-2-3 회원 전체 조회
	 * (진입경로 : 메인메뉴/ 로그인/ 관리자메뉴/ 회원전체조회)   
	 * 정보 전체 조회 및 회원변경으로 이동 가능
	 * @throws Exception 예외
	 */
	public static void allMemberInfo() throws Exception {
		Utility.printTitle("회원 전체 조회");
		
		MemberService service = new MemberService();
		ArrayList list = service.getMember();
		for(int index = 0; index < list.size(); index++) {
			System.out.println(list.get(index));
		}
		
		Utility.singleLine();
		System.out.println("1. 회원 상세조회");
		System.out.println("2. 회원정보 변경");
		System.out.println("8. 관리자 메뉴 복귀");
		System.out.println("9. 로그아웃");
		System.out.println("0. 프로그램 종료");
		Utility.singleLine();
		System.out.print("메뉴번호 입력 => ");

		while(true) {
			int menuNo = Utility.inputNumber();
			switch(menuNo) {
			case 1:
				memberInfo();
				break ;
			case 2:
				memberInfoChange();
				break ;
			case 8:
				adminMemberMenu();
				break ;
			case 9:
				logoutMenu();
				break ;	
			case 0:
				exitMenu();
				break;
			default:
				System.out.println("메뉴번호를 다시 눌러주세요.");
				allMemberInfo();
				break;
			}
		}
	}
		
	
	/** 
	 * 1-2-4 회원 검색 및 조회
	 * (진입경로 : 메인메뉴/ 로그인/ 관리자메뉴/ 회원상세조회) 
	 * 개별 회원 조회 및 회원 변경으로 이동 가능
	 * @throws Exception 예외
	 */
	public static void memberInfo() throws Exception {
		Utility.printTitle("회원 검색 및 조회");
		System.out.println("조회할 아이디 입력 =>");
		MemberService service = new MemberService();
		Member dto = null;
			
			dto = service.getMember(Utility.inputString());
			
			if (dto != null) {
				System.out.println(dto);
				
				Utility.singleLine();
				System.out.println("1. 다른 회원 조회");
				System.out.println("2. 회원정보 변경");
				System.out.println("3. 관리자 메뉴 복귀");
				System.out.println("0. 프로그램 종료");
				Utility.singleLine();
				System.out.print("메뉴번호 입력 => ");

				while(true) {
					int menuNo = Utility.inputNumber();
					switch(menuNo) {
					case 1:
						 memberInfo();
						break ;
					case 2:
						memberInfoChange();
						break ;
					case 3:
						adminMemberMenu();
						break ;
					case 0:
						exitMenu();
						break;
					default:
						System.out.println("메뉴번호를 다시 눌러주세요.");
						memberInfo();
						break;
					}
				}		
			}
	}

	
	/** 
	 * 1-2-5 회원정보 변경 메뉴
	 * (진입경로 : 메인메뉴/ 로그인/ 관리자메뉴/ 회원정보 변경) 
	 * 화면구성
	 *  - 변경할 회원 조회 후 아이디가 있으면 다음 번호 해당항목 변경
	 *  - 아이디 없는 경우 오류 메세지
	 * 기본 : 변경할 아이디 입력
	 * 1. 이름
	 * 2. 휴대폰
	 * 3. 이메일
	 * 4. 가입일
	 * 5. 등급
	 * @throws Exception 예외
	 */
	public static void memberInfoChangeMenu() throws Exception {
		Utility.printTitle("회원 정보 변경 메뉴");
		System.out.println("1. 회원정보 변경");
		System.out.println("2. 관리자 메뉴 복귀");
		System.out.println("0. 프로그램 종료");
		Utility.singleLine();
		System.out.print("메뉴번호 입력 => ");
		
		while(true) {
			int menuNo = Utility.inputNumber();
			switch(menuNo) {
			case 1:
				System.out.print("1. 회원정보 변경");
				memberInfoChange();
				break ;
			case 2:
				System.out.print("2. 관리자 메뉴 복귀");
				adminMemberMenu();
				break ;
			case 0:
				exitMenu();
				break;
			default:
				System.out.println("메뉴번호를 다시 눌러주세요.");
				memberInfoChangeMenu();
				break;
			}
		}
	}
	
	/** 
	 * 1-2-5 회원정보 변경 메뉴
	 * (진입경로 : 메인메뉴/ 로그인/ 관리자메뉴/ 회원정보 변경)
	 * @throws Exception 예외 
	 */ 
	public static void memberInfoChange() throws Exception {
		Utility.printTitle("회원 정보 변경");
		System.out.print("변경할 아이디 입력 =>");
		MemberService service = new MemberService();
		Member dto = null;
			
				dto = service.getMember(Utility.inputString());
		
			if (dto != null) {
				System.out.println(dto);
				
				Utility.singleLine();
				
				System.out.println("1. 이름 변경");
				System.out.println("2. 휴대폰 변경");
				System.out.println("3. 이메일 변경");
				System.out.println("4. 가입일 변경");
				System.out.println("5. 등급 변경");
				System.out.println("6. 회비 납부");
				System.out.println("9. 관리자 메뉴 복귀");
				System.out.println("0. 프로그램 종료");
				Utility.singleLine();
				System.out.print("메뉴번호 입력 => ");

				while(true) {
					int menuNo = Utility.inputNumber();
					switch(menuNo) {
					case 1:
						System.out.print("변경할 이름 : ");
						String name = Utility.inputString();
						dto.setName(name);
						System.out.println("변경 후 " + dto.getMemberId() + "님의 회원정보\n" + dto);
						memberInfoChangeMenu();
						break ;
					case 2:
						System.out.print("변경할 휴대폰 : ");
						String mobile = Utility.inputString();
						dto.setMobile(mobile);
						System.out.println("변경 후 " + dto.getMemberId() + "님의 회원정보\n" + dto);
						
						memberInfoChangeMenu();
						break ;
					case 3:
						System.out.print("변경할 이메일 : ");
						String email = Utility.inputString();
						dto.setEmail(email);
						System.out.println("변경 후 " + dto.getMemberId() + "님의 회원정보\n" + dto);
						
						memberInfoChangeMenu();
						break ;
					case 4:
						System.out.print("변경할 가입일(yyyy-MM-dd) : ");
						String entryDate = Utility.inputString();
						dto.setEntryDate(entryDate);
						System.out.println("변경 후 " + dto.getMemberId() + "님의 회원정보\n" + dto);
						
						memberInfoChangeMenu();
						break ;
					case 5:
						System.out.print("변경할 등급(일반:G, 관리자:A) : ");
						String grade = Utility.inputString();
						if(grade.equals("G") || grade.equals("A")) {
							dto.setGrade(grade);
							System.out.println("변경 후 " + dto.getMemberId() + "님의 회원정보\n" + dto);
							} else {
							System.out.println("등급설정이 잘못되었습니다.");
							memberInfoChange();
						}
						memberInfoChangeMenu();
						break ;
					case 6:
						System.out.println("1. 회비납부");
						System.out.println("2. 회비미납");
						System.out.println("8. 회원정보 변경 메뉴 복귀");
						System.out.println("9. 관리자화면 복귀");
						Utility.singleLine();
						System.out.print("메뉴번호 입력 => ");
							while(true) {
								menuNo = Utility.inputNumber();
								switch(menuNo) {
								case 1:
									dto.setDues(true);
									System.out.print("회비납부 일자 입력\n1. 오늘날짜 \n2. 직접입력\n8. 회원정보 변경 메뉴 복귀\n메뉴번호 입력 => ");
									while(true) {
										menuNo = Utility.inputNumber();
										switch(menuNo) {
										case 1:
											 dto.setStartDateDues(Utility.getCurrentDate());
											 System.out.print("회비납부 개월수 입력: ");
											 menuNo = Utility.inputLongNumber();
											 String endMonth = Utility.addMonth(Utility.getCurrentDate(), menuNo);
											 dto.setEndDateDues(endMonth);
											 Utility.singleLine();
											 System.out.println("변경 후 " + dto.getMemberId() + "님의 회원정보\n" + dto);
											 memberInfoChangeMenu();
										case 2:
											Utility.singleLine();
											System.out.println("회비납부 정보를 입력해주세요.");
											System.out.print("년도(yyyy) : ");
											String yearString = Utility.inputString();
											System.out.print("월(MM) : ");
											String monthString = Utility.inputString();
											System.out.print("일(dd) : ");
											String dateString = Utility.inputString();
											
											String date = yearString + "-" + monthString + "-" + dateString;
//										    Date startDate = Date.valueOf(date);
//									    	System.out.println(startDate);
											
											dto.setStartDateDues(date);
											System.out.print("회비납부 개월수 입력: ");
											int month = Utility.inputNumber();
											try {
											endMonth = Utility.addMonth(date, month);
											dto.setEndDateDues(endMonth);
											Utility.singleLine();
											System.out.println("변경 후 " + dto.getMemberId() + "님의 회원정보\n" + dto);
											memberInfoChangeMenu();
											} catch (ParseException e) {
												System.out.println("잘못된 입력형식입니다.\n회원 정보 변경 메뉴로 이동합니다.");
												memberInfoChangeMenu();
											} catch (Exception e) {
												System.out.println("오작동이 발견되었습니다.\n메인 메뉴로 이동합니다.");
												mainMenu();
											}
											break ;	 
										case 8:
											memberInfoChangeMenu();
											break ;		
										case 9:
											adminMemberMenu();
											break ;
										default:
											System.out.println("메뉴번호를 다시 눌러주세요.");
											memberInfoChange();
											break;
										}
									}
									
										
								case 2:
									dto.setDues(false);
									dto.setStartDateDues(null);
									dto.setEndDateDues(null);
									System.out.println("변경 후 " + dto.getMemberId() + "님의 회원정보\n" + dto);
									memberInfoChangeMenu();
									break ;
								case 8:
									memberInfoChangeMenu();
									break ;		
								case 9:
									adminMemberMenu();
									break ;
								default:
									System.out.println("메뉴번호를 다시 눌러주세요.");
									memberInfoChange();
									break;
								}
							}
						
					case 9:
						adminMemberMenu();
						break ;
					case 0:
						exitMenu();
						break;
					default:
						System.out.println("메뉴번호를 다시 눌러주세요.");
						memberInfoChange();
						break;
					}
				}		
			}
	}
				
	
	
	/**	2. 회원가입 메뉴 화면 
	 * @throws Exception 예외
	 */
	public static void addMemberMenu() throws Exception {
		Utility.printTitle("회원 가입");
		System.out.print("아이디 : ");
		String memberId = Utility.inputString();
		
		System.out.print("비밀번호 : ");
		String memberPw = Utility.inputString();
		
		System.out.print("이름 : ");
		String name = Utility.inputString();
		
		System.out.print("휴대폰 : ");
		String mobile = Utility.inputString();
		
		System.out.print("이메일 : ");
		String email = Utility.inputString();
		
		MemberService.addMember(memberId, memberPw, name, mobile, email);
		mainMenu();
	} 

	
	/** 
	 * 3. 아이디찾기 메뉴 화면 
	 * 기능 구성
	 * - 가입시 작성한 이름, 휴대폰, 이메일 입력 후 
	 * - true : 가입시 아이디 반환
	 * - false : 오류메세지 
	 * 
	 * 아이디 확인 후
	 * 	- case 1 : 아이디찾기
	 * 	- case 2 : 비밀번호 찾기
	 * 	- case 3 : 로그인
	 * 	- case 4 : 메인메뉴
	 *  - case 0 : 시스템 종료
	 * @throws Exception 예외
	 */ 
	public static void findIdMenu() throws Exception {
		Utility.printTitle("아이디찾기 메뉴");
		System.out.println("가입시 작성한 정보를 입력해주세요.");
		Utility.singleLine();
		System.out.print("이름 : ");
		String name = Utility.inputString();

		System.out.print("휴대폰 : ");
		String mobile = Utility.inputString();
	
		System.out.print("이메일 : ");
		String email = Utility.inputString();
		Utility.singleLine();
		
		MemberService.findMemberId(name, mobile, email);
		
		Utility.singleLine();
		System.out.println("1. 아이디 찾기");
		System.out.println("2. 비밀번호 찾기");
		System.out.println("3. 로그인");
		System.out.println("3. 메인메뉴");
		System.out.println("0. 프로그램 종료");
		Utility.singleLine();
		System.out.print("메뉴번호 입력 => ");
		
		while(true) {
			int menuNo = Utility.inputNumber();
			switch(menuNo) {
			case 1:
				findIdMenu();
				break ;
			case 2:
				findPwMenu();
				break ;
			case 3:
				loginMenu();;
				break ;
			case 4:
				mainMenu();
				break ;	
			case 0:
				exitMenu();
				break;
			default:
				System.out.println("메뉴번호를 다시 눌러주세요.");
				findIdMenu();
				break;
			}
		}
	}
	
	
	/** 4. 비밀번호찾기 메뉴 화면
	 * 
	 * 기능 구성
	 * - 가입시 작성한 아이디, 이름, 휴대폰, 이메일 입력 후 
	 * - true : 비밀번호 변경 페이지 이동
	 * - false : 오류메세지 
	 * 
	 * 비밀번호 확인 후
	 * 	- case 1 : 아이디찾기
	 * 	- case 2 : 비밀번호 찾기
	 * 	- case 3 : 로그인
	 * 	- case 4 : 메인메뉴
	 *  - case 0 : 시스템 종료
	 * @throws Exception 예외
	 */   
	public static void findPwMenu() throws Exception {
		Utility.printTitle("비밀번호찾기 메뉴");
		System.out.println("가입시 작성한 정보를 입력해주세요.");
		Utility.singleLine();
		System.out.print("아이디 : ");
		String memberId = Utility.inputString();
		
		System.out.print("이름 : ");
		String name = Utility.inputString();

		System.out.print("휴대폰 : ");
		String mobile = Utility.inputString();
	
		System.out.print("이메일 : ");
		String email = Utility.inputString();
		
		Utility.singleLine();
		System.out.println("변경할 새비밀번호를 두번 동일하게 입력해주세요.");
		System.out.print("새비밀번호 : ");
		String modifyPw = Utility.inputString();
		
		System.out.print("새비밀번호 확인 : ");
		String modifyPwConfirm = Utility.inputString();
		
		MemberService.findMemberPw(memberId, name, mobile, email, modifyPw, modifyPwConfirm);
		
		Utility.singleLine();
		System.out.println("1. 아이디 찾기");
		System.out.println("2. 비밀번호 찾기");
		System.out.println("3. 로그인");
		System.out.println("3. 메인메뉴");
		System.out.println("0. 프로그램 종료");
		Utility.singleLine();
		System.out.print("메뉴번호 입력 => ");
		
		while(true) {
			int menuNo = Utility.inputNumber();
			switch(menuNo) {
			case 1:
				findIdMenu();
				break ;
			case 2:
				findPwMenu();
				break ;
			case 3:
				loginMenu();;
				break ;
			case 4:
				mainMenu();
				break ;	
			case 0:
				exitMenu();
				break;
			default:
				System.out.println("메뉴번호를 다시 눌러주세요.");
				findPwMenu();
				break;
			}
		}
	}
		
	
	/** 로그아웃 메뉴 
	 * @throws Exception 예외
	 */
	public static void logoutMenu() throws Exception {
		System.out.println("메인메뉴로 복귀합니다.");
		mainMenu();
	}

	
	/** 프로그램 종료 메뉴 */
	public static void exitMenu() {
		System.exit(0);
	}
}
