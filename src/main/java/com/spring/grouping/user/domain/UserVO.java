package com.spring.grouping.user.domain;

public class UserVO {

	String user_id;
	String user_name;
	String user_pwd;
	String user_email;
	String reg_dt;
	String reg_user_id;
	String udt_dt;
	String udt_user_id;
	public UserVO(){
		
	}
	public UserVO(String user_id, String user_name) {
		// TODO Auto-generated constructor stub
		this.user_id = user_id;
		this.user_name = user_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getReg_user_id() {
		return reg_user_id;
	}
	public void setReg_user_id(String reg_user_id) {
		this.reg_user_id = reg_user_id;
	}
	public String getUdt_dt() {
		return udt_dt;
	}
	public void setUdt_dt(String udt_dt) {
		this.udt_dt = udt_dt;
	}
	public String getUdt_user_id() {
		return udt_user_id;
	}
	public void setUdt_user_id(String udt_user_id) {
		this.udt_user_id = udt_user_id;
	}

	
}
