package com.spring.grouping.board.mapper;

import java.util.List;

import com.spring.grouping.board.domain.BoardVO;

public interface BoardMapper {
	List<BoardVO> selectBoardList();
	int selectBoardListCnt();
}
