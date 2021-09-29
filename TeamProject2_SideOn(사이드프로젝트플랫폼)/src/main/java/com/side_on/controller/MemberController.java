package com.side_on.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;


import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.side_on.dto.Member;
import com.side_on.dto.Notice;
import com.side_on.dto.Rest;
import com.side_on.service.MemberService;
import com.side_on.service.NoticeService;
import com.side_on.service.RestService;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@Slf4j
public class MemberController {

	@Autowired
	public NoticeService noticeService;
	
	@Autowired
	public MemberService memberService;
	
	@Autowired
	public RestService restService;
	
	@RequestMapping("/member/loginForm")
	public String loginForm() {
		log.debug("loginForm() Load :: ");
		return "member/loginForm";
	}
	
	@RequestMapping("/member/login")
	public String login(String memberId, String memberPw, HttpSession session) {
		log.debug("login user :: " + memberId + ", " + memberPw);

		String grade = memberService.login(memberId, memberPw);
		log.debug("login grade :: " + grade);

		Member dto = memberService.loginToMember(memberId, memberPw);		
		log.debug("dto :: " + dto);
		
		if(grade != null && dto != null) {
			session.setAttribute("memberId", memberId);
			session.setAttribute("grade", grade);
			session.setAttribute("dto", dto);
			if(grade.equals("A")) {
				log.debug("login admin Success :: ");
				return "main";
			} else {
				log.debug("login user Success :: ");
				return "main";
			}
		} else {
			log.debug("login Fail :: ");
			return "member/loginForm";
		}
	}

	@RequestMapping("/admin/dashboard")
	public String dashboard(Model model) {
		List<Notice> noticeList = noticeService.dashboardNoticeList();
		List<Rest> restList = restService.dashboardRestList();
		int restCount = restService.restUnConfirmCount();
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("restList", restList);
		model.addAttribute("restCount", restCount);
		return "admin/dashboard";
	}
	
	@RequestMapping("/member/deleteForm")
	public String deleteForm() {
		log.debug("deleteForm() Load :: ");
		return "member/deleteForm";
	}
	
	@RequestMapping("/member/deleteMember")
	public String deleteMember(String memberId, String memberPw) {
		log.debug("deleteMember Load :: ");
		log.debug(memberId + ", " + memberPw);
		boolean result = memberService.deleteMember(memberId, memberPw);
		if(result == true) {
			log.debug("deleteMember Success :: ");
			return "member/loginForm";
		} else {
			log.debug("deleteMember Fail :: ");
			return "member/deleteForm";
		}
	}
	
	/* 회원가입 */
	@RequestMapping("/member/register")
	public String register() {
		log.debug("### register :: ");
		return "member/register";
	}
	
	/* 회원가입 완료 */
	@RequestMapping("/member/registerDone")
	public String registerDone(Member dto, Model model) {
		int result = memberService.addMember(dto);
		if (result == 1) {
			model.addAttribute("message", "[회원가입성공] 로그인 후 서비스 이용하세요");
			return "member/registerDone";
		} else {
			model.addAttribute("message", "[회원가입실패] 가입 정보를 다시 확인하시기 바랍니다.");
			return "main";
		}
	}
	
	/* 아이디 중복체크 */
	@RequestMapping("/member/idCheck")
	public String idCheck() {
		return "member/idCheck";
	}
	
	@RequestMapping("/member/myInfo")
	protected String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("내정보조회");
		
		HttpSession session = request.getSession(false);
		
		if (session == null || session.getAttribute("memberId") == null || session.getAttribute("grade") == null) {
			request.setAttribute("message", "[오류] 회원전용 서비스입니다. 로그인 후 이용하시기 바랍니다.");
			return "result";
		}
		
		String loginMemberId = (String)session.getAttribute("memberId");
		
		Member dto = memberService.getMemberToDto(loginMemberId);
		
		if (dto == null) {
			request.setAttribute("message", "[실패] 내정보 조회를 다시 확인하시기 바랍니다.");
			return "main";
		}
		
		request.setAttribute("dto", dto);
		return "member/myInfo";
	}
	
	@RequestMapping("/member/myInfoUpdate")
	public String updateInfo(HttpServletResponse response, HttpSession session, Model model, String memberId, String memberPw, String name, String mobile, String email) throws IOException {
		if (session == null || session.getAttribute("memberId") == null || session.getAttribute("grade") == null) {
			model.addAttribute("message", "[오류] 회원전용 서비스입니다. 로그인 후 이용하시기 바랍니다.");
			return "result";
		}
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (!isRequired(memberId) || !isRequired(memberPw) || !isRequired(name) ||
				!isRequired(mobile) || !isRequired(email)) {
			out.println("<script type='text/javascript'>");
			out.println("alert('[내정보변경저장 실패] 내정보 변경 필수 입력항목을 모두 입력하시기 바랍니다.');");
			out.println("location.href='member/myInfo'");
			out.println("</script");
			return "member/myInfo";
		}
		
		int result = memberService.setMember(memberId, memberPw, name, mobile, email); 
		
		if (result >= 1) {
			out.println("<script type='text/javascript'>");
			out.println("alert('[내정보변경 성공] 내정보 변경이 완료되었습니다.');");
			out.println("location.href='board/Mypage.jsp'");
			out.println("</script>");
		} else {
			out.println("<script type='text/javascript'>");
			out.println("alert('[내정보변경저장 실패] 내정보 변경 저장시 문제가 발생했습니다. 다시 확인하시기 바랍니다.');");
			out.println("location.href='main.jsp'");
			out.println("</script>");
		}
		return "board/Mypage";
	}

	public boolean isRequired(String data) {
		if (data != null && data.trim().length() > 0) {
			return true;
		}
		return false;
	}
	
	/* 핸드폰 인증 */
	@RequestMapping("/member/mobile")
	public String sendMessage() {
		log.debug("### sendMessage :: ");
		return "/member/mobile";
	}
	
	/* 핸드폰 인증 컨트롤러 */
	@RequestMapping("/member/mobileCheck")
	public String sendMessageCheck() {
	    String api_key = "NCSVTX3TUWC2PTIE";
	    String api_secret = "WRWDWAIUWZNMA58CBDIG92B7EKOS5PNF";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", "01031856319");	// 수신전화번호
	    params.put("from", "01031856319");	// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "인증번호는 [731126] 입니다.");
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
		return "/member/mobile";
	}
}
