package com.spring.grouping.common.controller;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.spring.grouping.common.domain.Constants;
import com.spring.grouping.common.service.LoginService;
import com.spring.grouping.mypage.domain.UserVO;

/**
 * 로그인 컨트롤러 : 로그인 화면, 로그인, 회원 가입 화면, 회원가입, 비밀번호 찾기 화면, 비밀번호 찾기
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController {
	@Autowired
	LoginService service;

	/**
	 * 로그인 화면
	 * @return
	 */
	@RequestMapping(value = "/loginView.do")
	public String loginView() throws Exception{
		return "/login/loginView";
	}

	/**
	 * 로그인
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/excuteLogin.do")
	public String excuteLogin(HttpSession session, UserVO user) throws Exception {
		String user_name = service.userLogin(user);
		if (user_name != null) {
			session.setAttribute("Auth", Constants.LOGIN_TRUE);
			session.setAttribute("user_id", user.getUser_id());
			session.setAttribute("user_name", user_name);
			return "redirect:../lobby/lobbyView.do";
		} else {
			session.invalidate();
			return "login/loginView";
		}

	}
	
	/**
	 * 회원 아이디 중복
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/checkId.do")
	@ResponseBody
	public String checkId(String user_id) throws Exception {
	
		if(service.checkId(user_id) == 1){
			return "false";
		}
		else
		{
			return "true";
		}
		
	}
	
	/**
	 * 회원가입 화면
	 * @return
	 */
	@RequestMapping(value = "/registerUserView.do")
	public String registerUserView() throws Exception{
		return "/login/registerUserView";
	}

	/**
	 * 회원 가입
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/insertUser.do")
	public String insertUser(UserVO user) throws Exception {
		service.insertUser(user);
		return "/login/loginView";
	}

	/**
	 * 비밀번호 찾기화면
	 * @return
	 */
	@RequestMapping(value = "/findPasswordView.do")
	public String findPasswordView() throws Exception{
		return "login/findPasswordView";
	}

	/**
	 * 비밀번호 찾기
	 * @return UserVO
	 */
	@RequestMapping(value = "/findPwd.do")
	@ResponseBody
	public UserVO findPwd(String user_email) throws Exception{
		return service.selectUserPwd(user_email);
	}
}
