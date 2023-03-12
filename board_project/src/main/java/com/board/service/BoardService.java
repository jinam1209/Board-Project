package com.board.service;

import java.util.List;

import com.board.model.BoardVO;

public interface BoardService {
	
	// 게시판 등록
	public void regist(BoardVO board);
	
	// 게시판 목록
	public List<BoardVO> getList();
	
	// 게시판 조회
	public BoardVO getDetail(int bno);
}
