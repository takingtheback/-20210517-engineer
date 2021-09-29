package com.side_on.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Component("needToAdminInterceptor")
@Slf4j
public class NeedToAdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// beforeActionInterceptor 인터셉터에서 요청객체 설정해놓은 isLogin, isAdmin 을 가져와서 로그인 여부 체킹
		boolean isLogin = (boolean)request.getAttribute("isLogin");
		boolean isAdmin = (boolean)request.getAttribute("isAdmin");
		log.debug("### needToAdminInterceptor isLogin: " + isLogin);
		log.debug("### needToAdminInterceptor isAdmin: " + isAdmin);
		
		if (!isLogin) {
			// JavaScript 사용해서 경고메세지 출력후 로그인페이지 이동 요청
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.append("<script>");
			out.append("alert('로그인 인증 후에 이용하시기 바랍니다.');");
			out.append("location.replace('/loginForm');");
			out.append("</script>");
			
			return false; // 사용자 인증받지 않은 사용자 요청 거부(Controller 요청 수행하지 않음)
		}

		if (!isAdmin) {
			// JavaScript 사용해서 경고메세지 출력후 로그인페이지 이동 요청
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.append("<script>");
			out.append("alert('관리자 권한으로 로그인후에 이용하시기 바랍니다.');");
			//out.append("location.replace('/main');"); // 임의로 시작페이지 이동
			out.append("history.back();"); // 해당 서비스 요청전의 페이지로 back 이동처리
			out.append("</script>");
			
			return false; // 사용자 인증받지 않은 사용자 요청 거부(Controller 요청 수행하지 않음)
		}
		
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
