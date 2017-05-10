package com.spring.grouping.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.grouping.mypage.domain.UserVO;
import com.spring.grouping.mypage.service.MypageService;

/**
 * 유저 컨트롤러 : 마이페이지 화면, 사용자 정보 수정 화면, 사용자 정보 수정 Ajax
 */
@Controller
@RequestMapping(value = "/mypage")
public class MypageController {

	@Autowired
	MypageService service;

	/**
	 * 마이페이지 화면
	 * 
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/mypageView.do")
	public String myPageView() throws Exception{
		return "/mypage/mypageView";
	}

	/**
	 * 사용자 정보 수정 화면
	 * 
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/modifyUserInfoView.do")
	public ModelAndView modifyUserInfoView(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		UserVO user = service.selectUserInfo((String) session.getAttribute("user_id"));
		mv.addObject("user", user);
		mv.setViewName("/mypage/modifyUserInfo");
		return mv;
	}

	/**
	 * 사용자 정보 수정 Ajax
	 */
	@RequestMapping(value = "/modifyUserInfo.do")
	@ResponseBody
	public int modifyUserInfo(UserVO user, HttpSession session) throws Exception{
		user.setUser_id((String) session.getAttribute("user_id"));
		service.updateUserInfo(user);
		if (service.updateUserInfo(user) != 0) {
			session.setAttribute("user_name", user.getUser_name());
			return 1;
		} else
			return 0;
	}

}
