package com.spring.grouping.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.grouping.board.domain.BoardVO;
import com.spring.grouping.board.mapper.BoardMapper;



@Service
public class BoardService {
	@Autowired
	private BoardMapper boardMapper;
	
	
	
	/**
	 * 유저 로그인
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public List<BoardVO> selectBoardList(){
		return boardMapper.selectBoardList();
	};
	public int selectBoardListCnt(){
		return boardMapper.selectBoardListCnt();
	};
	
	
	public BoardVO selectBoardDetail(String seq_board_number){
		return boardMapper.selectBoardDetail(seq_board_number);
	}
	public int insertBoard(BoardVO board, HttpSession session){
		   Map<String, Object> map = new HashMap<>();
		   map.put("user_id",(String)session.getAttribute("user_id"));
		   map.put("user_name", (String)session.getAttribute("user_name"));
		   map.put("board", board); 
		return boardMapper.insertBoard(map);
	}
	
	
	public int updateBoard(BoardVO board){
		return boardMapper.updateBoard(board);
	}
	public int deleteBoard(BoardVO board){
		return boardMapper.deleteBoard(board);
	}
}
