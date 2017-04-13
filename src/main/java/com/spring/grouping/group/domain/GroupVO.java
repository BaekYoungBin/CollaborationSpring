package com.spring.grouping.group.domain;

public class GroupVO {

	private int project_id;
 	private String project_name;
 	private String project_detail;
 	
 	
 	
	public GroupVO() {

	}
	public int getProject_id() {
		return project_id;
	}
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public String getProject_detail() {
		return project_detail;
	}
	public void setProject_detail(String project_detail) {
		this.project_detail = project_detail;
	}
	public GroupVO(int project_id, String project_name, String project_detail) {

		this.project_id = project_id;
		this.project_name = project_name;
		this.project_detail = project_detail;
	}
	public GroupVO(String project_name, String project_detail) {

		this.project_name = project_name;
		this.project_detail = project_detail;
	}
}
