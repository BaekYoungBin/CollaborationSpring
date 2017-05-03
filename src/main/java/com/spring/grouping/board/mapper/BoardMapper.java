package com.spring.grouping.board.mapper;

import java.util.List;
import java.util.Map;

import com.spring.grouping.board.domain.BoardVO;

public interface BoardMapper {
	List<BoardVO> selectBoardList();
	int selectBoardListCnt();
	int insertBoard(Map<String, Object> map);
	BoardVO selectBoardDetail(String seq_board_number);
	int updateBoard(BoardVO board);
	int deleteBoard(BoardVO board);
	List<BoardVO> selectGroupBoardList(String seq_grp_number);
}
