package com.spring.grouping.work.controller;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/calendar")
public class CalendarController {
	
		/**
		 * 달력 화면 뷰
		 */
	   @RequestMapping(value = "/calendarView.do")
	    public String calendarView(HttpSession session){	   	  
	        return "main/calendarView";
	   }   	  
}
