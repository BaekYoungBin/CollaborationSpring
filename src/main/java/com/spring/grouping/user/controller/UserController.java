package com.spring.grouping.user.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.grouping.user.service.UserService;
/**
 * 로그인 컨트롤러
 */
@Controller
@RequestMapping(value = "/mypage")
public class UserController{
	@Autowired
	UserService service;

	 @RequestMapping(value = "/mypageView.do")
	    public String myPageView(){
		 System.out.println("여기 불렸습니다.");
	        return "/mypage/mypageView";
	   }   
	 @RequestMapping(value = "/insertUserInfoView.do")
	    public String insertUserInfoView(){
		 System.out.println("여기 불렸습니다.");
	        return "/mypage/insertUserInfo";
	   }   
	
	 @RequestMapping(value = "/workConfirmView.do")
	    public String workConfirmView(){
		 System.out.println("여기 불렸습니다.");
	        return "/mypage/workConfirm";
	   } 
	 @RequestMapping(value = "/modifyGroupView.do")
	    public String modifyGroupView(){
		 System.out.println("여기 불렸습니다.");
	        return "/group/modifyGroup";
	   } 
	
}
