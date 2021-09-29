package com.side_on.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.side_on.dto.Apply;
import com.side_on.dto.Criteria;
import com.side_on.dto.CriteriaRc;
import com.side_on.dto.FileVO;
import com.side_on.dto.Member;
import com.side_on.dto.PageMaker;
import com.side_on.dto.PageMakerRc;
import com.side_on.dto.Part;
import com.side_on.dto.RecruitBoard;
import com.side_on.dto.RecruitCriteria;
import com.side_on.dto.RecruitMyPage;
import com.side_on.dto.RecruitPaging;
import com.side_on.dto.Reward;
import com.side_on.service.RecruitService;
import com.side_on.util.Utility;
import com.side_on.util.RandomStringUtils;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class RecruitController {
	
	//Service 연결
	@Autowired
	private RecruitService service;
	
	/** 모집 페이지 첫 화면 
	 * @throws Exception */
	@RequestMapping("/recruit/recruitHome")
	public String recruitHome(Model model, Criteria cri)  {
		
		//model.addAttribute("list", service.getListPaging(cri));
		
		ArrayList<RecruitBoard> list = service.memberAll(); 
		System.out.println("list"+list);
		model.addAttribute("list",list);
		
		return "recruit/recruitHome"; 
		
	}	
	
	/** 모집 페이지 상세 페이지 */
	@RequestMapping("/recruit/recruitDetail")
	public String recruitDetail(int recruit_num,  Model model) {
	
		RecruitBoard list = service.memberDetail(recruit_num);
		
		//분야 별 인원 수
		String front = "Front";
		String Back = "Back";
		String aos = "aos";
		String ios = "ios";
		String server = "server";
		String uxui = "uxui";
		String plan = "plan";
		String pm = "pm";
		
		int FrontCount = service.selectFront(recruit_num, front);
		int BackCount = service.selectBack(recruit_num, Back);
		int aosCount = service.selectAos(recruit_num, aos);
		int iosCount = service.selectIos(recruit_num, ios);
		int serverCount  = service.selectServer(recruit_num, server);
		int uxuiCount = service.selectUxui(recruit_num, uxui);
		int planCount = service.selectPlan(recruit_num, plan);
		int pmCount = service.selectPm(recruit_num, pm);
		
		Part part = new Part();
		part.setFront(FrontCount);
		part.setBack(BackCount);
		part.setAos(aosCount);
		part.setIos(iosCount);
		part.setServer(serverCount);
		part.setUxui(uxuiCount);
		part.setPlan(planCount);
		part.setPm(pmCount);		
		
		System.out.println(part);
		
		model.addAttribute("list",list);
		model.addAttribute("part",part);
		return "recruit/recruitDetail"; 
	}
	
	/** 모집 페이지 상세 페이지 */
	@RequestMapping("/recruit/recruitMine")
	public String recruitMine(int recruit_num, Model model) {
	
		RecruitBoard list = service.memberDetail(recruit_num);
		
		//분야 별 인원 수
		String front = "Front";
		String Back = "Back";
		String aos = "aos";
		String ios = "ios";
		String server = "server";
		String uxui = "uxui";
		String plan = "plan";
		String pm = "pm";
		
		int FrontCount = service.selectFront(recruit_num, front);
		int BackCount = service.selectBack(recruit_num, Back);
		int aosCount = service.selectAos(recruit_num, aos);
		int iosCount = service.selectIos(recruit_num, ios);
		int serverCount  = service.selectServer(recruit_num, server);
		int uxuiCount = service.selectUxui(recruit_num, uxui);
		int planCount = service.selectPlan(recruit_num, plan);
		int pmCount = service.selectPm(recruit_num, pm);
		
		Part part = new Part();
		part.setFront(FrontCount);
		part.setBack(BackCount);
		part.setAos(aosCount);
		part.setIos(iosCount);
		part.setServer(serverCount);
		part.setUxui(uxuiCount);
		part.setPlan(planCount);
		part.setPm(pmCount);		
		
		System.out.println("지원한 지원자 수 체크"+part);
		ArrayList<Apply> apply = service.getApplyList(recruit_num);
	
		String memberId = list.getMemberId();
		String readerId = service.getMemberInfo(memberId);
		
		model.addAttribute("list",list);
		model.addAttribute("part",part);
		model.addAttribute("apply",apply);
		model.addAttribute("readerId",readerId);
		return "recruit/recruitMine"; 
	}
	
	/** 모집 페이지 글 쓰기 */
	@RequestMapping("/recruit/recruitWrite")
	public String recruitWrite(HttpSession session, Model model) {
		
		String memberId= (String)session.getAttribute("memberId");
		model.addAttribute("memberId", memberId);
		return "recruit/recruitWrite"; 
	}
	
	/** 마이페이지 모집현황 보기 */
	@RequestMapping("/recruit/recruitMyRecruit")
	public String recruitMyRecruit(HttpSession session, Model model){
		
		String memberId= (String)session.getAttribute("memberId");
		ArrayList<RecruitBoard> list = service.recruitMyRecruit(memberId); 
		
		
		model.addAttribute("list", list);
		
		return "recruit/recruitMyRecruit"; 
	}
	
	/** 마이페이지 지원현황 보기 */
	@RequestMapping("/recruit/recruitMyApply")
	public String recruitMyApply(HttpSession session, Model model) {
		
		String memberId= (String)session.getAttribute("memberId");
//		ArrayList<RecruitBoard> list = service.myRecruit(memberId); 
		List<HashMap<String,String>> list = service.mypageApply(memberId);
//		ArrayList<Apply> apply = service.myApply(memberId); 
		System.out.println("list"+list);
		
		model.addAttribute("list", list);
		session.setAttribute("list", list);
		return "recruit/recruitMyApply"; 
	}
	
	/** 관리자 페이지 recruitAdmin*/
	@RequestMapping("/recruit/recruitAdmin")
	public String recruitAdmin(Model model) {
		
		ArrayList<Reward> reward = service.getRewardList();
		model.addAttribute("reward", reward);
		
		return "recruit/recruitAdmin"; 
	}
	
	/**리워드 지급*/
	@RequestMapping("/recruit/reward/complete")
	public String rewardComplete(int payment_id,int recruit_num, String pay_amount, Model model) {
		
	System.out.println("컨트롤러 입니다");
	
	
		int result = service.getReward(payment_id, recruit_num,pay_amount);
		
		if(result == 1) {
			return "redirect:/recruit/recruitAdmin";
		}else {
			model.addAttribute("title", "[오류] 리워드 지급 실패");
			model.addAttribute("message", "리워드 지급을 실패하였습니다. 관리자에게 문의하거나 다시 시도해주세요.");
			return "error";
		}
	
	}
	
	/** 지원하기 recruitApply*/
	@RequestMapping("/recruit/recruitApply")
	public String recruitApply(int recruit_num,  Model model) {
			
		RecruitBoard list = service.memberDetail(recruit_num);
		model.addAttribute("list",list);
		
		System.out.println("*******"+list);
		
		return "recruit/recruitApply"; 
	}
	
	/** 지원하기 - 결제 recruitApply*/
	@RequestMapping("/recruit/apply/complete")
	public String recruitApply(Apply apply, HttpSession session, Model model) {
	
		//apply table에 저장 
		String memberId= (String)session.getAttribute("memberId");
		apply.setMember_id(memberId);
		apply.setJoin_yn("y");
		
		//지원 등록
		int result = service.recruitApply(apply);
		
		int recruit_num = apply.getRecruit_num();
		int apply_num = service.getApply_Num(recruit_num, memberId);
		String part = apply.getPart();
		int count = 1;
	
		String pay_check = apply.getPay_check();
		
		//**********************************
		
		// 리워드 테이블 저장 
	
		apply.setPayment_date(Utility.getCurrentDate());	
			
		//글번호 글 쓴이 가져오기
		String writer_memberId = service.getWriterMemberId(recruit_num);
		//가격 가져오기 
		String pay_amount = service.getPayAmount(recruit_num,writer_memberId);
			
			Reward reward  = new Reward();
			reward.setRecruit_num(apply.getRecruit_num());
			reward.setWriter_memberId(writer_memberId);
			reward.setApply_num(apply_num);
			reward.setApply_memberId(memberId);
			reward.setPay_amount(pay_amount);
			reward.setReward_yn(apply.getPay_check());
			
			System.out.println("리워드 ++++++"+reward);
			
			int rewardResult = service.setReward(reward);

		//모집 분야 count+1
		//	service.plusCount(recruit_num,apply_num,count,part);
		
		if (result == 1 && rewardResult == 1 ) {
			return "redirect:/recruit/recruitHome";
		} else {
			model.addAttribute("title", "[오류] 지원 실패");
			model.addAttribute("message", "지원을 실패하였습니다. 관리자에게 문의하거나 다시 시도해주세요.");
			return "error";
		}
	}
	
	/** 모집 글 삭제*/
	@RequestMapping("/recruit/recruitDelete")
	public String recruitDelete(int recruit_num, Model model) {
		
		String n = "n";
		int result = service.recruitDelete(recruit_num, n);
		
		if (result == 1) {
			return "redirect:/recruit/recruitMyRecruit";
		} else {
			model.addAttribute("title", "[오류] 모집 글 삭제 실패");
			model.addAttribute("message", "삭제를 실패하였습니다. 관리자에게 문의하거나 다시 시도해주세요.");
			return "error";
		}
		
	}
	
	/** 에러 페이지*/
	@RequestMapping("/recruit/error")
	public String error() {
		
		return "recruit/error"; 
	}
	
	/** 모집 페이지 글 작성 DB 저장 
	 * @throws Exception */
	@RequestMapping("/recruit/write/complete")
	public String recruitWriteComplete(RecruitBoard recruitBoard, HttpSession session, Model model)  {
		
		String memberId= (String)session.getAttribute("memberId");
		//날짜 저장getCurrentDate
		recruitBoard.setSave_date(Utility.getCurrentDate());
		recruitBoard.setMemberId(memberId);
		recruitBoard.setStatus("y");
		recruitBoard.setVisible_check("y");
		recruitBoard.setHit(0);
		
		System.out.println("컨트롤러 입니당" + recruitBoard);
		
		//서비스 보내기
		int result = service.insertRecruitBoard(recruitBoard);
		
		if(result==1) {
			return "redirect:/recruit/recruitHome";
		}else {
			model.addAttribute("title","[오류] 모집 글 작성 실패");
			model.addAttribute("message", "모집 글 작성을 실패하였습니다. 관리자에게 문의하거나 다시 시도해주세요");
			return "error";
		}
	}
	
	@RequestMapping("/recruit/edit/complete")
	public String recruitEditComplete(RecruitBoard recruitBoard, HttpSession session, Model model)  {
		
		String memberId= (String)session.getAttribute("memberId");
		int recruit_num = recruitBoard.getRecruit_num();
		System.out.println("recruit_num"+recruit_num);
		//날짜 저장getCurrentDate
		recruitBoard.setSave_date(Utility.getCurrentDate());
		recruitBoard.setMemberId(memberId);
		recruitBoard.setStatus("y");
		recruitBoard.setVisible_check("y");
		recruitBoard.setHit(0);
		
		System.out.println("컨트롤러 입니당" + recruitBoard);
		
		//서비스 보내기
		int result = service.updateRecruitBoard(recruitBoard);
		
		if(result==1) {
			model.addAttribute("memberId", memberId);
			return "redirect:/recruit/recruitMyRecruit";
		}else {
			model.addAttribute("title","[오류] 모집 글 작성 실패");
			model.addAttribute("message", "모집 글 작성을 실패하였습니다. 관리자에게 문의하거나 다시 시도해주세요");
			return "error";
		}
	}
	
	/** 지원 취소
	 * @throws Exception */
	@RequestMapping("/recruit/recruitCancel")
	public String recruitCancel(int recruit_num, HttpSession session, Model model)  {
		
		
		String memberId= (String)session.getAttribute("memberId");
		String join_yn = "n";
		
		System.out.println("컨트롤러*****"+recruit_num+","+memberId+","+join_yn);
		
		
		int result = service.recruitCancel(recruit_num, memberId, join_yn);
		
		if(result==1) {
			return "redirect:/recruit/recruitMyApply";
		}else {
			model.addAttribute("title","[오류] 지원 취소 실패");
			model.addAttribute("message", "지원 취소 작업을 실패하였습니다. 관리자에게 문의하거나 다시 시도해주세요");
			return "error";
		}	
	}
	
	/**아이디 찾기*/
	@RequestMapping("/member/findID")
	public String findID( Model model)  {
		
	
		return "member/findID";
	}
	
	/** 모집 글 수정 recruit/recruitEdit*/
	@RequestMapping("/recruit/recruitEdit")
		public String recruitEdit(int recruit_num,  Model model) {
			
		RecruitBoard list = service.memberDetail(recruit_num);
			
			//분야 별 인원 수
			String front = "Front";
			String Back = "Back";
			String aos = "aos";
			String ios = "ios";
			String server = "server";
			String uxui = "uxui";
			String plan = "plan";
			String pm = "pm";
			
			int FrontCount = service.selectFront(recruit_num, front);
			int BackCount = service.selectBack(recruit_num, Back);
			int aosCount = service.selectAos(recruit_num, aos);
			int iosCount = service.selectIos(recruit_num, ios);
			int serverCount  = service.selectServer(recruit_num, server);
			int uxuiCount = service.selectUxui(recruit_num, uxui);
			int planCount = service.selectPlan(recruit_num, plan);
			int pmCount = service.selectPm(recruit_num, pm);
			
			Part part = new Part();
			part.setFront(FrontCount);
			part.setBack(BackCount);
			part.setAos(aosCount);
			part.setIos(iosCount);
			part.setServer(serverCount);
			part.setUxui(uxuiCount);
			part.setPlan(planCount);
			part.setPm(pmCount);		
			
			System.out.println(part);
			
			model.addAttribute("list",list);
			model.addAttribute("part",part);
			return "recruit/recruitEdit"; 
		}
	
	/** 아이디 찾기 /member/findID/complete*/
	@RequestMapping("/member/findIdComplete")
	public String findIDComplete(String name, String mobile,  Model model) {
		
		System.out.println("컨트롤러+++++"+name+mobile);
		
		String memberId = service.getMemberId(name,mobile);
		
		if(memberId != null) {
			model.addAttribute("memberId", memberId);
			return "member/findIdComplete";
			
		}else {
			model.addAttribute("title","[오류] 아이디 찾기 실패");
			model.addAttribute("message", "아이디 찾기를 실패하였습니다. 관리자에게 문의하거나 다시 시도해주세요");
			return "recruit/error";
		}
		
	}
	
	/** 비밀번호 찾기 */
	@RequestMapping("/member/findPw")
	public String findIDComplete(Model model) {
			return "member/findPw"; 
	}
	
	/** 비밀번호 찾기 : 회원 확인ㄴ /member/findID/complete*/
	@RequestMapping("/member/findPwComplete")
	public String findPwComplete(String memberId, String mobile,  Model model) {
		
		System.out.println("findPwComplete*******"+memberId+","+mobile);
		
		String resetId = service.getPwMemberId(memberId, mobile);
		
		if(resetId != null) {
			model.addAttribute("memberId", resetId);
			return "member/resetPw";
			
		}else {
			model.addAttribute("title","[오류] 회원 찾기 실패");
			model.addAttribute("message", "회원 찾기를 실패하였습니다. 관리자에게 문의하거나 다시 시도해주세요");
			return "recruit/error";
		}
		
	}
	
	/**비밀번호 업데이트 */
	@RequestMapping("/member/resetPw")
	public String resetPw(String memberId,  Model model) {
	
		model.addAttribute("memberId", memberId);
		return "member/resetPw";
	}
	
	@RequestMapping("/member/resetPwComplete")
	public String resetPwComplete(String memberId,  String resetPw, Model model) {
		
		int result = service.resetPw(memberId, resetPw);
		
		if(result == 1) {
			return "/member/loginForm";
			
		}else {
			model.addAttribute("title","[오류] 비밀번호 재설정 실패");
			model.addAttribute("message", "비밀번호 재설정을 실패하였습니다. 관리자에게 문의하거나 다시 시도해주세요");
			return "recruit/error";
		}
	}
	
	
	/** 검색하기 /recruitSearch*/
	@RequestMapping("/recruitSearch")
	public String recruitSearch(String search,  Model model) {
	
		ArrayList<RecruitBoard> list = service.listSearch(search); 
		
		System.out.println("검색 내용 *********"+list);
		
		model.addAttribute("search", search);
		model.addAttribute("list", list);
		return "recruit/recruitHome";
	}
	
	
	/**파일 업로드 안돼.. 흑.. 왜..*/
	public String recruitWriteWithFile(RecruitBoard recruitBoard, @RequestPart MultipartFile file) throws Exception {
		System.out.println("컨트롤러 입니당" + recruitBoard);
		
		//file class 설정
		FileVO fileVO;
		
		//날짜 저장getCurrentDate
		recruitBoard.setSave_date(Utility.getCurrentDate());
		recruitBoard.setMemberId("user01");
		recruitBoard.setHit(0);
		
		String fileName = file.getOriginalFilename();
		String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase(); 
		File destinationFile; 
		String destinationFileName;
		String baseDir = "/Side_On/src/main/webapp/WEB-INF/profile";
		String fileUrl = baseDir + "\\"+ file.getOriginalFilename();
		
		do { 
            destinationFileName = RandomStringUtils.getRamdom()+ "." + fileNameExtension; 
            destinationFile = new File(fileUrl+ destinationFileName); 
		} while (destinationFile.exists());
		
		destinationFile.getParentFile().mkdirs(); 
		file.transferTo(destinationFile); 
        
       // service.insertRecruitBoard(recruitBoard); //게시글 insert
        
		
		return "recruit/recruitAdmin"; 
	}
	
	
}

