package com.side_on.controller;



import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {
	
	
	/**
	 * 메인페이지
	 * @param request
	 * @return main
	 */
	@RequestMapping("/")
	public String home(HttpServletRequest request) {
		ServletContext application = request.getServletContext();
		String path = application.getContextPath();
		application.setAttribute("path", path);
		log.info("### Main : " + path);
		return "main";
	}
	
	
	/**
	 * 로그아웃
	 * @param session
	 * @return main
	 */
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		Enumeration<String> attributes = session.getAttributeNames();
		while (attributes.hasMoreElements()) {
			String attribute = attributes.nextElement();
			session.removeAttribute(attribute);
		}
		session.invalidate();
		return "main";
	}
	
	
}
