package com.board.mij.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.board.mij.domain.BoardVO;
import com.board.mij.mapper.BoardMapper;

@Service("com.board.mij.service.BoardService")
public class BoardService {

	@Resource(name = "com.board.mij.mapper.BoardMapper")
	BoardMapper mBoardMapper;
	
	public List<BoardVO> boardList(int startBoardNum, int boardCountInPage) throws Exception {
		return mBoardMapper.boardList(startBoardNum, boardCountInPage);
	}
	
	public int boardTotalCount() throws Exception{
		return mBoardMapper.boardTotalCount();
	}
	
	public int boardRegister(BoardVO board) throws Exception {
		return mBoardMapper.boardRegister(board);
	}
	
	public BoardVO boardDetail(int boardId) throws Exception {
		return mBoardMapper.boardDetail(boardId);
	}

	public void boardDelete(int boardId) throws Exception{
		mBoardMapper.boardDelete(boardId);
	}
	
}
