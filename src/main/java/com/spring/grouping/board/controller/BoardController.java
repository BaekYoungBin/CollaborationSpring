package com.spring.grouping.board.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
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
		   System.out.println("boardList ="+boardList.toString());
		   System.out.println("size="+boardList.size());
		   System.out.println(boardList.get(0).getBoard_title());
		   Map<String, Object> map = new HashMap<String, Object>();
		   map.put("boardList", boardList);
		 return map;
		   
		   
		 /*  if(session.getAttribute("group_id")==null )
	        return "/board/communityView";
		   else
		   {
			   //그룹아이디 가지고 board가기
				return "/board/communityView";
		   }*/
	
	    }
	    
	    
}
