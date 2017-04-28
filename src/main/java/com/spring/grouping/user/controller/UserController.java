package com.spring.grouping.user.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.grouping.user.domain.UserVO;
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
	    public ModelAndView insertUserInfoView(HttpSession session){
		 ModelAndView mv = new ModelAndView();	 
		 UserVO user = service.selectUserInfo((String)session.getAttribute("user_id"));
		 System.out.println(user.getUser_name());
		 System.out.println(user.getUser_email());
		   mv.addObject("user", user);
		   mv.setViewName("/mypage/insertUserInfo");
	        return mv;
	   }   
	
	 @RequestMapping(value = "/workConfirmView.do")
	    public String workConfirmView(){
		 System.out.println("여기 불렸습니다.");
	        return "/mypage/workConfirm";
	   } 

	 @RequestMapping(value = "/modifyUserInfo.do")
	 @ResponseBody
	    public int modifyUserInfo(UserVO user, HttpSession session){
		 user.setUser_id((String)session.getAttribute("user_id"));
		 service.updateUserInfo(user);
		 if(service.updateUserInfo(user)!=0){
			 session.setAttribute("user_name", user.getUser_name());
			 return 1;
		 }
		 else
			 return 0;
	   } 
	
}
