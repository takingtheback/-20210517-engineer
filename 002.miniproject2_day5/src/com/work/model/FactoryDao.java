package com.work.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 모든 DAO 클래스에서 사용하기 위한 
 * -- Connection 반환,
 * -- close() 자원해제를 담당하는 기능으로만 분리설계
 * 
 * -- 모든 DAO 클래스에서 getConnection(), close(conn,stmt,rs) : 호출 사용
 * 
 * -- Singleton pattern 구현
 * 1. private 생성자
 * 2. private static 클래스이름 instance = new 클래스이름();
 * 3. public static 클래스이름 getInstance() {
		return instance; 
	  }
 * @author 김재현
 * @version ver2.0
 * @since jdk1.8
 */
public class FactoryDao {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:XE";
	private String user = "scott";
	private String password = "tiger";
	private static FactoryDao instance = new FactoryDao();
	
	private FactoryDao() {
		try {
			Class.forName(driver);
			System.out.println("[성공] 드라이버 로딩 ");
		} catch (ClassNotFoundException e) {
			System.out.println("[오류] 드라이버 로딩 오류");
			e.printStackTrace();
		}
	}
	
	
	 
	/**
	 * 싱글톤 반환 메서드
	 * @return 팩토리 다오 반환
	 */
	public static FactoryDao getInstance() {
		return instance;
	}

	
	/**
	 * ## DB 연결 Connection 반환 메서드 
	 * @return Connection 
	 */
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		
		return conn;
	}
	
	
	/**
	 * 자원해제 : SELECT 수행에 대한 자원
	 * @param conn Connection
	 * @param stmt Statement
	 * @param rs ResultSet
	 */
	public void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if(rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			System.out.println("[오류] rs close");
			e.printStackTrace();
		}
        try {
        	if(stmt != null) {
        		stmt.close();
        	}
    	} catch (SQLException e) {
    		System.out.println("[오류] stmt close");
    		e.printStackTrace();
    	}
        try {
        	if(conn != null) {
        		conn.close();
        	}
    	} catch (SQLException e) {
    		System.out.println("[오류] conn close");
    		e.printStackTrace();
    	}
	}
	
	public void close(Connection conn, Statement stmt) {
		close(conn, stmt, null);
	}
	
	
	
	
	
	
	
}
