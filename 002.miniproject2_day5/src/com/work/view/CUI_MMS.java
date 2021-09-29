package com.work.view;

import java.io.IOException;
import java.sql.SQLException;

import com.work.exception.AuthException;

/**
<pre>
* CUI MMS 콘솔기반 회원관리 시스템 구동 
*  -- show 링크 참조 : 피그마를 통한 작업 전개도 작성
*  브레인스토밍작업은 아래 링크에서 확인하실 수 있습니다.
* -- 피그마 https://www.figma.com/file/8mZnhKYhsFe8T9dI2owwQA/Untitled?node-id=0%3A1
* </pre>
* @author 김재현
* @version ver2.0
* @since jdk1.8
*/
public class CUI_MMS {

	public static void main(String[] args) throws AuthException, SQLException {
		/** CUIMenu 객체 생성 */
		CUIMenu menu = new CUIMenu();
		
		while(true) {
			menu.mainMenu();
		}

	}
}
