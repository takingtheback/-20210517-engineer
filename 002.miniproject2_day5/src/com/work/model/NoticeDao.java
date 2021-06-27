package com.work.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * NoticeDAO 구현
 * @author 김재현
 * @version ver2.0
 * @since jdk1.8
 */
public class NoticeDao {
	/** FactoryDao 객체 멤버변수 선언 및 할당 */
	private FactoryDao factory = FactoryDao.getInstance();
	
	
	/** 싱글톤 멤버 인스턴스 선언 */
	private static NoticeDao instance = new NoticeDao();
	
	
	/** 기본 생성자 
	 * singleton pattern : 객체 생성
	 * 1. jdbc driver 로딩
	 */
	private NoticeDao() {	 
	}
	
	
	/**
	 * 싱글톤 반환 메서드
	 * @return 싱글톤 반환
	 */
	public static NoticeDao getInstance() {
		return instance;
	}
	

	/**
	 * 게시판 전체 조회
	 * @return 게시판 전체 조회
	 */
	public ArrayList<Notice> selectList() {
		ArrayList<Notice> list = new ArrayList<Notice>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = factory.getConnection();
			
			String sql = "select * from notice";
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				int noticeNo = rs.getInt("notice_no");
				String noticeTitle = rs.getString("notice_title");
				String noticeContents = rs.getString("notice_contents");
				String member_Id = rs.getString("member_Id");
				String noticeCreationDate = rs.getString("notice_creationdate");
				int noticeViews = rs.getInt("notice_views");
				
				Notice dto = new Notice(noticeNo, noticeTitle, noticeContents, member_Id, noticeCreationDate, noticeViews);
				list.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("[오류] 게시판 전체조회");
			e.printStackTrace();
		} finally {
			factory.close(conn, stmt, rs);
		}
		return list;
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

			String sql = "select *\r\n"
					+ "from notice\r\n"
					+ "where member_id like( ? )\r\n"
					+ "or lower(notice.member_id) like lower( ? )\r\n" ;
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
	 * 게시판 제목+내용 으로 검색
	 * @param word 검색할 단어
	 * @return 검색 관련 게시물
	 */
	public ArrayList<Notice> selectListByNoticeTitleContents(String word) {
		ArrayList<Notice> list = new ArrayList<Notice>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = factory.getConnection();
			
			String sql = "select *\r\n"
					+ "from notice\r\n"
					+ "where notice_contents like( ? )\r\n"
					+ "or lower(notice.notice_contents) like lower( ? )\r\n"
					+ "or notice_title like( ? )\r\n"
					+ "or lower(notice.notice_title) like lower( ? )";
			
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, word);
			stmt.setString(2, word);
			stmt.setString(3, word);
			stmt.setString(4, word);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				int noticeNo = rs.getInt("notice_no");
				String noticeTitle = rs.getString("notice_title");
				String noticeContents = rs.getString("notice_contents");
				String member_Id = rs.getString("member_Id");
				String noticeCreationDate = rs.getString("notice_creationdate");
				int noticeViews = rs.getInt("notice_views");
				
				Notice dto = new Notice(noticeNo, noticeTitle, noticeContents, member_Id, noticeCreationDate, noticeViews);
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			System.out.println("[오류] 게시판 작성자로 검색");
			e.printStackTrace();
		} finally {
			factory.close(conn, stmt, rs);
		}
		return list;
	}	
	
	
	/**
	 * 게시판 작성자로 검색
	 * @param member_Id 검색할 아이디
	 * @return 검색 관련 게시물 
	 */
	public ArrayList<Notice> selectListByMemberId(String member_Id) {
		ArrayList<Notice> list = new ArrayList<Notice>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = factory.getConnection();
			
			String sql = "select *\r\n"
					+ "from notice\r\n"
					+ "where member_id like( ? )\r\n"
					+ "or lower(notice.member_id) like lower( ? )";
			
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, member_Id);
			stmt.setString(2, member_Id);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				int noticeNo = rs.getInt("notice_no");
				String noticeTitle = rs.getString("notice_title");
				String noticeContents = rs.getString("notice_contents");
				member_Id = rs.getString("member_Id");
				String noticeCreationDate = rs.getString("notice_creationdate");
				int noticeViews = rs.getInt("notice_views");
				
				Notice dto = new Notice(noticeNo, noticeTitle, noticeContents, member_Id, noticeCreationDate, noticeViews);
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			System.out.println("[오류] 게시판 작성자로 검색");
			e.printStackTrace();
		} finally {
			factory.close(conn, stmt, rs);
		}
		return list;
	}
	
	
	/**
	 * 게시판 제목으로 검색
	 * @param noticeTitle 게시물 제목
	 * @return 검색관련 게시물 
	 */
	public ArrayList<Notice> selectListByNoticeTitle(String noticeTitle) {
		ArrayList<Notice> list = new ArrayList<Notice>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = factory.getConnection();
			
			String sql = "select *\r\n"
					+ "from notice\r\n"
					+ "where notice_title like( ? )\r\n"
					+ "or lower(notice.notice_title) like lower( ? )" ;
			
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, noticeTitle);
			stmt.setString(2, noticeTitle);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				int noticeNo = rs.getInt("notice_no");
				noticeTitle = rs.getString("notice_title");
				String noticeContents = rs.getString("notice_contents");
				String member_Id = rs.getString("member_Id");
				String noticeCreationDate = rs.getString("notice_creationdate");
				int noticeViews = rs.getInt("notice_views");
				
				Notice dto = new Notice(noticeNo, noticeTitle, noticeContents, member_Id, noticeCreationDate, noticeViews);
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			System.out.println("[오류] 게시판 타이틀로 검색");
			e.printStackTrace();
		} finally {
			factory.close(conn, stmt, rs);
		}
		return list;
	}
	
	
	/**
	 * 게시판 내용으로 검색
	 * @param noticeContents 게시물 내용
	 * @return 검색 관련 게시물 
	 */
	public ArrayList<Notice> selectListByNoticeContents(String noticeContents) {
		ArrayList<Notice> list = new ArrayList<Notice>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = factory.getConnection();
			
			String sql = "select *\r\n"
					+ "from notice\r\n"
					+ "where notice_contents like( ? )\r\n"
					+ "or lower(notice.notice_contents) like lower( ? )" ;
			
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, noticeContents);
			stmt.setString(2, noticeContents);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				int noticeNo = rs.getInt("notice_no");
				String noticeTitle = rs.getString("notice_title");
				noticeContents = rs.getString("notice_contents");
				String member_Id = rs.getString("member_Id");
				String noticeCreationDate = rs.getString("notice_creationdate");
				int noticeViews = rs.getInt("notice_views");
				
				Notice dto = new Notice(noticeNo, noticeTitle, noticeContents, member_Id, noticeCreationDate, noticeViews);
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			System.out.println("[오류] 게시판 타이틀로 검색");
			e.printStackTrace();
		} finally {
			factory.close(conn, stmt, rs);
		}
		return list;
	}
	
	
	
	/**
	 * 게시물 작성
	 * @param noticeTitle 게시물 제목
	 * @param noticeContents 게시물 내용
	 * @param member_Id 작성자 아이디
	 * @return 생성된 게시물
	 */
	public ArrayList<Notice> createNoticeTitleContents(String noticeTitle, String noticeContents, String member_Id) {
		ArrayList<Notice> list = new ArrayList<Notice>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = factory.getConnection();
			conn.setAutoCommit(false);	
			String sql = "INSERT INTO NOTICE\r\n"
					+ "VALUES(SEQ_NOTICE.NEXTVAL, ?, ?, ?, TO_CHAR(SYSDATE,'YYYY-MM-DD'), 0) " ;
			
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, noticeTitle);
			stmt.setString(2, noticeContents);
			stmt.setString(3, member_Id);
			
			conn.commit();
			stmt.executeUpdate();
			System.out.println("게시물 생성 완료");
		} catch (SQLException e) {
			System.out.println("[오류] 게시물 생성");
			e.printStackTrace();
		} finally {
			factory.close(conn, stmt);
		}
		return list;
	}
	
	
	/**
	 * 사용자 게시물 삭제
	 * 1단계 : 본인 게시물 확인
	 * 2단계 : 삭제할 게시물 번호 입력
	 * 		삭제할 게시물 있는지 확인
	 * 3단계 : 삭제여부 확인
	 * @param member_Id 아이디
	 * @param noticeNo 게시물 번호
	 * @return 게시물 삭제
	 */
	public ArrayList<Notice> deleteNoticeContents(String member_Id, int noticeNo) {
		ArrayList<Notice> list = new ArrayList<Notice>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = factory.getConnection();
			conn.setAutoCommit(false);	
			String sql = "delete notice\r\n"
					+ "where member_id = ? \r\n"
					+ "and notice_no = ? " ;
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, member_Id);
			stmt.setInt(2, noticeNo);
			
			stmt.executeUpdate();
			conn.commit();
			System.out.println("게시물 삭제 완료");
		} catch (SQLException e) {
			System.out.println("[오류] 게시물 삭제");
			e.printStackTrace();
		} finally {
			factory.close(conn, stmt);
		}
		return list;
	}
	
	
	/**
	 * 삭제할 게시물 체크
	 * @param noticeNo 게시물 번호
	 * @param member_Id 아이디
	 * @return true : 게시물 존재, false : 없음
	 */
	public boolean selectNoticeNo(String member_Id, int noticeNo) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
		
			conn = factory.getConnection();

			String sql = "select *\r\n"
					+ "from notice\r\n"
					+ "where notice_no = ? \r\n"
					+ "and member_Id = ? " ;
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, noticeNo);
			stmt.setString(2, member_Id);
			
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
	 * 사용자 게시물 전부삭제
	 * @return 게시물 전부삭제
	 */
	public ArrayList<Notice> deleteAllNoticeContents() {
		ArrayList<Notice> list = new ArrayList<Notice>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = factory.getConnection();
			conn.setAutoCommit(false);	
			String sql = "delete notice" ;
			stmt = conn.prepareStatement(sql);
			
			stmt.executeUpdate();
			conn.commit();
			System.out.println("게시물 전부 삭제 완료");
		} catch (SQLException e) {
			System.out.println("[오류] 게시물 삭제");
			e.printStackTrace();
		} finally {
			factory.close(conn, stmt);
		}
		return list;
	}
}
