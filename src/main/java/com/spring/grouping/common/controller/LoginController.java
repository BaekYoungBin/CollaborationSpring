package com.spring.grouping.common.controller;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    	System.out.println(user.getUser_name());
    	int add = service.userInsert(user);
    	System.out.println(add);
      	return "/login/loginView";	
  	}
    /**
	 * 비밀번호 찾기 폼
	 * 	@return
	 */  
    @RequestMapping(value = "/passwordFindForm.do")
  	public String passwordFindForm(String user_email){	
      	return "login/passwordFindForm";
  	}
    @RequestMapping(value = "/passwordFind.do")
    @ResponseBody
  	public UserVO passwordFind(String user_email){	
      	return service.passwordFind(user_email);
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
		System.out.println(user.getUser_id());
		System.out.println(user.getUser_pwd());
		String user_name = service.userLogin(user);
		System.out.println(user_name);
		if(user_name != null){
			session.setAttribute("Auth", Constants.LOGIN_TRUE);
			session.setAttribute("user_id", user.getUser_id());
			session.setAttribute("user_name", user_name);
			return "redirect:../lobby/lobbyView.do";
		}
		else{
			session.invalidate();
		return "login/loginView";
		}
		
	}

	
}
