package com.spring.grouping.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.grouping.mypage.domain.UserVO;
import com.spring.grouping.mypage.mapper.MypageMapper;

@Service
public class MypageService{

	@Autowired
	private MypageMapper userMapper;

	/**
	 * 유저 정보 수정
	 * @return
	 */
	public int updateUserInfo(UserVO user) {
		// TODO Auto-generated method stub
		System.out.println(user.getUser_name());
		System.out.println(user.getUser_id());
		return userMapper.updateUserInfo(user);
	}
	/**
	 * 유저 정보 조회
	 * @return UserVO
	 */
	public UserVO selectUserInfo(String user_id){
		return userMapper.selectUserInfo(user_id);
	}
	
	/**
	 * 유저 이름 조회
	 * @return String
	 */
	public String selectUserName(String user_id){
		return userMapper.selectUserName(user_id);
	}
	
}
