package com.spring.grouping.common.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/lobby")
public class LobbyController {
	   @RequestMapping(value = "/lobbyView.do")
	    public String lobbyView(){
	        return "/lobby/lobbyView";
	   }   
	  
}
