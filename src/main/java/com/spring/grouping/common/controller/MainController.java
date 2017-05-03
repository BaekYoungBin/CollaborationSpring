package com.spring.grouping.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.grouping.group.service.GroupService;

@Controller
@RequestMapping(value = "/main")
public class MainController {
		
		@Autowired
		GroupService service;
	
	   @RequestMapping(value = "/mainView.do")
	    public ModelAndView mainView(HttpSession session){
		   
		   ModelAndView mv = new ModelAndView();
		   mv.setViewName("/main/mainView");
		   mv.addObject("grp_title", service.selectGroupTitle((String)session.getAttribute("seq_grp_number")));
		   //여기에 그룹아이디가 필요해. 그룹채팅할려면
	        return mv;
	   }   
	   
	  
}
