package com.spring.grouping.common.mapper;

import com.spring.grouping.user.domain.UserVO;

public interface LoginMapper {
	String confirmUserIdDuplicate(String id) throws Exception;
	int userInsert(UserVO user) throws Exception;
	String userLogin(UserVO user) throws Exception;
	UserVO passwordFind(String user_email);
}
