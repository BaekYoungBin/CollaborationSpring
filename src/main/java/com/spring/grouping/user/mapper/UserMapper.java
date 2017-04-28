package com.spring.grouping.user.mapper;

import com.spring.grouping.user.domain.UserVO;

public interface UserMapper {

	public int updateUserInfo(UserVO user);

	public UserVO selectUserInfo(String user_id);
}
