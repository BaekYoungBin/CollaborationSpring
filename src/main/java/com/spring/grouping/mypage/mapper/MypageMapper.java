package com.spring.grouping.mypage.mapper;

import com.spring.grouping.mypage.domain.UserVO;

public interface MypageMapper {
	public int updateUserInfo(UserVO user);
	public UserVO selectUserInfo(String user_id);
	public String selectUserName(String user_id);
}
