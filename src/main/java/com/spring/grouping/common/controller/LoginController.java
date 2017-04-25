package com.spring.grouping.common.controller;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.grouping.common.domain.Constants;
import com.spring.grouping.common.service.LoginService;
import com.spring.grouping.user.domain.UserVO;
/**
 * 로그인 컨트롤러
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController{
	@Autowired
	LoginService service;
    /**
     * 로그인 폼
     * @return
     */
    @RequestMapping(value = "/loginView.do")
    public String loginForm(){
    	/*만약 세션이있으면 프로젝트로가도록하기*/
        return "/login/loginView";
    }
    
    /**
	 * 회원가입 폼
	 * 	@return
	 */  
    @RequestMapping(value = "/registerForm.do")
	public String registerForm(){	 	
    	return "/login/registerView";	
	}
    
    
    
    @RequestMapping(value = "/register.do")
  	public String register(UserVO user) throws Exception{	
    	System.out.println("등록폼에 왔습니다.");
    	System.out.println(user.getUsername());
    	int add = service.userInsert(user);
    	System.out.println(add);
      	return "/login/loginView";	
  	}
    /**
	 * 비밀번호 찾기 폼
	 * 	@return
	 */  
    @RequestMapping(value = "/passwordFindForm.do")
  	public String passwordFind(){	
    	
      	return "/login/passwordFindForm";
  	}
   
    /**
     * 로그인 요청
     * @param session
     * @param user
     * @return
     * @throws Exception
     */
	@RequestMapping(value = "/signIn.do")
	public String signIn(HttpSession session, UserVO user, HttpServletResponse response) throws Exception {	
		String LoginChk = service.userLogin(user);
		System.out.println("로그인체크"+LoginChk);	
		if(LoginChk != null){
			session.setAttribute("Auth", Constants.LOGIN_TRUE);
			session.setAttribute("userId", user.getUserId());
			session.setAttribute("userName", user.getUsername());
			return "redirect:../lobby/lobbyView.do";
		}
		else{
			session.invalidate();
		return "login/loginView";
		}
		
	}

	
}
