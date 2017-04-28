package com.spring.grouping.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.grouping.user.domain.UserVO;
import com.spring.grouping.user.mapper.UserMapper;

@Service
public class UserService{

	@Autowired
	private UserMapper userMapper;


	public int updateUserInfo(UserVO user) {
		// TODO Auto-generated method stub
		System.out.println(user.getUser_name());
		System.out.println(user.getUser_id());
		return userMapper.updateUserInfo(user);
	}
	public UserVO selectUserInfo(String user_id){
		return userMapper.selectUserInfo(user_id);
	}
	
}
