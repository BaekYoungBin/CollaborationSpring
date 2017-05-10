package com.spring.grouping.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.grouping.common.mapper.LoginMapper;
import com.spring.grouping.mypage.domain.UserVO;



@Service
public class LoginService {
	@Autowired
	private LoginMapper loginMapper;
	
	/**
	 * 유저 로그인
	 * @return String
	 * @throws Exception
	 */
	public String userLogin(UserVO user)throws Exception {
		return loginMapper.userLogin(user);
	};
	
	/**
	 * 유저 등록
	 * @return
	 * @throws Exception
	 */
	public int insertUser(UserVO user)throws Exception {
		return loginMapper.insertUser(user);
	}

	/**
	 * 유저 비밀번호 찾기
	 * @return UserVO
	 * @throws Exception
	 */
	public UserVO selectUserPwd(String user_email) {
		return loginMapper.selectUserPwd(user_email);
	}

	public int checkId(String user_id) {
		// TODO Auto-generated method stub
		return loginMapper.checkId(user_id);
	}
	
	
	
}
