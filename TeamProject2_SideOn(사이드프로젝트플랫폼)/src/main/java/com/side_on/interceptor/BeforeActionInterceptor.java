package com.side_on.interceptor;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.side_on.dto.Member;

import lombok.extern.slf4j.Slf4j;

/* 
 * -- 다중의 HandlerInterceptor 이어서 bean-name 설정
 * -- 로그인 인증 체킹, 권한 부여 체킹, 로그아웃 여벼 체킹 인터셉터에서 사용하기위한 인증 및 권한 정보 설정 처리 인터셉터
 * -- 로그인 여부
 * -- 관리자 여부
 * */
@Component("beforeActionInterceptor") // Qualifier 다중 인스턴스인 경우에 지정사용
@Slf4j
public class BeforeActionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.debug("### beforeActionInterceptor");
		
		// 세션객체 가져오기
		HttpSession session = request.getSession();
		
		// 세션객체에 설정된 세션정보 가져오기 : 로그인 요청시에 설정해놓은 세션정보를 기반으로 코드 구현
		String memberId = (String)session.getAttribute("memberId");
		String grade = (String)session.getAttribute("grade");
		Member dto = (Member)session.getAttribute("dto");
		
		boolean isLogin = false;
		boolean isAdmin = false;
		
		// 로그인 인증여부 체킹 : isLogin 설정
		if (memberId != null || (dto != null && dto.getMemberId() != null)) {
			isLogin = true;
		}
		
		// 관리자 여부 체킹 : isAdmin 설정
		if ((grade != null && grade.equals("A")) || 
				(dto != null && dto.getGrade().equals("A"))) {
			isAdmin = true;
		}
		
		// 요청객체에 사용자인증여부, 관리자여부 정보 설정
		request.setAttribute("isLogin", isLogin);
		request.setAttribute("isAdmin", isAdmin);
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

}
