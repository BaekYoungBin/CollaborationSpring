package com.spring.grouping.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.grouping.board.domain.BoardVO;
import com.spring.grouping.board.service.BoardService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	@Autowired
	BoardService service;

	/**
	 * 게시판 리스트 카운트 조회
	 * seq_grp_number가 null이면 전체 게시판, null이 아니면 해당 그룹 게시판 카운트 조회
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/boardView.do")
	public ModelAndView boardView(HttpSession session) throws Exception{	
		ModelAndView mv = new ModelAndView();
		String seq_grp_number = (String)session.getAttribute("seq_grp_number");		
		System.out.println("그룹넘버 : "+ seq_grp_number);
		if(seq_grp_number == null){
			mv.addObject("boardTotalListCnt", service.selectFreeBoardListCnt());
			mv.setViewName("/board/freeBoardView");
		}
		else{
			mv.addObject("boardTotalListCnt", service.selectGroupBoardListCnt(seq_grp_number));
			mv.setViewName("/board/groupBoardView");
		}
		return mv;
	}

	/**
	 * 게시판 리스트 조회 Ajax
	 * seq_grp_number가 null이면 전체 게시판, null이 아니면 해당 그룹 게시판 조회
	 * @return Map
	 */
	@RequestMapping(value = "/boardViewAjax.do")
	@ResponseBody
	public Map<String, Object> selectBoardList(HttpSession session, String pageNum) throws Exception{
		Map <String, Object> map = new HashMap<String, Object>();
		System.out.println("page number : "+pageNum);		
		String seq_grp_number = (String) session.getAttribute("seq_grp_number");
		map.put("seq_grp_number", seq_grp_number);
		
		map.put("pageNum", (Integer.parseInt(pageNum)-1)*10);	
		if(seq_grp_number == null){
			map.put("boardList", service.selectFreeBoardList(map));
		}
		else
			map.put("boardList", service.selectGroupBoardList(map));
		if (map.size() == 0)
			map.put("boardList", null);
		return map;
	}

	/**
	 * 게시글 등록 화면
	 */
	@RequestMapping(value = "/boardWriteView.do")
	public String boardWriteView() {
		return "/board/boardWriteView";
	}

	/**
	 * 게시글 상세
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/boardDetailView.do")
	public ModelAndView boardDetailView(String seq_board_number) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", service.selectBoardDetail(seq_board_number));
		mv.setViewName("/board/boardDetailView");
		return mv;
	}

	/**
	 * 게시글 등록 Ajax
	 * @return
	 */
	@RequestMapping(value = "/registerBoardAjax.do")
	@ResponseBody
	public int registerBoardAjax(BoardVO board, HttpSession session) throws Exception{

		return service.insertBoard(board, session);
	}

	/**
	 * 게시글 수정 Ajax
	 * @return
	 */
	@RequestMapping(value = "/modifyBoard.do")
	@ResponseBody
	public int modifyBoard(BoardVO board) throws Exception{
		return service.updateBoard(board);
	}

	/**
	 * 게시글 삭제 Ajax
	 * @return
	 */
	@RequestMapping(value = "/deleteBoard.do")
	@ResponseBody
	public int deleteBoard(BoardVO board) throws Exception{
		return service.deleteBoard(board);
	}
}
