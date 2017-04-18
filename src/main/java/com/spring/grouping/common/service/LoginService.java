package com.spring.grouping.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.grouping.common.mapper.LoginMapper;
import com.spring.grouping.user.domain.UserVO;



@Service
public class LoginService {
	@Autowired
	private LoginMapper loginMapper;
	
	
	
	/**
	 * 유저 로그인
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String userLogin(UserVO user)throws Exception {
		return loginMapper.userLogin(user);
	};
	
	public int userInsert(UserVO user)throws Exception {
		System.out.println(user.getUserId()+user.getPassword()+user.getUsername()+user.getEmail());
		return loginMapper.userInsert(user);
	}
	
	
	
}
