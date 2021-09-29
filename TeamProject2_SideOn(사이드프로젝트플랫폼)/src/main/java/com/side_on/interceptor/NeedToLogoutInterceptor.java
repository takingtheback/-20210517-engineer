package com.side_on.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Component("needToLogoutInterceptor") // 다중의 HandlerInterceptor 이어서 bean-name 설정
@Slf4j
public class NeedToLogoutInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// beforeActionInterceptor 인터셉터에서 요청객체 설정해놓은 isLogin 을 가져와서 로그인 여부 체킹
		boolean isLogin = (boolean)request.getAttribute("isLogin");
		log.debug("### needToLogoutInterceptor isLogin: " + isLogin);
		
		if (isLogin) {
			// JavaScript 사용해서 경고메세지 출력후 로그인페이지 이동 요청
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.append("<script>");
			out.append("alert('로그인 상태에서 이용할 수 없는 서비스입니다.');");
			//out.append("location.replace('/main');"); // 임의로 시작페이지 이동
			out.append("history.back();"); // 해당 서비스 요청전의 페이지로 back 이동처리
			out.append("</script>");
			
			return false; // 사용자 인증받지 않은 사용자 요청 거부(Controller 요청 수행하지 않음)
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

}
