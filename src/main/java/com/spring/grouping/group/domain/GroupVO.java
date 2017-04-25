package com.spring.grouping.group.domain;

import java.sql.Date;



public class GroupVO {

	private int seq_grp_number;
	private String grp_title;
	private String grp_content;
	private String favorite_yn;
	private String grp_leader_id;
	private Date reg_dt;
	private String reg_user_name;
	private Date udt_dt;
	private String udt_user_name;
	
	public int getseq_grp_number(){
		return seq_grp_number;
	}
	public void setseq_grp_number(int seq_grp_number){
		this.seq_grp_number = seq_grp_number;
	}
	public String getGrp_title() {
		return grp_title;
	}
	public void setGrp_title(String grp_title) {
		this.grp_title = grp_title;
	}
	public String getGrp_content() {
		return grp_content;
	}
	public void setGrp_content(String grp_content) {
		this.grp_content = grp_content;
	}
	public String getFavorite_yn() {
		return favorite_yn;
	}
	public void setFavorite_yn(String favorite_yn) {
		this.favorite_yn = favorite_yn;
	}
	public String getGrp_leader_id() {
		return grp_leader_id;
	}
	public void setGrp_leader_id(String grp_leader_id) {
		this.grp_leader_id = grp_leader_id;
	}
	public Date getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getReg_user_name() {
		return reg_user_name;
	}
	public void setReg_user_name(String reg_user_name) {
		this.reg_user_name = reg_user_name;
	}
	public Date getUdt_dt() {
		return udt_dt;
	}
	public void setUdt_dt(Date udt_dt) {
		this.udt_dt = udt_dt;
	}
	public String getUdt_user_name() {
		return udt_user_name;
	}
	public void setUdt_user_name(String udt_user_name) {
		this.udt_user_name = udt_user_name;
	}
	
	public GroupVO(String grp_title, String grp_content){
		this.seq_grp_number = 0;
		this.grp_title = grp_title;
		this.grp_content = grp_content;
		this.favorite_yn = null;
		this.grp_leader_id = null;
		this.reg_dt = null;
		this.reg_user_name = null;
		this.udt_dt = null;
		this.udt_user_name = null;
	}
	public GroupVO(){
		
	}
	
	
}
