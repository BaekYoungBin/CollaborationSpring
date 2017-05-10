package com.spring.grouping.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.spring.grouping.group.service.GroupService;

/**
 * 메인 컨트롤러 : 메인 화면
 */
@Controller
@RequestMapping(value = "/main")
public class MainController {


	@Autowired
	GroupService service;

	/**
	 * 메인 화면
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/mainView.do")
	public ModelAndView mainView(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main/mainView");
		mv.addObject("user_id", (String) session.getAttribute("user_id"));
		mv.addObject("user_name", (String) session.getAttribute("user_name"));
		mv.addObject("grp_title", service.selectGroupTitle((String) session.getAttribute("seq_grp_number")));
		return mv;
	}

}
