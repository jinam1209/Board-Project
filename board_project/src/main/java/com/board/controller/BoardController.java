package com.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.model.BoardVO;
import com.board.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardService;
	
	/* 게시판 목록 페이지 이동 */
	@GetMapping("/list")
	// => @RequestMapping(value="list", method=RequestMethod.GET)
	public void boardListPage(Model model) {

		log.info("게시판 목록 페이지");
		
		model.addAttribute("list", boardService.getList());

	}
	
	/* 게시판 등록 페이지 이동 */
	@GetMapping("/regist")
	// => @RequestMapping(value="enroll", method=RequestMethod.GET)
	public void boardRegistPage() {

		log.info("게시판 등록 페이지");

	}
	
	/* 게시판 등록 */
	@PostMapping("/regist")
	public String boardRegist(BoardVO board, RedirectAttributes rttr) {
		
		log.info("BoardVO : " + board);
		
		boardService.regist(board); // 등록
		
		rttr.addFlashAttribute("result", "regist success");
		
		return "redirect:/board/list";
	}
}
