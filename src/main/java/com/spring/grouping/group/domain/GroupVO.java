package com.spring.grouping.group.domain;

import java.sql.Date;



public class GroupVO {

	private int seq_grp_number;
	private String grp_title;
	private String grp_content;
	private String grp_favorite_yn;
	private String grp_leader_id;
	private Date grp_reg_dt;
	private String grp_reg_user_id;
	private Date grp_udt_dt;
	private String grp_udt_user_id;
	

	public int getSeq_grp_number() {
		return seq_grp_number;
	}
	public void setSeq_grp_number(int seq_grp_number) {
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
	public String getGrp_favorite_yn() {
		return grp_favorite_yn;
	}
	public void setGrp_favorite_yn(String grp_favorite_yn) {
		this.grp_favorite_yn = grp_favorite_yn;
	}
	public String getGrp_leader_id() {
		return grp_leader_id;
	}
	public void setGrp_leader_id(String grp_leader_id) {
		this.grp_leader_id = grp_leader_id;
	}
	public Date getGrp_reg_dt() {
		return grp_reg_dt;
	}
	public void setGrp_reg_dt(Date grp_reg_dt) {
		this.grp_reg_dt = grp_reg_dt;
	}
	public String getGrp_reg_user_id() {
		return grp_reg_user_id;
	}
	public void setGrp_reg_user_id(String grp_reg_user_id) {
		this.grp_reg_user_id = grp_reg_user_id;
	}
	public Date getGrp_udt_dt() {
		return grp_udt_dt;
	}
	public void setGrp_udt_dt(Date grp_udt_dt) {
		this.grp_udt_dt = grp_udt_dt;
	}
	public String getGrp_udt_user_id() {
		return grp_udt_user_id;
	}
	public void setGrp_udt_user_id(String grp_udt_user_id) {
		this.grp_udt_user_id = grp_udt_user_id;
	}
	public GroupVO(String grp_title, String grp_content){
		this.seq_grp_number = 0;
		this.grp_title = grp_title;
		this.grp_content = grp_content;
		this.grp_favorite_yn = null;
		this.grp_leader_id = null;
		this.grp_reg_dt = null;
		this.grp_reg_user_id = null;
		this.grp_udt_dt = null;
		this.grp_udt_user_id = null;
	}
	public GroupVO(){
		
	}
	
	
}
