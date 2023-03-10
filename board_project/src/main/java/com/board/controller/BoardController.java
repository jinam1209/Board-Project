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
import com.board.model.PageMakerDTO;
import com.board.model.PageVO;
import com.board.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardService;
	
//	/* 게시판 목록 페이지 이동 (페이징 X) */
//	@GetMapping("/list")
//	// => @RequestMapping(value="list", method=RequestMethod.GET)
//	public void boardListPage(Model model) {
//
//		log.info("게시판 목록 페이지(페이징 X)");
//		
//		model.addAttribute("list", boardService.getList());
//
//	}
	
    /* 게시판 목록 페이지 접속(페이징 O) */
    @GetMapping("/list")
    public void boardListPage(Model model, PageVO page) {
        
        log.info("게시판 목록 페이지(페이징 O)");
        
        model.addAttribute("list", boardService.getListPaging(page));
        
        int total = boardService.getTotal();
        PageMakerDTO pageMaker = new PageMakerDTO(page, total);
        model.addAttribute("pageMaker", pageMaker);
    }
	
	/* 게시판 등록 페이지 이동 */
	@GetMapping("/regist")
	// => @RequestMapping(value="regist", method=RequestMethod.GET)
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
	
	/* 게시판 조회 */
    @GetMapping("/detail")
    public void boardGetDetailPage(int bno, Model model) {
        
        model.addAttribute("bvo", boardService.getDetail(bno));
        
    }
    
    /* 게시판 수정 페이지 이동 */
    @GetMapping("/modify")
    public void boardModifyPage(int bno, Model model) {
        
        model.addAttribute("bvo", boardService.getDetail(bno));
        
    }
    
    /* 게시판 수정 */
    @PostMapping("/modify")
    public String boardModifyPOST(BoardVO board, RedirectAttributes rttr) {
        
        boardService.modify(board);
        
        rttr.addFlashAttribute("result", "modify success");
        
        return "redirect:/board/list";
        
    }
    
    /* 게시판 삭제 */
    @PostMapping("/delete")
    public String boardDelete(int bno, RedirectAttributes rttr) {
        
        boardService.delete(bno);
        
        rttr.addFlashAttribute("result", "delete success");
        
        return "redirect:/board/list";
    }
}
