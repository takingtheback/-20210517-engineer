package com.work.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.work.view.CUIMenu;


/**
 * MemberDAO 구현
 * @author 김재현
 * @version ver2.0
 * @since jdk1.8
 */
public class MemberDao {
	/** FactoryDao 객체 멤버변수 선언 및 할당 */
	private FactoryDao factory = FactoryDao.getInstance();
	
	
	/** 싱글톤 멤버 인스턴스 선언 */
	private static MemberDao instance = new MemberDao();
	
	
	/** 기본 생성자 
	 * singleton pattern : 객체 생성
	 * 1. jdbc driver 로딩
	 */
	private MemberDao() {	 
	}
	
	
	/**
	 * 싱글톤 반환 메서드
	 * @return 멤버다오 반환
	 */
	public static MemberDao getInstance() {
		return instance;
	}
	
	
	/**
	 * 로그인 (PreparedStatement 이용)
	 * @param member_Id 아이디
	 * @param member_Pw 비밀번호
	 * @return 성공 : 회원 등급, 실패 : null
	 */
	public String loginGrade(String member_Id, String member_Pw) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = factory.getConnection();
			String sql = "select Grade from member where member_ID = ? and member_pw = ? ";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, member_Id);
			stmt.setString(2, member_Pw);
			rs = stmt.executeQuery();
			if(rs.next()) {
				String grade = rs.getString("grade");
				return grade;
			}
			
		} catch (SQLException e) {
			System.out.println("[오류] 로그인");
			e.printStackTrace();
		} finally {
			factory.close(conn, stmt, rs);
		}
		return null;
	}
	
	
	/**
	 * 로그인: (PreparedStatement 이용)
	 * @param member_Id 아이디
	 * @param member_Pw 비밀번호
	 * @return 성공 : 아이디 반환, 실패 : null
	 */
	public String loginId(String member_Id, String member_Pw) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = factory.getConnection();
			String sql = "select member_id\r\n"
					+ "from member\r\n"
					+ "where member_id = ? \r\n"
					+ "and member_pw = ? ";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, member_Id);
			stmt.setString(2, member_Pw);
			rs = stmt.executeQuery();
			if(rs.next()) {
				String memberId = rs.getString("member_Id");
				return memberId;
			}
			
		} catch (SQLException e) {
			System.out.println("[오류] 로그인");
			e.printStackTrace();
		} finally {
			factory.close(conn, stmt, rs);
		}
		return null;
	}
	
	
	/**
	 * 내정보조회 / 회원상세조회
	 * @param memberId 아이디
	 * @return 회원 정보
	 */
	public Member selectOne(String memberId) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = factory.getConnection();
			
			String sql = "select * from member where member_ID = ?";
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, memberId);
			
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				String memberPw = rs.getString("member_pw");
				String name = rs.getString("name");
				String mobile = rs.getString("mobile");
				String email = rs.getString("email");
				String entryDate = rs.getString("entry_date");
				String grade = rs.getString("grade");
				int mileage = rs.getInt("mileage");
				String manager = rs.getString("manager");
				int login = rs.getInt("login");
				
				Member dto = new Member(memberId, memberPw, name, mobile, email, entryDate, grade, mileage, manager, login);
				return dto;  // 생성한 Member객체 반환
			}
			
		} catch (SQLException e) {
			System.out.println("[오류] 회원상세조회");
			e.printStackTrace();
		} finally {
			factory.close(conn, stmt, rs);
		}
		
		return null;
	}


	/**
	 * 회원 전체 조회
	 * @return 회원 전체 조회
	 */
	public ArrayList<Member> selectList() {
		ArrayList<Member> list = new ArrayList<Member>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = factory.getConnection();
			
			String sql = "select * from member";
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				String member_Id = rs.getString("member_Id");
				String member_Pw = rs.getString("member_Pw");
				String name = rs.getString("name");
				String mobile = rs.getString("mobile");
				String email = rs.getString("email");
				String entry_Date = rs.getString("entry_Date");
				String grade = rs.getString("grade");
				int mileage = rs.getInt("mileage");
				String manager = rs.getString("manager");
				int login = rs.getInt("login");
				
				Member dto = new Member(member_Id, member_Pw, name, mobile, email, entry_Date, grade, mileage, manager, login);
				list.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("[오류] 회원전체조회");
			e.printStackTrace();
		} finally {
			factory.close(conn, stmt, rs);
		}
		return list;
	}


	/**
	 * 회원 등급별 조회
	 * @param grade 등급
	 * @return 회원정보
	 */
	public ArrayList<Member> selectListByGrade(String grade) {
		ArrayList<Member> list = new ArrayList<Member>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
	
		try {
			conn = factory.getConnection();
			
			String sql = "select * from member where grade = ?";
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, grade);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				String member_Id = rs.getString("member_Id");
				String member_Pw = rs.getString("member_Pw");
				String name = rs.getString("name");
				String mobile = rs.getString("mobile");
				String email = rs.getString("email");
				String entry_Date = rs.getString("entry_Date");
				int mileage = rs.getInt("mileage");
				String manager = rs.getString("manager");
				int login = rs.getInt("login");
				
				Member dto = new Member(member_Id, member_Pw, name, mobile, email, entry_Date, grade, mileage, manager, login);
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("[오류] 회원등급별조회");
			e.printStackTrace();
		} finally {
			factory.close(conn, stmt, rs);
		}
		return list;
	}

	
	/**
	 * ## 아이디찾기1
	 * @param name 이름
	 * @param mobile 휴대폰
	 * @return 성공시 아이디 반환
	 */
	public String findId1(String name, String mobile) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
		
			conn = factory.getConnection();

			String sql = "select member_id\r\n"
					+ "from member\r\n"
					+ "where name = ? \r\n"
					+ "and mobile = ? ";
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, name);
			stmt.setString(2, mobile);
			
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				String member_Id = rs.getString("member_Id");
				return member_Id;
			}
			
		} catch (SQLException e) {
			System.out.println("[오류] 아이디찾기");
			e.printStackTrace();
		} finally {
			factory.close(conn, stmt, rs);
		}
		return null;
	}


	/**
	 * ## 아이디찾기2
	 * @param name 이름
	 * @param email 이메일
	 * @return 성공시 아이디 반환
	 */
	public String findId2(String name, String email) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
		
			conn = factory.getConnection();

			String sql = "select member_id\r\n"
					+ "from member\r\n"
					+ "where name = ? \r\n"
					+ "and email = ? ";
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, name);
			stmt.setString(2, email);
			
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				String member_Id = rs.getString("member_Id");
				return member_Id;
			}
			
		} catch (SQLException e) {
			System.out.println("[오류] 아이디찾기");
			e.printStackTrace();
		} finally {
			factory.close(conn, stmt, rs);
		}
		return null;
	}


	/**
	 * ## 비밀번호찾기
	 * @param name 이름
	 * @param mobile 휴대폰
	 * @param email 이메일
	 * @return 성공시 비밀번호 (추후 비밀번호 변경 페이지로)
	 */
	public String findPw(String name, String mobile, String email) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
		
			conn = factory.getConnection();

			String sql = "select member_pw\r\n"
					+ "from member\r\n"
					+ "where name = ? \r\n"
					+ "and mobile = ? \r\n"
					+ "and email = ? ";
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, name);
			stmt.setString(2, mobile);
			stmt.setString(3, email);
			
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				String member_Pw = rs.getString("member_Pw");
				return member_Pw;
			}
			
		} catch (SQLException e) {
			System.out.println("[오류] 비밀번호찾기");
			e.printStackTrace();
		} finally {
			factory.close(conn, stmt, rs);
		}
		return null;
	}

	
	/**
	 * ## 중복된 아이디 체크
	 * @param member_Id 아이디
	 * @return true : 아이디 중복, false : 가능
	 */
	public boolean selectMemberId(String member_Id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
		
			conn = factory.getConnection();

			String sql = "select member_id\r\n"
					+ "from member\r\n"
					+ "where member_id = ? ";
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, member_Id);
			
			rs = stmt.executeQuery();
			
			return rs.next();
			
		} catch (SQLException e) {
			System.out.println("[오류] 아이디 중복조회");
			e.printStackTrace();
		} finally {
			factory.close(conn, stmt, rs);
		}
		return false;
	}


	/**
	 * ## 중복된 이메일 체크
	 * @param email 이메일
	 * @return true : 이메일 중복, false : 가능
	 */
	public boolean selectEmail(String email) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
		
			conn = factory.getConnection();

			String sql = "select email\r\n"
					+ "from member\r\n"
					+ "where email = ? ";
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, email);
			
			rs = stmt.executeQuery();
			
			return rs.next();
		} catch (SQLException e) {
			System.out.println("[오류] 이메일 중복조회");
			e.printStackTrace();
		} finally {
			factory.close(conn, stmt, rs);
		}
		return false;
	}

	
	/**
	 * 회원 등업대상 조회
	 * 마일리지 특정수치 넘는 사람 조회
	 * @param number 마일리지 값
	 * @return 등업대상 회원 
	 */
	public ArrayList<Member> selectListByMileage(int number) {
		ArrayList<Member> list = new ArrayList<Member>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = factory.getConnection();
			
			String sql = "select *\r\n"
					+ "from member\r\n"
					+ "where mileage > ? ";
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, number);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				String member_Id = rs.getString("member_Id");
				String member_Pw = rs.getString("member_Pw");
				String name = rs.getString("name");
				String mobile = rs.getString("mobile");
				String email = rs.getString("email");
				String entry_Date = rs.getString("entry_Date");
				String grade = rs.getString("grade");
				int mileage = rs.getInt("mileage");
				String manager = rs.getString("manager");
				int login = rs.getInt("login");
				
				Member dto = new Member(member_Id, member_Pw, name, mobile, email, entry_Date, grade, mileage, manager, login);
				list.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("[오류] 회원마일리지조회");
			e.printStackTrace();
		} finally {
			factory.close(conn, stmt, rs);
		}
		return list;
	}


		/**
		 * ## 비밀번호찾기 1단계 : 해당회원 존재유무 채크
		 * @param member_Id 아이디
		 * @param name 이름
		 * @param email 이메일
		 * @return 성공시 임시발급암호, 정보불일치 null
		 */
	 public boolean findMemberPwByEmail(String member_Id, String name, String email) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		 try {
				
				conn = factory.getConnection();

				String sql = "select member_pw\r\n"
					+ "	from member\r\n"
					+ "	where member_id = ?\r\n"
					+ "	and name = ?\r\n"
					+ "	and email = ? ";
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, member_Id);
				stmt.setString(2, name);
				stmt.setString(3, email);
				
				rs = stmt.executeQuery();
				
				if(rs.next()) {
					return true;
				}
				
				rs.close();
				stmt.close();
				conn.close();
				
			} catch (SQLException e) {
				System.out.println("[오류] 비밀번호찾기 검증");
				e.printStackTrace();
			} finally {
				factory.close(conn, stmt, rs);
			}
		 return false;
	 }

	 
	/**
	 * 비밀번호 변경
	 * @param member_Id 아이디
	 * @param memberModifiedPw 변경될 비밀번호
	 * @return 변경된 비밀번호 반환
	 */
	public boolean updateMemberPw(String member_Id,String memberModifiedPw) {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
				conn = factory.getConnection();
				conn.setAutoCommit(false);
				String sql = "update member\r\n"
						+ "set member_pw = ? \r\n"
						+ "where member_id = ? ";
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, memberModifiedPw);
				stmt.setString(2, member_Id);
				
				int rows = stmt.executeUpdate();
				if(rows > 0) {
					conn.commit();
					return true;
				} 
				
			} catch (SQLException e) {
				
				System.out.println("[오류] 비밀번호 변경");
				e.printStackTrace();
			} finally {
				factory.close(conn, stmt);
			}
		return false;
	}

	
	/**
	 * 이름 변경(내정보 변경)
	 * @param member_Id 아이디
	 * @param memberModifiedName 변경될 이름
	 * @return 변경될 이름
	 */
	public boolean updateMemberName(String member_Id,String memberModifiedName) {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
				
				conn = factory.getConnection();
				conn.setAutoCommit(false);
				String sql = "update member\r\n"
						+ "set name = ? \r\n"
						+ "where member_id = ? ";
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, memberModifiedName);
				stmt.setString(2, member_Id);
				
				int rows = stmt.executeUpdate();
				if(rows > 0) {
					conn.commit();
					return true;
				}
				
			} catch (SQLException e) {
				
				System.out.println("[오류] 이름 변경");
				e.printStackTrace();
			} finally {
				factory.close(conn, stmt);
			}
		return false;
	}
	
	
	/**
	 * 휴대폰 변경(내정보 변경)
	 * @param member_Id 아이디
	 * @param memberModifiedMobile 변경될 휴대폰
	 * @return 변경될 휴대폰
	 */
	public boolean updateMemberMobile(String member_Id,String memberModifiedMobile) {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
				
				conn = factory.getConnection();
				conn.setAutoCommit(false);
				String sql = "update member\r\n"
						+ "set mobile = ? \r\n"
						+ "where member_id = ? ";
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, memberModifiedMobile);
				stmt.setString(2, member_Id);
				
				int rows = stmt.executeUpdate();
				if(rows > 0) {
					conn.commit();
					return true;
				}
				
			} catch (SQLException e) {
				
				System.out.println("[오류] 휴대폰 변경");
				e.printStackTrace();
			} finally {
				
				factory.close(conn, stmt);
			}
		return false;
	}
	
	
	/**
	 * 이메일 변경(내정보 변경)
	 * @param member_Id 아이디
	 * @param memberModifiedEmail 변경될 이메일
	 * @return 변경될 이메일
	 */
	public boolean updateMemberEmail(String member_Id,String memberModifiedEmail) {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
				
				conn = factory.getConnection();
				conn.setAutoCommit(false);
				String sql = "update member\r\n"
						+ "set Email = ? \r\n"
						+ "where member_id = ? ";
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, memberModifiedEmail);
				stmt.setString(2, member_Id);
				
				int rows = stmt.executeUpdate();
				if(rows > 0) {
					conn.commit();
					return true;
				}
				
			} catch (SQLException e) {
				
				System.out.println("[오류] 이메일 변경");
				e.printStackTrace();
			} finally {
				
				factory.close(conn, stmt);
			}
		return false;
	}
	
	
	/**
	 * 가입일 변경(관리자정보 변경)
	 * @param member_Id 아이디
	 * @param memberModifiedEntryDate 변경될 가입일
	 * @return 변경될 가입일
	 */
	public boolean updateMemberEntryDate(String member_Id,String memberModifiedEntryDate) {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
				
				conn = factory.getConnection();
				conn.setAutoCommit(false);
				String sql = "update member\r\n"
						+ "set entry_date = ? \r\n"
						+ "where member_id = ? ";
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, memberModifiedEntryDate);
				stmt.setString(2, member_Id);
				
				int rows = stmt.executeUpdate();
				if(rows > 0) {
					conn.commit();
					return true;
				}
				
			} catch (SQLException e) {
				
				System.out.println("[오류] 가입일 변경");
				e.printStackTrace();
			} finally {
				
				factory.close(conn, stmt);
			}
		return false;
	}
	
	
	/**
	 * 등급 변경(관리자정보 변경)
	 * @param member_Id 아이디
	 * @param memberModifiedGrade 변경될 등급
	 * @return 변경될 등급
	 */
	public boolean updateMemberGrade(String member_Id,String memberModifiedGrade) {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
				
				conn = factory.getConnection();
				conn.setAutoCommit(false);
				String sql = "update member\r\n"
						+ "set grade = ? \r\n"
						+ "where member_id = ? ";
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, memberModifiedGrade);
				stmt.setString(2, member_Id);
				
				int rows = stmt.executeUpdate();
				if(rows > 0) {
					conn.commit();
					return true;
				}
				
			} catch (SQLException e) {
				
				System.out.println("[오류] 등급 변경");
				e.printStackTrace();
			} finally {
				
				factory.close(conn, stmt);
			}
		return false;
	}
	
	
	/**
	 * 마일리지 변경(관리자정보 변경)
	 * @param member_Id 아이디
	 * @param memberModifiedMileage 변경될 마일리지
	 * @return 변경될 마일리지
	 */
	public boolean updateMemberMileage(String member_Id,int memberModifiedMileage) {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
				
				conn = factory.getConnection();
				conn.setAutoCommit(false);
				String sql = "update member\r\n"
						+ "set mileage = ? \r\n"
						+ "where member_id = ? ";
				stmt = conn.prepareStatement(sql);
				
				stmt.setInt(1, memberModifiedMileage);
				stmt.setString(2, member_Id);
				
				int rows = stmt.executeUpdate();
				if(rows > 0) {
					conn.commit();
					return true;
				}
				
			} catch (SQLException e) {
				
				System.out.println("[오류] 등급 변경");
				e.printStackTrace();
			} finally {
				
				factory.close(conn, stmt);
			}
		return false;
	}
	
	
	/**
	 * 담당자 변경(관리자정보 변경)
	 * @param member_Id 아이디
	 * @param memberModifiedManager 변경될 담당자
	 * @return 변경될 담당자
	 */
	public boolean updateMemberManager(String member_Id,String memberModifiedManager) {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
				
				conn = factory.getConnection();
				conn.setAutoCommit(false);
				String sql = "update member\r\n"
						+ "set manager = ? \r\n"
						+ "where member_id = ? ";
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, memberModifiedManager);
				stmt.setString(2, member_Id);
				
				int rows = stmt.executeUpdate();
				if(rows > 0) {
					conn.commit();
					return true;
				}
				
			} catch (SQLException e) {
				
				System.out.println("[오류] 등급 변경");
				e.printStackTrace();
			} finally {
				
				factory.close(conn, stmt);
			}
		return false;
	}
	
	
	/**
	 * 회원가입
	 * @param dto 회원가입시 입력받는 데이터
	 * @return 회원가입 성공 0 실패 1
	 */
	public int insertMember(Member dto) {
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = factory.getConnection();
			conn.setAutoCommit(false);	
			String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, dto.getmember_Id());
			stmt.setString(2, dto.getmember_Pw());
			stmt.setString(3, dto.getName());
			stmt.setString(4, dto.getMobile());
			stmt.setString(5, dto.getEmail());
			stmt.setString(6, dto.getentry_Date());
			stmt.setString(7, dto.getGrade());
			stmt.setInt(8, dto.getMileage());
			stmt.setString(9, dto.getManager());
			stmt.setInt(10, dto.getLogin());
			
			conn.commit();
			return stmt.executeUpdate();
			
		} catch (SQLException e) {
			
			System.out.println("[오류] 회원가입");
			e.printStackTrace();
			
		} finally {
			factory.close(conn, stmt);
		}
		
		System.out.println("회원가입 완료");
		return 0;
	}
	
	
	/**
	 * 회원 탈퇴
	 * @param member_Id 아이디
	 * @return 성공 : 회원 탈퇴 실패 : false
	 */
	public boolean deleteMemberId(String member_Id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
				conn = factory.getConnection();
				conn.setAutoCommit(false);
				String sql = "DELETE MEMBER \r\n"
						+ "WHERE MEMBER_ID = ? ";
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, member_Id);
				
				int rows = stmt.executeUpdate();
				if(rows > 0) {
					conn.commit();
					return true;
				}
				
			} catch (SQLException e) {
				
				System.out.println("[오류] 회원 탈퇴");
				e.printStackTrace();
			} finally {
				factory.close(conn, stmt);
			}
		return false;
	}

	
	/**
	 * 로그인 상태 전환
	 * @param member_Id 아이디
	 * @return 로그인상태 TRUE , 로그아웃상태 FALSE
	 */
	public boolean updateLogin(String member_Id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
				conn = factory.getConnection();
				conn.setAutoCommit(false);
				String sql = "update member\r\n"
						+ "set login = '1'\r\n"
						+ "where member_id = ? ";
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, member_Id);
				conn.commit();
				int rows = stmt.executeUpdate();
				if(rows > 0) {
					conn.commit();
					return true;
					
				}
				
			} catch (SQLException e) {
				
				System.out.println("[오류] 로그인");
				e.printStackTrace();
			} finally {
				
				factory.close(conn, stmt);
			}
		return false;
	}


	/**
	 * 로그아웃 상태 전환
	 * @return true : 비로그인상태, false : 로그인상태
	 */
	public boolean updateLogout() {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
				conn = factory.getConnection();
				conn.setAutoCommit(false);
				String sql = "update member\r\n"
						+ "set login = '0'\r\n"
						+ "where login = '1' ";
				stmt = conn.prepareStatement(sql);
				
				int rows = stmt.executeUpdate();
				
				if(rows > 0) {
					conn.commit();
					return true;
				}
				
			} catch (SQLException e) {
				
				System.out.println("[오류] 로그아웃");
				e.printStackTrace();
			} finally {
				factory.close(conn, stmt);
			}
		return false;
	}
	
	
	/**
	 * 로그인 상태 아이디 검색
	 * login 1 인 아이디 검색 후 아이디 반환
	 * @return 아이디
	 */
	public String selectMemberIdByLogin() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = factory.getConnection();
			String sql = "select member_Id\r\n"
					+ "from member\r\n"
					+ "where login = 1 ";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()) {
				String member_Id = rs.getString("member_Id");
				return member_Id;
			}
		} catch (SQLException e) {
			System.out.println("[오류] 로그인");
			e.printStackTrace();
		} finally {
			factory.close(conn, stmt, rs);
		}
		return null;
	}

}
