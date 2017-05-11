package com.spring.grouping.board.mapper;

import java.util.List;
import java.util.Map;

import com.spring.grouping.board.domain.BoardVO;

public interface BoardMapper {
	List<BoardVO> selectFreeBoardList(Map<String, Object> map);
	List<BoardVO> selectGroupBoardList(Map<String, Object> map);
	int insertBoard(Map<String, Object> map);
	BoardVO selectBoardDetail(String seq_board_number);
	int updateBoard(BoardVO board);
	int deleteBoard(BoardVO board);
	
	int selectFreeBoardListCnt();
	int selectGroupBoardListCnt(String seq_grp_number);
}
