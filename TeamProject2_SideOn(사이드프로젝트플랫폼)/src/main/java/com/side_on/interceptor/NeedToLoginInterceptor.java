package com.side_on.interceptor;

import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import lombok.extern.slf4j.Slf4j;

@Component("needToLoginInterceptor")
@Slf4j
public class NeedToLoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// beforeActionInterceptor 인터셉터에서 요청객체 설정해놓은 isLogin 을 가져와서 로그인 여부 체킹
		boolean isLogin = (boolean)request.getAttribute("isLogin");
		log.debug("### needToLoginInterceptor isLogin: " + isLogin);
		
		if (!isLogin) {
			// JavaScript 사용해서 경고메세지 출력후 로그인페이지 이동 요청
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.append("<script>");
			out.append("alert('로그인 인증 후에 이용하시기 바랍니다.');");
			out.append("location.replace('/member/loginForm');");
			out.append("</script>");
			
			// 경고메세지 출력없이 로그인페이지 이동 요청
			//response.sendRedirect("/loginForm");
			
			return false; // 사용자 인증받지 않은 사용자 요청 거부(Controller 요청 수행하지 않음)
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

}
