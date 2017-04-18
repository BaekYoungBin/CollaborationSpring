package com.spring.grouping.group.controller;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.spring.grouping.common.service.LoginService;
/**
 * 그룹 컨트롤러
 */
@Controller
@RequestMapping(value="/group")
public class GroupController{
	@Autowired
	LoginService service;

	   @RequestMapping(value = "/groupView.do")
	  	public String groupView(){	
		   System.out.println("들어와따");
	      	return "/Group/group";
	  	}

}
