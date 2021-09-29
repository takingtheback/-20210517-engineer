package com.work.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import com.work.exception.ParseException;

/**
 *  <pre>
 * -- 공통으로 사용하는 메서드 위한 유틸리티 클래스
 * -- 모든 메서드는 객체생성없이 사용가능하도록 Class Method 선언(Static method)
 * </pre>
 * @author 김재현
 * @version ver.1.01
 * @since jdk1.8
 */
public class Utility {

	
	/**
	 * <pre>
	 * 현재날짜 기본형식의 문자열로 변환하는 메서드
	 * -- 기본형식 : 년도4자리-월2자리-일2자리
	 * </pre>
	 * @return 현재날짜 기본형식 문자열
	 */
	public static String getCurrentDate() {
		return getCurrentDate("yyyy-MM-dd");
	}

	public static String getCurrentDate(String pattern) {
		return getCurrentDate(pattern,Locale.US);
	}
	
	public static String getCurrentDate(String pattern,Locale locale) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(pattern,locale);
		Date today = new Date(); 
		return dateFormat.format(today);
	}
	
//		
	/** 
	 * 문자열 입력 
	 * @return 키보드 입력 데이터를 문자열로 반환 
	 */
	public static String inputString() {
		String data = null;
		try {
			BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
			data = in.readLine();
		} catch(IOException e) {
			e.printStackTrace();
		}
		return data;
	}
	
	/** 
	 * 메뉴용 한자리 정수 입력 
	 * @return 키보드 입력 데이터를 int로 반환
	 */
	public static int inputNumber() {
		String data = null;
		try {
			BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
			data = in.readLine();
							
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		if(data.equals("0") || data.equals("1") || data.equals("2") || data.equals("3") || data.equals("4") || data.equals("5") || data.equals("6") || data.equals("7") || data.equals("8") || data.equals("9")) {
			return Integer.parseInt(data);
		}	else if(data.equals("")) {
				System.out.print("[빈공백 불가] : 번호를 다시 입력하세요>");
			return inputNumber();
		} else {
			System.out.print("번호를 다시 입력하세요>");
			return inputNumber();
		}
	}
	
	
	/**
	 * 메뉴용 두자리 이상 정수 입력시
	 * @return 두자리 이상 숫자입력 데이터 int 반환
	 */
	public static int inputLongNumber() {
		String data = null;
		try {
			BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
			data = in.readLine();
		} catch (IOException e) {
			e.printStackTrace();
		} if(data.equals("")) {
		System.out.print("[빈공백 불가] : 번호를 다시 입력하세요>");
		} 
			return Integer.parseInt(data);
		
	}
	
	/** 두줄 삽입 */
	public static void doubleLine() {
		System.out.println("=========================");
	}
	
	
	/** 한줄 삽입 */
	public static void singleLine() {
		System.out.println("-------------------------");
	}
	
	
	/**
	 * 타이틀 텍스트
	 * @param title 두줄 둘러친 제목 반환
	 */
	public static void printTitle(String title) {
		System.out.println();
		doubleLine();
		System.out.println(title);
		doubleLine();
	}
	
	/** 테스트시에 출력위한 메서드 
	 * @param message 메세지
	 */
	public static void print(String message) {
		System.out.println("\n### " + message);
	}
	
	/**
	 * 회비계산용 한달추가 메서드
	 * @param startDate 회비 시작일
	 * @param month 추가되는 개월수
	 * @return 회비 시작일부터 몇달이 유효한지 반환
	 * @throws Exception 일반적인 예외
	 */
	public static String addMonth(String startDate, int month) throws Exception { 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		Calendar calendar = Calendar.getInstance(); 
		Date date = dateFormat.parse(startDate); 
		calendar.add(Calendar.MONTH, month); 
		calendar.add(Calendar.DATE, -1);
		return dateFormat.format(calendar.getTime()); 
		}
}
