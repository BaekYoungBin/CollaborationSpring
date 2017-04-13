package model;

import java.sql.Date;

public class PostVO {


	int post_id;
	String post_subject;
	String user_id;
	Date date;
	int hits;
	String post_detail;
	String name;
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public String getPost_subject() {
		return post_subject;
	}
	public void setPost_subject(String post_subject) {
		this.post_subject = post_subject;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getPost_detail() {
		return post_detail;
	}
	public void setPost_detail(String post_detail) {
		this.post_detail = post_detail;
	}
	public String getName() {
		return name;
	}
	public void setName(String user_name) {
		this.name = user_name;
	}
	public PostVO(int post_id, String post_subject, String user_id, Date date, int hits, String post_detail,
			String name) {

		this.post_id = post_id;
		this.post_subject = post_subject;
		this.user_id = user_id;
		this.date = date;
		this.hits = hits;
		this.post_detail = post_detail;
		this.name = name;
	}
	public PostVO(String post_subject, String user_id, String post_detail, String name) {
		this.post_subject = post_subject;
		this.user_id = user_id;
		this.post_detail = post_detail;
		this.name = name;
	}
	public PostVO() {
		// TODO Auto-generated constructor stub
	}

	
}
