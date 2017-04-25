package com.spring.grouping.group.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.grouping.group.domain.GroupVO;
import com.spring.grouping.group.service.GroupService;

/**
 * 그룹 컨트롤러
 */
@Controller
@RequestMapping(value = "/group")
public class GroupController {
	@Autowired
	GroupService service;

	@RequestMapping(value = "/groupView.do")
	public ModelAndView groupView() {
		System.out.println("들어와따");
		ModelAndView mv = new ModelAndView();

		mv.addObject("favoriteGroup", service.selectFavoriteGroup());
		mv.addObject("newstGroup", service.selectNewestGroup());
		mv.setViewName("/group/groupView");
		return mv;
	}

	@RequestMapping(value = "/groupRegister.do")
	public String groupRegister(GroupVO group, HttpSession session) {

		try {
			service.groupInsert(group, session);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/lobby/lobbyView";
	}
}
