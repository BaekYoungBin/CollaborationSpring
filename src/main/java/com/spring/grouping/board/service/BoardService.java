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
	 * 전체게시판 리스트 조회
	 * @return List<BoardVO>
	 */
	public List<BoardVO> selectFreeBoardList(){
		return boardMapper.selectBoardList();
	};
	
	/**
	 * 게시판 상세 조회
	 * @return BoardVO
	 */
	public BoardVO selectBoardDetail(String seq_board_number){
		return boardMapper.selectBoardDetail(seq_board_number);
	}
	
	/**
	 * 게시글 생성
	 * @return
	 */
	public int insertBoard(BoardVO board, HttpSession session){
		   Map<String, Object> map = new HashMap<>();
		   map.put("user_id",(String)session.getAttribute("user_id"));
		   map.put("user_name", (String)session.getAttribute("user_name"));
		   map.put("seq_grp_number", (String)session.getAttribute("seq_grp_number"));
		   map.put("board", board); 
		return boardMapper.insertBoard(map);
	}
	
	/**
	 * 게시글 수정
	 * @return
	 */
	public int updateBoard(BoardVO board){
		return boardMapper.updateBoard(board);
	}
	
	/**
	 * 게시글 삭제
	 * @return
	 */
	public int deleteBoard(BoardVO board){
		return boardMapper.deleteBoard(board);
	}
	
	/**
	 * 그룹 게시판 리스트 조회
	 * @return
	 */
	public List<BoardVO> selectGroupBoardList(String seq_grp_number) {
		// TODO Auto-generated method stub
		return boardMapper.selectGroupBoardList(seq_grp_number);
	}
}
