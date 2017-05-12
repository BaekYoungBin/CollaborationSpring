package com.spring.grouping.common.controller;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 로비 컨트롤러 : 로비화면
 */
@Controller
@RequestMapping(value = "/lobby")
public class LobbyController {

	/**
	 * 로비 화면 뷰
	 * @return ModelAndView
	 */
   @RequestMapping(value = "/lobbyView.do")
    public ModelAndView lobbyView(HttpSession session) throws Exception{
	   ModelAndView mv = new ModelAndView();
	   mv.setViewName("/lobby/lobbyView");
	   mv.addObject("user_id", (String) session.getAttribute("user_id"));
	   mv.addObject("user_name", (String) session.getAttribute("user_name"));
	   session.setAttribute("seq_grp_number", null);
       return mv;
   }   	  
}
