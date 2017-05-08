package com.spring.grouping.calendar.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import com.spring.grouping.group.service.GroupService;

@Controller
@RequestMapping(value = "/calendar")
public class CalendarController {
		
	
	
	   @RequestMapping(value = "/calendarView.do")
	    public String calendarView(HttpSession session){	   
		  
	        return "main/calendar";
	   }   
	   
	  
}
