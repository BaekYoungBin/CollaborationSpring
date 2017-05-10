package com.spring.grouping.common.mapper;

import com.spring.grouping.mypage.domain.UserVO;

public interface LoginMapper {
	String confirmUserIdDuplicate(String id) throws Exception;
	
	int insertUser(UserVO user) throws Exception;
	String userLogin(UserVO user) throws Exception;
	UserVO selectUserPwd(String user_email);

	int checkId(String user_id);
}
