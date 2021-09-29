package com.side_on.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

import com.side_on.dto.Criteria;
import com.side_on.dto.CriteriaRc;
import com.side_on.dto.FileVO;
import com.side_on.dto.PageMaker;
import com.side_on.dto.PageMakerRc;
import com.side_on.dto.RecruitBoard;
import com.side_on.dto.RecruitCriteria;
import com.side_on.dto.RecruitPaging;
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
		
		model.addAttribute("list",list);
		return "recruit/recruitDetail"; 
	}
	
	/** 모집 페이지 글 쓰기 */
	@RequestMapping("/recruit/recruitWrite")
	public String recruitWrite() {
		
		return "recruit/recruitWrite"; 
	}
	
	/** 마이페이지 모집현황 보기 */
	@RequestMapping("/recruit/recruitMypage")
	public String recruitMypage() {
		
		return "recruit/recruitMypage"; 
	}
	
	/** 마이페이지 지원현황 보기 */
	@RequestMapping("/recruit/recruitMypage2")
	public String recruitMypage2() {
		
		return "recruit/recruitMypage2"; 
	}
	
	/** 관리자 페이지 recruitAdmin*/
	@RequestMapping("/recruit/recruitAdmin")
	public String recruitAdmin() {
		
		return "recruit/recruitAdmin"; 
	}
	
	/** 지원하기 recruitApply*/
	@RequestMapping("/recruit/recruitApply")
	public String recruitApply(int recruit_num,  Model model) {
			
		RecruitBoard list = service.memberDetail(recruit_num);
		model.addAttribute("list",list);
		
		return "recruit/recruitApply"; 
	}
	
	/** 지원하기 - 결제 recruitApply*/
	@RequestMapping("/recruit/apply/complete")
	public String recruitApply() {
			
		System.out.println("어서옵셔^^");
		return "recruit/recruitHome"; 
	}
	
	/** 에러 페이지*/
	@RequestMapping("/recruit/error")
	public String error() {
		
		return "recruit/error"; 
	}
	
	/** 모집 페이지 글 작성 DB 저장 
	 * @throws Exception */
	@RequestMapping("/recruit/write/complete")
	public String recruitWriteComplete(RecruitBoard recruitBoard, Model model)  {
		
		//날짜 저장getCurrentDate
		recruitBoard.setSave_date(Utility.getCurrentDate());
		recruitBoard.setMemberId("user01");
		recruitBoard.setHit(0);
		
		System.out.println("컨트롤러 입니당" + recruitBoard);
		
		//서비스 보내기
		int result = service.insertRecruitBoard(recruitBoard);
		
		if(result==1) {
			return "recruit/recruitHome";
		}else {
			model.addAttribute("message", "[오류] 글 등록을 실패하였습니다. 다시 시도해주세요.");
			return "error";
		}
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

