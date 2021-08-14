package com.side_on.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class Utility {
	/**
	 * 패턴에 맞는 지역 현재 시간
	 * @param pattern
	 * @param locale
	 * @return yyyy-MM-dd kor
	 */
	public static String getCurrentDate(String pattern, Locale locale) {
		return new SimpleDateFormat(pattern, locale).format(new Date());
	}
	
	public static String getCurrentDate(String pattern) {
		return getCurrentDate(pattern, Locale.KOREA);
	}
	
	public static String getCurrentDate() {
		return getCurrentDate("yyyy-MM-dd");
	}
}
