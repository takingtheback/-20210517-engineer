package com.work.view;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.regex.Pattern;

import com.work.exception.AuthException;
import com.work.model.FactoryDao;
import com.work.model.Member;
import com.work.model.MemberDao;
import com.work.model.MemberService;
import com.work.model.Notice;
import com.work.model.NoticeDao;
import com.work.model.NoticeService;
import com.work.util.Utility;

import javafx.animation.PauseTransition;
import oracle.net.aso.s;

/**
 * <pre>
 * 회원관리 시스템 메뉴화면 
 * </pre>
 * @author 김재현
 * @version ver2.0
 * @since jdk1.8
 *
 */
public class CUIMenu {
	/** 멤버 클래스 객체 생성 */
	public MemberService service = new MemberService();
	
	
	/** 게시판 클래스 객체 생성 */
	public NoticeService nService = new NoticeService();
	
	
	/** 싱글톤 반환 메서드 */
	private MemberDao dao = MemberDao.getInstance();
	private NoticeDao daoN = NoticeDao.getInstance();
	
	
	/** 0. 메인메뉴 화면 
	 * 	- case 1 : 로그인 
	 * 	- case 2 : 회원가입
	 * 	- case 3 : 아이디찾기
	 * 	- case 4 : 비밀번호찾기
	 * 	- case 0 : 시스템 종료
	 * @throws AuthException 인증 예외 
	 * @throws SQLException sql 예외
	 */
	public void mainMenu() throws AuthException, SQLException {
		service.updateLogout();
		printTitle("회원관리 시스템 Ver2.0 ");
		System.out.println("1. 로그인");
		System.out.println("2. 회원가입");
		System.out.println("3. 아이디찾기");
		System.out.println("4. 비밀번호찾기");
		System.out.println("0. 프로그램 종료");
		singleLine();
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
				System.out.print("[입력오류] 상위메뉴로 돌아갑니다. ");
				mainMenu();
				break;
			}
		}
	}
	

	/**
	 * 1. 로그인 메뉴 화면
	 * member_Id, member_Pw 입력 후 
	 * true : 로그인 성공
	 * false : 로그인 실패
	 * 
	 *  등급 G,S : 일반회원 페이지
	 *  등급 A : 관리자 페이지
	 * @throws AuthException 인증 예외 
	 * @throws SQLException sql 예외
	 */
	public void loginMenu() throws AuthException, SQLException {
		printTitle("로그인 메뉴");
		System.out.print("아이디 : ");
		String member_Id = Utility.inputString();
		
		System.out.print("비밀번호 : ");
		String member_Pw = Utility.inputString();
		
		
		String grade = service.loginGrade(member_Id, member_Pw);
		try {
		  if(grade.equals("G") || grade.equals("S")) {
			System.out.println(member_Id + "님 로그인 성공\n현재 등급 : " + grade);
			service.updateLogin(member_Id);
			generalMemberMenu();
			
		} else if(grade.equals("A")) {	
			System.out.println("관리자 " + member_Id  + " 로그인 성공");
			service.updateLogin(member_Id);
			adminMenu();
		} 
		
		} catch (NullPointerException e) {
			System.out.print("[입력오류] 회원정보를 확인해주세요. ");
			mainMenu();
		}
	}

	
	/** 
	 * 1-1. 일반회원 메뉴 화면 
	 * (진입경로 : 메인메뉴/ 로그인/ 회원메뉴) 
	 * 화면 구성
	 * 	- case 1 : 게시판
	 * 	- case 2 : 내정보
	 * 	- case 9 : 로그아웃
	 * 	- case 0 : 시스템 종료
	 * 	- default : 오류
	 * @throws AuthException 인증 예외 
	 * @throws SQLException sql 예외
	 */ 
	public void generalMemberMenu() throws AuthException, SQLException {
		printTitle("일반 회원 메뉴");
		System.out.println("1. 게시판");
		System.out.println("2. 내정보");
		System.out.println("9. 로그아웃");
		System.out.println("0. 종료");
		singleLine();
		System.out.print("메뉴번호 입력 => ");
		
		while(true) {
			int menuNo = Utility.inputNumber();
			switch(menuNo) {
			case 1:
				noticeMenu();
				break;
			case 2:
				memberInfo();
				break;
			case 9:
				logoutMenu();
				break ;
			case 0:
				exitMenu();
				break;
			default:
				System.out.println("[입력오류] 상위메뉴로 돌아갑니다.");
				generalMemberMenu();
				break;
			}
		}
	}
	
	/**
	 * 1-1-1. 게시판 화면
	 * (진입경로 : 메인메뉴/ 로그인/ 일반회원메뉴/게시판) 
	 * 화면 구성
	 * 	- case 1 : 게시물 전체 조회
	 * 	- case 11 : 본인 게시물 조회
	 * 	- case 2 : 게시물 상세 검색 : 제목 + 내용
	 * 	- case 3 : 게시물 상세 검색 : 작성자
	 * 	- case 4 : 게시물 상세 검색 : 제목
	 * 	- case 5 : 게시물 상세 검색 : 내용
	 * 	- case 6 : 게시물 작성
	 * 	- case 7 : 게시물 삭제
	 * 	- case 8 : 일반 회원 메뉴 복귀
	 * 	- case 9 : 로그아웃
	 * 	- case 0 : 시스템 종료
	 * 	- default : 오류
	 * 
	 * @throws AuthException 인증 예외
	 * @throws SQLException sql 예외
	 */
	public void noticeMenu() throws AuthException, SQLException {
		printTitle("게시판");
		String member_Id = service.selectIdByLogin();
		Member dto = service.getMember(member_Id);
	
		System.out.println("1. 게시물 전체 조회");
		System.out.println("11. 본인 게시물 조회");
		System.out.println("2. 게시물 상세 검색 : 제목 + 내용");
		System.out.println("3. 게시물 상세 검색 : 작성자");
		System.out.println("4. 게시물 상세 검색 : 제목");
		System.out.println("5. 게시물 상세 검색 : 내용");
		System.out.println("6. 게시물 작성");
		System.out.println("7. 게시물 삭제");
		System.out.println("8. 일반 회원 메뉴 복귀");
		System.out.println("9. 로그아웃");
		System.out.println("0. 종료");
		singleLine();
		System.out.print("메뉴번호 입력 => ");
		
		while(true) {
			int menuNo = Utility.inputNumber();
			switch(menuNo) {
			case 1:
				ArrayList<Notice> list = nService.getNoticeList();
				for(Notice notices: list) {
					System.out.println(notices);
				}
				pause();
				noticeMenu();
				break;
			case 11:
				System.out.println("본인이 작성한 게시물 리스트");
				singleLine();
				list = daoN.selectListByMemberId(member_Id);
				for(Notice notices: list) {
					System.out.println(notices);
				}
				pause();
				noticeMenu();
				break;
			case 2:
				list = nService.searchNoticeTitleContents();
				for(Notice notices: list) {
					System.out.println(notices);
				}
				pause();
				noticeMenu();
				break;
			case 3:
				list = nService.searchMemberId();
				for(Notice notices: list) {
					System.out.println(notices);
				}
				pause();
				noticeMenu();
				break;
			case 4:
				list = nService.searchNoticeTitle();
				for(Notice notices: list) {
					System.out.println(notices);
				}
				pause();
				noticeMenu();
				break;
			case 5:
				list = nService.searchNoticeContents();
				for(Notice notices: list) {
					System.out.println(notices);
				}
				pause();
				noticeMenu();
				break;
			case 6:
				list = nService.createNoticeTitleContents(member_Id);
				
				pause();
				noticeMenu();
				break;
			case 7:
				System.out.println("본인이 작성한 게시물 리스트");
				list = daoN.selectListByMemberId(member_Id);
				for(Notice notices: list) {
					System.out.println(notices);
				}
				singleLine();
				list = nService.deleteNoticeTitleContents(member_Id);
				
				pause();
				noticeMenu();
				break;
			case 8:
				generalMemberMenu();
				break;
			case 9:
				logoutMenu();
				break ;
			case 0:
				exitMenu();
				break;
			default:
				System.out.println("[입력오류] 상위메뉴로 돌아갑니다.");
				noticeMenu();
				break;
			}
		}
	}
	
	
	/**
	 * 1-1-2. 내정보 메뉴 화면 
	 * (진입경로 : 메인메뉴/ 로그인/ 일반회원메뉴/ 내정보) 
	 * 화면 구성
	 * 진입시 내정보 출력
	 * 	- case 1 : 내정보 조회
	 *  - case 2 : 비밀번호 변경
	 *  - case 3 : 이름 변경
	 *  - case 4 : 휴대폰 변경
	 *  - case 5 : 이메일 변경
	 *  - case 6 : 회원 탈퇴
	 * 	- case 7 : 일반 회원 메뉴 복귀
	 * 	- case 9 : 로그아웃
	 * 	- case 0 : 시스템 종료
	 * 	- default : 오류
	 * @throws AuthException 인증 예외 
	 * @throws SQLException sql 예외
	 */
	public void memberInfo() throws AuthException, SQLException {
		try {
		printTitle("내정보");
		String member_Id = service.selectIdByLogin();
		Member dto = service.getMember(member_Id);
	
		singleLine();
		System.out.println("1. 내정보 조회");
		System.out.println("2. 비밀번호 변경");
		System.out.println("3. 이름 변경");
		System.out.println("4. 휴대폰 변경");
		System.out.println("5. 이메일 변경");
		System.out.println("7. 회원 탈퇴");
		System.out.println("8. 일반 회원 메뉴 복귀");
		System.out.println("9. 로그아웃");
		System.out.println("0. 종료");
		singleLine();
		System.out.print("메뉴번호 입력 => ");
		
		while(true) {
			int menuNo = Utility.inputNumber();
			switch(menuNo) {
			case 1:
				singleLine();
				System.out.println("내정보");
				System.out.println(dto);
				pause();
				memberInfo();
				break;
			case 2:
				service.updateMemberPw(member_Id);
				singleLine();
				memberInfo();
				break;
			case 3:
				service.updateName(member_Id);
				singleLine();
				memberInfo();
				break;
			case 4:
				service.updateMobile(member_Id);
				singleLine();
				memberInfo();
				break;
			case 5:
				service.updateEmail(member_Id);
				singleLine();
				memberInfo();
				break;
			case 7:
				deleteMemberMenu();
				break;
			case 8:
				generalMemberMenu();
				break ;
			case 9:
				logoutMenu();
				break ;
			case 0:
				exitMenu();
				break;
			default:
				System.out.println("[입력오류] 상위메뉴로 돌아갑니다.");
				memberInfo();
				break;
				}
			}
		}catch (NullPointerException e) {
			System.out.print("[입력오류] 회원정보를 확인해주세요. ");
			memberInfo();
		}
	}

	
	/**
	 * 1-1-2-7. 회원탈퇴 메뉴
	 * (진입경로 : 메인메뉴/ 로그인/ 회원메뉴/ 내정보 / 회원탈퇴)
	 * 화면구성
	 * - 회원 탈퇴시 안내사항 안내
	 * - 탈퇴 의사 확인
	 * - 아이디, 비밀번호 확인
	 * - true : 삭제 (null 처리) 탈퇴완료 안내문구 후 메인메뉴 복귀
	 * - false : 실패 탈퇴페이지 복구
	 * @throws AuthException 인증 예외
	 * @throws SQLException sql 예외
	 */  
	public void deleteMemberMenu() throws AuthException, SQLException {
		printTitle("회원탈퇴");
		System.out.println("회원탈퇴시 기존 정보는 삭제되며 복구가 불가능합니다."
				+ "\n게시판 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다."
				+ "\n안내사항을 확인했으며 탈퇴에 동의합니다.");
		System.out.println("1. 동의 후 탈퇴");
		System.out.println("2. 회원 메뉴 복귀");
		singleLine();
		System.out.print("메뉴번호 입력 => ");
		while(true) {
			int menuNo = Utility.inputNumber();
			switch(menuNo) {
			case 1:
				service.deleteMemberId();
				mainMenu();
				break ;
			case 2:
				generalMemberMenu();
				break ;
			default:
				System.out.print("[입력오류] 상위메뉴로 돌아갑니다.");
				generalMemberMenu();
				break ;
			}
		}
	}		
		
	
	/** 
	 * 1-2. 관리자 메뉴 화면 
	 * (진입경로 : 메인메뉴/ 로그인/ 관리자메뉴) 
	 * 화면구성
	 * 1. 관리자 정보 관리
	 * 2. 회원 정보 관리
	 * 3. 게시판 관리
	 * 9. 로그아웃
	 * 0. 프로그램 종료 
	 * @throws AuthException 인증 예외 
	 * @throws SQLException sql 예외
	 */
	public void adminMenu() throws AuthException, SQLException  {
		printTitle("관리자 메뉴");
		System.out.println("1. 관리자 정보 관리");
		System.out.println("2. 회원 정보 관리");
		System.out.println("3. 게시판 관리");
		System.out.println("9. 로그아웃");
		System.out.println("0. 프로그램 종료");
		singleLine();
		System.out.print("메뉴번호 입력 => ");
		
		while(true) {
			int menuNo = Utility.inputNumber();
			switch(menuNo) {
			case 1:
				adminInfoMenu();
				break;
			case 2:
				memberInfoMenu();
			case 3:
				adminNoticeMenu();
				break;
			case 9:
				logoutMenu();
				break ;
			case 0:
				exitMenu();
				break;
			default:
				System.out.println("[입력오류] 상위메뉴로 돌아갑니다.");
				adminMenu();
				break;
			}
		}
	}		
	
	
	/**
	 * 1-2-1. 관리자 정보 조회 화면 
	 * (진입경로 : 메인메뉴/ 로그인/ 관리자메뉴/ 관리자정보 조회) 
	 * 기능 구성
	 * 	- case 1 : 관리자 정보 조회
	 * 	- case 2 : 비밀번호 변경
	 * 	- case 3 : 이름 변경
	 * 	- case 4 : 휴대폰 변경
	 * 	- case 5 : 이메일 변경
	 * 	- case 8 : 관리자 메뉴 복귀
	 * 	- case 9 : 로그아웃
	 * 	- case 0 : 시스템 종료
	 * @throws AuthException 인증 예외
	 * @throws SQLException sql 예외
	 */ 
	public void adminInfoMenu() throws AuthException, SQLException {
		printTitle("관리자 정보 관리");
		String member_Id = service.selectIdByLogin();
		Member dto = service.getMember(member_Id);
		
		System.out.println("1. 관리자 정보 조회");
		System.out.println("2. 비밀번호 변경");
		System.out.println("3. 이름 변경");
		System.out.println("4. 휴대폰 변경");
		System.out.println("5. 이메일 변경");
		System.out.println("8. 관리자 메뉴 복귀");
		System.out.println("9. 로그아웃");
		System.out.println("0. 프로그램 종료");
		singleLine();
		System.out.print("메뉴번호 입력 => ");
	
			while(true) {
				int menuNo = Utility.inputNumber();
				switch(menuNo) {
				case 1:
					singleLine();
					System.out.println("관리자 정보");
					System.out.println(dto);
					pause();
					adminInfoMenu();
					break;
				case 2:
					service.updateMemberPw(member_Id);
					singleLine();
					adminInfoMenu();
					break;
				case 3:
					service.updateName(member_Id);
					singleLine();
					adminInfoMenu();
					break;
				case 4:
					service.updateMobile(member_Id);
					singleLine();
					adminInfoMenu();
					break;
				case 5:
					service.updateEmail(member_Id);
					singleLine();
					adminInfoMenu();
					break;
				case 8:
					adminMenu();
					break ;
				case 9:
					logoutMenu();
					break ;
				case 0:
					exitMenu();
					break;
				default:
					System.out.println("[입력오류] 상위메뉴로 돌아갑니다.");
					adminInfoMenu();
					break;
			}
		}
	}
	
	
	/**
	 * 1-2-2. 회원 정보 관리 화면 
	 * (진입경로 : 메인메뉴/ 로그인/ 관리자메뉴/ 회원정보관리) 
	 * 기능 구성
	 * 	- case 1 : 전체 회원 조회
	 * 	- case 2 : 회원 상세 조회
	 * 	- case 3 : 회원 정보 변경
	 * 	- case 8 : 관리자 메뉴 복귀
	 * 	- case 9 : 로그아웃
	 * 	- case 0 : 시스템 종료
	 * @throws AuthException 인증 예외
	 * @throws SQLException sql 예외
	 */ 
	public void memberInfoMenu() throws AuthException, SQLException {
		printTitle("회원 정보 관리");
		System.out.println("1. 전체 회원 조회");
		System.out.println("2. 회원 상세 조회");
		System.out.println("31. 이름 변경");
		System.out.println("32. 휴대폰 변경");
		System.out.println("33. 이메일 변경");
		System.out.println("34. 가입일 변경");
		System.out.println("35. 등급 변경");
		System.out.println("36. 마일리지 변경");
		System.out.println("37. 담당자 변경");
		System.out.println("40. 회원 정보 삭제");
		System.out.println("8. 관리자 메뉴 복귀");
		System.out.println("9. 로그아웃");
		System.out.println("0. 프로그램 종료");
		singleLine();
		System.out.print("메뉴번호 입력 => ");
		
		while(true) {
			int menuNo = Utility.inputNumber();
			switch(menuNo) {
			case 1:
				singleLine();
				ArrayList<Member> list = service.getMemberList();
				for(Member members: list) {
					System.out.println(members);
				}
				pause();
				memberInfoMenu();
				break;
			case 2:
				System.out.print("조회할 아이디 입력 => ");
				String id = Utility.inputString();
				singleLine();
				Member dto = service.getMember(id);
				if(dto != null) {
					System.out.println(dto);
				} else {
					System.out.println("조회 실패");
				}
				pause();
				memberInfoMenu();
				break;
			case 31:
				service.updateName();
				singleLine();
				memberInfoMenu();
				break ;
			case 32:	
				service.updateMobile();
				singleLine();
				memberInfoMenu();
				break ;
			case 33:
				service.updateEmail();
				singleLine();
				memberInfoMenu();
				break ;
			case 34:	
				service.updateEntryDate();
				singleLine();
				memberInfoMenu();
				break ;
			case 35:
				service.updateGrade();
				singleLine();
				memberInfoMenu();
				break ;
			case 36:
				service.updateMileage();
				singleLine();
				memberInfoMenu();
				break ;
			case 37:	
				service.updateManager();
				singleLine();
				memberInfoMenu();
				break ;
			case 40:	
				service.deleteMemberIdByAdmin();
				singleLine();
				memberInfoMenu();
				break ;
			case 8:
				adminMenu();
				break ;
			case 9:
				logoutMenu();
				break ;
			case 0:
				exitMenu();
				break;
			default:
				System.out.println("[입력오류] 상위메뉴로 돌아갑니다.");
				adminInfoMenu();
				break;
			}
		}
	}
	
	
	/**
	 * 1-2-3. 게시판 관리 화면 
	 * (진입경로 : 메인메뉴/ 로그인/ 관리자메뉴/ 게시판 관리) 
	 * 화면 구성
	 * 	- case 1 : 게시물 전체 조회
	 * 	- case 21 : 게시물 상세 검색 : 제목 + 내용
	 * 	- case 22 : 게시물 상세 검색 : 작성자
	 * 	- case 23 : 게시물 상세 검색 : 제목
	 * 	- case 24 : 게시물 상세 검색 : 내용
	 * 	- case 3 : 게시물 작성
	 * 	- case 7 : 게시물 삭제
	 * 	- case 77 : 게시물 전부 삭제
	 * 	- case 8 : 관리자 메뉴 복귀
	 * 	- case 9 : 로그아웃
	 * 	- case 0 : 시스템 종료
	 * 	- default : 오류
	 * @throws AuthException 인증 예외
	 * @throws SQLException sql 예외
	 */ 
	public void adminNoticeMenu() throws AuthException, SQLException {
		printTitle("게시판 관리 화면");
		String member_Id = service.selectIdByLogin();
		Member dto = service.getMember(member_Id);
	
		System.out.println("1. 게시물 전체 조회");
		System.out.println("21. 게시물 상세 검색 : 제목 + 내용");
		System.out.println("22. 게시물 상세 검색 : 작성자");
		System.out.println("23. 게시물 상세 검색 : 제목");
		System.out.println("24. 게시물 상세 검색 : 내용");
		System.out.println("3. 게시물 작성");
		System.out.println("7. 게시물 삭제");
		System.out.println("77. 게시물 삭제");
		System.out.println("8. 관리자 메뉴 복귀");
		System.out.println("9. 로그아웃");
		System.out.println("0. 종료");
		singleLine();
		System.out.print("메뉴번호 입력 => ");
		
		while(true) {
			int menuNo = Utility.inputNumber();
			switch(menuNo) {
			case 1:
				ArrayList<Notice> list = nService.getNoticeList();
				for(Notice notices: list) {
					System.out.println(notices);
				}
				pause();
				adminNoticeMenu();
				break;
			
			case 21:
				list = nService.searchNoticeTitleContents();
				for(Notice notices: list) {
					System.out.println(notices);
				}
				pause();
				adminNoticeMenu();
				break;
			case 22:
				list = nService.searchMemberId();
				for(Notice notices: list) {
					System.out.println(notices);
				}
				pause();
				adminNoticeMenu();
				break;
			case 23:
				list = nService.searchNoticeTitle();
				for(Notice notices: list) {
					System.out.println(notices);
				}
				pause();
				adminNoticeMenu();
				break;
			case 24:
				list = nService.searchNoticeContents();
				for(Notice notices: list) {
					System.out.println(notices);
				}
				pause();
				adminNoticeMenu();
				break;
			case 3:
				list = nService.createNoticeTitleContents(member_Id);
				pause();
				adminNoticeMenu();
				break;
			case 7:
				System.out.print("삭제할 게시물 아이디 : ");
				String memberId = Utility.inputString();
				
				System.out.println("삭제대상 작성 게시물 리스트");
				list = daoN.selectListByMemberId(member_Id);
				for(Notice notices: list) {
					System.out.println(notices);
				}
				singleLine();
				list = nService.deleteNoticeTitleContents(member_Id);
				pause();
				adminNoticeMenu();
				break;
			case 77:
				nService.deleteAllNoticeTitleContents();
				pause();
				adminNoticeMenu();
				break;
			case 8:
				adminMenu();
				break;
			case 9:
				logoutMenu();
				break ;
			case 0:
				exitMenu();
				break;
			default:
				System.out.println("[입력오류] 상위메뉴로 돌아갑니다.");
				adminNoticeMenu();
				break;
			}
		}
	}
	
	
	/**
	 * 2. 회원가입 메뉴 화면 
	 * @throws AuthException 인증 예외 
	 * @throws SQLException sql 구문 예외
	 */
	public void addMemberMenu() throws AuthException, SQLException {
		printTitle("회원 가입");
		System.out.print("아이디 : ");
		String memberId = Utility.inputString();
		
		System.out.print("비밀번호 : ");
		String memberPw = Utility.inputString();
		
		System.out.print("이름 : ");
		String name = Utility.inputString();
		
		System.out.print("휴대폰(***-****-**** 형식) : ");
		String mobile = Utility.inputString();
		
		System.out.print("이메일(****@***.com 형식) : ");
		String email = Utility.inputString();
		
		int result = service.addMember(memberId, memberPw, name, mobile, email);
		
		if (result > 0) {
		System.out.println("회원등록 성공 : " + memberId);
		mainMenu();
		} else {
		addMemberMenu();
		}
	} 
	
	
	/** 
	 * 3. 아이디찾기 메뉴 화면 
	 * 기능 구성
	 * - 가입시 작성한 이름, 이메일 입력 후 
	 * - true : 가입시 아이디 
	 * - false : 오류메세지 
	 * 
	 * 아이디 확인 후
	 * 	- case 1 : 비밀번호 찾기
	 * 	- case 2 : 로그인
	 * 	- case 9 : 메인메뉴
	 *  - case 0 : 시스템 종료
	 * @throws AuthException 인증 예외 
	 * @throws SQLException sql 예외
	 */ 
	public void findIdMenu() throws AuthException, SQLException {
		printTitle("아이디찾기 메뉴");
		System.out.println("가입시 작성한 정보를 입력해주세요.");
		singleLine();
		System.out.print("이름 : ");
		String name = Utility.inputString();
	
		System.out.print("이메일 : ");
		String email = Utility.inputString();
		
		singleLine();
		
		String findId = service.getMemberId(name, email);
		String findid = service.getMemberId("홍길동", "010-1234-1111");
		if(findId != null) {
			System.out.println("아이디찾기 성공 : " + findId);
		} else {
			System.out.println("아이디찾기 실패 : 회원정보를 확인하시기 바랍니다.");
		}
		
		singleLine();
		System.out.println("1. 비밀번호 찾기");
		System.out.println("2. 로그인");
		System.out.println("9. 메인메뉴");
		System.out.println("0. 프로그램 종료");
		singleLine();
		System.out.print("메뉴번호 입력 => ");
		
		while(true) {
			int menuNo = Utility.inputNumber();
			switch(menuNo) {
			case 1:
				findPwMenu();
				break ;
			case 2:
				loginMenu();
				break ;
			case 9:
				mainMenu();
				break ;	
			case 0:
				exitMenu();
				break;
			default:
				System.out.println("[입력오류] 상위메뉴로 돌아갑니다.");
				findIdMenu();
				break;
			}
		}
	}
	
	
	/** 4. 비밀번호찾기 메뉴 화면
	 * 
	 * 기능 구성
	 * - 가입시 작성한 아이디 이름, 이메일 입력
	 * - true : 비밀번호 변경 페이지 이동
	 * - false : 오류메세지 
	 * 
	 * 비밀번호 확인 후
	 * 	- case 1 : 로그인
	 * 	- case 9 : 메인메뉴
	 *  - case 0 : 시스템 종료
	 * @throws AuthException 인증 예외 
	 * @throws SQLException sql 예외

	 */   
	public void findPwMenu() throws AuthException, SQLException {
		printTitle("비밀번호찾기 메뉴");
		System.out.println("가입시 작성한 정보를 입력해주세요.");
		singleLine();
		System.out.print("아이디 : ");
		String memberId = Utility.inputString();
		
		System.out.print("이름 : ");
		String name = Utility.inputString();

		System.out.print("이메일 : ");
		String email = Utility.inputString();
		
		String findPw = service.changeMemberPw(memberId, name, email);
		
		singleLine();
		System.out.println("1. 로그인");
		System.out.println("9. 메인메뉴");
		System.out.println("0. 프로그램 종료");
		singleLine();
		System.out.print("메뉴번호 입력 => ");
		
		while(true) {
			int menuNo = Utility.inputNumber();
			switch(menuNo) {
			case 1:
				loginMenu();
				break ;
			case 9:
				mainMenu();
				break ;	
			case 0:
				exitMenu();
				break;
			default:
				System.out.println("[입력오류] 상위메뉴로 돌아갑니다.");
				findPwMenu();
				break;
			}
		}
	}
	
	
	/** 로그아웃 메뉴 
	 * @throws AuthException 인증 예외
	 * @throws SQLException sql 예외
	 */
	public void logoutMenu() throws AuthException, SQLException {
		service.updateLogout();
		System.out.println("메인메뉴로 복귀합니다.");
		mainMenu();
	}
	
	
	/** 프로그램 종료 메뉴 */
	public void exitMenu() {
		service.updateLogout();
		printTitle("회원관리 시스템 종료");
		System.exit(0);
	}
	
	
	/** 한줄 삽입 */
	public void singleLine() {
		System.out.println("-------------------------");
	}
	
	
	/** 두줄 삽입 */
	public void doubleLine() {
		System.out.println("=========================");
	}
	
	
	/**
	 * 타이틀 텍스트
	 * @param title 제목
	 */
	public void printTitle(String title) {
		System.out.println();
		doubleLine();
		System.out.println(title);
		doubleLine();
	}
	

	/**
	 * 화면 대기
	 */
	private void pause()  {
		singleLine();
		System.out.println("[메뉴복귀 : 1, 종료 : 0]");
		singleLine();
		System.out.print("메뉴번호 입력 => ");
		int menuNo = Utility.inputNumber();
		switch(menuNo) {
		case 1:
			break;
		case 0:
			exitMenu();
			break;
		default:
			System.out.println("메뉴번호 오류");
			break;
		}
	}
}
