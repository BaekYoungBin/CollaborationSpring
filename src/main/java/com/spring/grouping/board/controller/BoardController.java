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
	
	   @RequestMapping(value = "/boardView.do")
	    public String boardView(HttpSession session){
		   System.out.println("여기 불렸습니다.");
		   if(session.getAttribute("group_id")==null )
	        return "/board/communityView";
		   else
		   {
			   //그룹아이디 가지고 board가기
				return "/board/communityView";
		   }
	    }
	   @RequestMapping(value = "/boardViewAjax.do")
	   @ResponseBody
	    public Map<String, Object> boardViewAjax(){
		   List<BoardVO> boardList = service.selectBoardList();
		   System.out.println(boardList.size());
		   
		   Map<String, Object> map = new HashMap<String, Object>();
		   map.put("boardList", boardList);
		   if(map.size() == 0)
			   map.put("boardList", null);
		   return map;	
	    }
	   @RequestMapping(value = "/boardWriteView.do")
	    public String boardWriteView(){
		 return "/board/boardWriteView";
	    }
	  
	   @RequestMapping(value = "/boardDetailView.do")
	    public ModelAndView boardDetailView(String seq_board_number){
		   ModelAndView mv = new ModelAndView();	 
		   mv.addObject("board", service.selectBoardDetail(seq_board_number));
		   mv.setViewName("/board/boardDetailView");
		 return mv;
	    }

	   @RequestMapping(value ="/insertBoard.do")
	   @ResponseBody
	    public int boardInsert(BoardVO board, HttpSession session){	  

		 return service.insertBoard(board, session);
	    }
	   
	   @RequestMapping(value="/modifyBoard.do")
	   @ResponseBody
	   public int modifyBoard(BoardVO board){
		   return service.updateBoard(board);
	   }
	   
	   @RequestMapping(value="/deleteBoard.do")
	   @ResponseBody
	   public int deleteBoard(BoardVO board){
		   return service.deleteBoard(board);
	   }
}
