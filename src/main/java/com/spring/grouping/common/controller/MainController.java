package com.spring.grouping.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/main")
public class MainController {
	   @RequestMapping(value = "/mainView.do")
	    public String mainView(HttpSession session){
		   System.out.println("메인들어왔어요 ㅎㅎ");
		   System.out.println("group_session id = "+session.getAttribute("seq_grp_number"));
		   //여기에 그룹아이디가 필요해. 그룹채팅할려면
	        return "/main/mainView";
	   }   
	   
	  
}
