package com.spring.grouping.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysql.jdbc.StringUtils;
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
	
	
	
}
