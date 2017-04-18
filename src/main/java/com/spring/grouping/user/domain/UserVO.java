package com.spring.grouping.user.domain;

public class UserVO {

	String userId;
	String username;
	String password;
	String email;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public UserVO(String userId, String username, String password, String email) {
		this.userId = userId;
		this.email = email;
		this.username = username;
		this.password = password;
	}
	public UserVO(String userId, String password) {
		this.userId = userId;
		this.username = null;
		this.password = password;
		this.email=null;
	}
	public UserVO() {

	}
	
	
}
