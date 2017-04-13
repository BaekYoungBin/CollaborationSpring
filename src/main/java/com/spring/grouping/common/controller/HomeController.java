package com.spring.grouping.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.grouping.user.service.UserService;

@Controller
public class HomeController {
	@Autowired
	UserService service;

	@RequestMapping(value = "/")
	public String Login() {
		return "Login/login";
	}
	@RequestMapping(value = "/signUp")
	public String SignUp() {
		return "Login/signUp";
	}
	@RequestMapping(value = "/idFindPopup")
	public String IdFind() {
		return "Login/idFindPopup";
	}
	@RequestMapping(value = "/passwordFindPopup")
	public String PasswordFind() {
		return "Login/passwordFindPopup";
	}

	@RequestMapping(value = "/signIn")
	public String signIn() {
		return "Lobby/LobyFrame";
	}
	
	
	@RequestMapping(value = "/goProject")
	public String goProject() {
		return "Project/projectView";
	}
	@RequestMapping(value = "/goCommunity")
	public String goCommunity() {
		return "Community/communityView";
	}
	@RequestMapping(value = "/goMypage")
	public String goMypage() {
		return "Mypage/myPageView";
	}
	@RequestMapping(value = "/main")
	public String main() {
		return "main";
	}
}
