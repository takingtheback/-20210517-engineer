package com.side_on.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.side_on.dto.Criteria;
import com.side_on.dto.PageMaker;
import com.side_on.dto.QnABoard;
import com.side_on.service.BoardService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class BoardController {

	@Autowired
	public BoardService boardService;
	
	
	/**
	 * 채팅방 
	 * @return board/chatRoom
	 */
	@RequestMapping("/board/chatRoom")
	public String chatRoom() {
	
		return "board/chatRoom";
	}
	
		
	/**
	 * QnA게시글 상세조회 화면
	 * @param qnaBoardNo
	 * @param model
	 * @return board/QnABoardDetail
	 */
	@RequestMapping("/board/QnABoardDetail")
	public String QnABoardDetail(int qnaBoardNo, Model model) {
		log.debug("### QnABoardDetail");
		
		QnABoard dto = boardService.QnABoardDetail(qnaBoardNo);
		
		model.addAttribute("dto", dto);
		return "board/QnABoardDetail";
	}
	
	
	/**
	 * QnA게시글 등록 결과화면
	 * @return board/WriteResult
	 */
	@RequestMapping("/board/WriteResult")
	public String WriteResult() {
		return "board/WriteResult";
	}
	
	
	/**
	 * QnA게시글 삭제 결과화면
	 * @return board/DeleteResult
	 */
	@RequestMapping("/board/DeleteResult")
	public String DeleteResult() {
		return "board/DeleteResult";
	}
	
	
	/**
	 * QnA게시글 삭제
	 * @param qnaBoardNo
	 * @param model
	 * @return result
	 */
	@RequestMapping("/board/QnABoardDelete")
	public String QnABoardDelete(int qnaBoardNo, Model model) {
		log.debug("### QnABoardDelete");
		int result = boardService.QnABoardDelete(qnaBoardNo);
		if (result == 1) {
			return "board/DeleteResult";
		} else {
			model.addAttribute("message", "[문의글 수정 실패] 작성 정보를 다시 확인하시기 바랍니다.");
			return "result";
		}
	}
		
	
	/**
	 * QnA게시글 수정화면
	 * @param qnaBoardNo
	 * @param model
	 * @return board/QnABoardUpdate
	 */
	@RequestMapping("/board/QnABoardUpdate")
	public String QnABoardUpdate(int qnaBoardNo, Model model) {
		log.debug("### QnABoardUpdate");
		QnABoard dto = boardService.QnABoardDetail(qnaBoardNo);
		model.addAttribute("dto", dto);
		return "board/QnABoardUpdate";
	}
	
	
	/**
	 * QnA게시글 수정
	 * @param dto
	 * @param model
	 * @return board/WriteResult
	 */
	@RequestMapping("/board/QnAUpdate")
	public String QnAUpdate(QnABoard dto, Model model) {
		int result = boardService.updateQnABoard(dto);
		if (result == 1) {
			return "board/WriteResult";
		} else {
			model.addAttribute("message", "[문의글 수정 실패] 작성 정보를 다시 확인하시기 바랍니다.");
			return "result";
		}
	}
	

	/**
	 * QnA게시판 목록 화면 접속(페이징 적용)
	 * @param model
	 * @param cri
	 */
    @GetMapping("/board/QnABoard")
    public void boardListGET(Model model, Criteria cri) {
        log.info("### boardListGET");
        model.addAttribute("list", boardService.getListPaging(cri));
        int total = boardService.getTotal(cri);
        PageMaker pageMake = new PageMaker(cri, total);
        model.addAttribute("pageMaker", pageMake);
    }    
	
	
    /**
     * QnA게시글 작성
     * @param dto
     * @param model
     * @return board/WriteResult
     */
	@RequestMapping("/board/QnAWrite")
	public String QnAWrite(QnABoard dto, Model model) {
		int result = boardService.addQnABoard(dto);
		if (result == 1) {
			return "board/WriteResult";
		} else {
			model.addAttribute("message", "[문의글작성 실패] 작성 정보를 다시 확인하시기 바랍니다.");
			return "result";
		}
	}
	
	
	/**
	 * QnA게시글 작성화면
	 * @return board/QnABoardWrite
	 */
	@RequestMapping("/board/QnABoardWrite")
	public String QnABoardWrite() {
		return "board/QnABoardWrite";
	}
	
	
	/**
	 * 마이페이지 화면
	 * @return board/Mypage
	 */
	@RequestMapping("/board/Mypage")
	public String Mypage() {
		return "board/Mypage";
	}
	
	
	/**
	 * FaQ 화면
	 * @return board/FaQBoard
	 */
	@RequestMapping("/board/FaQBoard")
	public String FaQBoard() {
		return "board/FaQBoard";
	}
	
	
	/**
	 * 문의메일발송 화면
	 * @return board/contactEmail
	 */
	@RequestMapping("/board/contactEmail")
	public String contactEmail() {
		return "board/contactEmail";
	}
	
	
	/**
	 * 문의메일발송 결과화면
	 * @return board/contactResult
	 */
	@RequestMapping("/board/contactResult")
	public String contactResult() {
		return "board/contactResult";
	}
	
	
	/**
	 * 1:1채팅 화면
	 * @return board/chat
	 */
	@RequestMapping("/board/chat")
	public String chat() {
		return "board/chat";
	}
}
