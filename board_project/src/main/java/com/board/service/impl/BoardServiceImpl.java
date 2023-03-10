package com.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.mapper.BoardMapper;
import com.board.model.BoardVO;
import com.board.model.PageVO;
import com.board.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public void regist(BoardVO board) {
		mapper.regist(board);
	}

	@Override
	public List<BoardVO> getList() {
		return mapper.getList();
	}

	@Override
	public BoardVO getDetail(int bno) {
		return mapper.getDetail(bno);
	}

	@Override
	public int modify(BoardVO board) {
		return mapper.modify(board);
	}

	@Override
	public int delete(int bno) {
		return mapper.delete(bno);
	}

	@Override
	public List<BoardVO> getListPaging(PageVO page) {
		return mapper.getListPaging(page);
	}

	@Override
	public int getTotal() {
		return mapper.getTotal();
	}

}
