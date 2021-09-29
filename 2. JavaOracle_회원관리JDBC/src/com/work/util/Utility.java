package com.work.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

/**
 * <pre>
 * -- 공통으로 사용하는 메서드를 위한 유틸리티 클래스
 * </pre>
 * @author 김재현
 * @version ver2.0
 * @since jdk1.8
 */
public class Utility {
	/**
	 * 현재 날짜를 기본날짜형식 년도 4자리.월2자리.일2자리 형식의 문자열 변환 반환 메서드
	 * @return 기본 형식의 현자낼짜 문자열
	 */
	public static String getCurrentDate() {
		return getCurrentDate("yyyy-MM-dd");
	};

	
	/**
	 * 아규먼트로 전달받은 날짜 형식의 현재날짜 변환 반환 메서드 
	 * @param pattern 날짜형식
	 * @return 날짜형식의 현재날짜 문자열
	 */
	public static String getCurrentDate(String pattern) {
		return getCurrentDate(pattern, Locale.KOREA);
	}
	
	
	/**
	 * 아규먼트로 전달받은 날짜 형식, 로케일 형식의 현재날짜 변환 반환 메서드
	 * @param pattern 날짜형식  및 시간 형식
	 * @param locale 로케일형식
	 * @return 날짜 형식, 로케일 형식의 현재날짜 문자열
	 */
	public static String getCurrentDate(String pattern, Locale locale) {
		return new SimpleDateFormat(pattern, locale).format(new Date());
	}
	
	/**
	 * 보안문자 4자리 숫자 반환
	 * @return 4자리숫자 보안문자
	 */
	public static String getSecureNumberString() {
		return getSecureNumberString(6);
	}

	
	/**
	 * 보안문자 지정길이 숫자 반환
	 * @param length 보안문자 길이
	 * @return 지정길이숫자 보안문자
	 */
	public static String getSecureNumberString(int length) {
		Random random = new Random((long)(Math.random() * System.nanoTime()));
		StringBuilder secureString = new StringBuilder();
		
		for (int index = 0; index < length; index++) {
			secureString.append(random.nextInt(10));
		}
		return secureString.toString();
	}

	
	/**
	 * 문자열 입력 반환
	 * @return 입력 문자열
	 */
	public static String inputString() {
		String data = null;
		try {
			BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
			data = in.readLine();
		} catch (IOException e) {
			System.out.println("[오류] 입력오류");
			e.printStackTrace();
		}
		return data;
	}
	
	
	/**
	 * 숫자 입력 반환
	 * @return 입력 정수형 숫자
	 */
	public static int inputNumber() {
		String data = null;
		try {
			BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
			data = in.readLine();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try{
			return Integer.parseInt(data);
		} catch (NumberFormatException e) {
			
		}
		return -1;
	}
	
}










