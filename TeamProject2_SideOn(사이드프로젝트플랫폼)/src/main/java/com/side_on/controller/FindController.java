package com.side_on.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.side_on.dto.Criteria;
import com.side_on.dto.Find;
import com.side_on.dto.PageMaker;
import com.side_on.service.FindService;


import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class FindController {
	
	@Autowired
	public FindService findService;
	
	
	/** 목록 페이지 */
	@RequestMapping("/find/list")
	public String FindMemberList(Model model) {
		log.info("### findMember List :: ");
		
		ArrayList<Find> find = findService.findMemberList();
		
		model.addAttribute("find", find);
		
		return "find/list";
	}
	
	/** 게시글 상세조회 화면  */
	@RequestMapping("/find/detail")
	public String FindMemberDetail(int find_no, Model model) {
		log.info("### FindMemberDetail :: ");
		
		Find dto = findService.findMemberDetail(find_no);
		
		model.addAttribute("dto", dto);
		return "find/detail";
	}
	
	/** 게시글 삭제 */
	@RequestMapping("/find/delete")
	public String FindMemberDelete(int find_no, Model model) {
		log.info("### FindMember Delete :: ");
		int result = findService.findMemberDelete(find_no);
		if (result == 1) {
			return "find/deleteDone";
		} else {
			return "find/detail";
		}
	}
	
	/** 게시글 삭제 후 이동 페이지 */
	@RequestMapping("/find/deleteDone")
	public String DeleteDone() {
		return "find/deleteDone";
	}
	
	
		
	/** 게시글 수정화면 */
	@RequestMapping("/find/updateForm")
	public String FindMemberUpdate(int find_no, Model model) {
		log.debug("### FindMember Update :: ");
		Find dto = findService.findMemberDetail(find_no);
		model.addAttribute("dto", dto);
		return "find/updateForm";
	}
	
	
	/** 게시글 수정 */
	@RequestMapping("/find/update")
	public String FindMemberUpdate(Find dto, Model model) {
			int result = findService.updateFindMember(dto);
			if (result == 1) {
				return "find/formDone";
			} else {
				model.addAttribute("message", "수정 실패");
				log.debug("### error :: " + result);
				return "find/detail";
			}
		}
	
	
	
	/** 게시글 작성화면 */
	@RequestMapping("/find/form")
	public String findMemberForm() {
		log.info("### findMember form ::");
		return "find/form";
	}

    /** 게시글 작성 */
	@RequestMapping("/find/formDone")
	public String findMemberWrite(Find dto, Model model) {
		log.info("### findMember Write :: ");
		log.debug("###" + dto);
		
		int result = findService.insertFindMember(dto);
			if (result == 1) {
				return "find/formDone";
			} else {
				model.addAttribute("message", "작성 실패");
				return "find/list";
			}
		}
	
}
