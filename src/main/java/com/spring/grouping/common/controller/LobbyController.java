package com.spring.grouping.common.controller;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/lobby")
public class LobbyController {
	   @RequestMapping(value = "/lobbyView.do")
	    public String lobbyView(HttpSession session){
		   session.setAttribute("seq_grp_number", null);
	        return "/lobby/lobbyView";
	   }   
	  
}
