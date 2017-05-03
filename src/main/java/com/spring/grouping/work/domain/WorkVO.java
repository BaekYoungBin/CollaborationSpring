package com.spring.grouping.work.domain;

import java.sql.Date;

public class WorkVO {
	String seq_work_number;
	String seq_grp_number;
	String work_subject;
	String work_content;
	Date work_start_date;
	Date work_end_date;
	String work_user_id;
	String work_user_name;
	String work_category;
	public String getWork_category() {
		return work_category;
	}
	public void setWork_category(String work_category) {
		this.work_category = work_category;
	}
	public String getSeq_work_number() {
		return seq_work_number;
	}
	public void setSeq_work_number(String seq_work_number) {
		this.seq_work_number = seq_work_number;
	}
	public String getSeq_grp_number() {
		return seq_grp_number;
	}
	public void setSeq_grp_number(String seq_grp_number) {
		this.seq_grp_number = seq_grp_number;
	}
	public String getWork_subject() {
		return work_subject;
	}
	public void setWork_subject(String work_subject) {
		this.work_subject = work_subject;
	}
	public String getWork_content() {
		return work_content;
	}
	public void setWork_content(String work_content) {
		this.work_content = work_content;
	}
	public Date getWork_start_date() {
		return work_start_date;
	}
	public void setWork_start_date(Date work_start_date) {
		this.work_start_date = work_start_date;
	}
	public Date getWork_end_date() {
		return work_end_date;
	}
	public void setWork_end_date(Date work_end_date) {
		this.work_end_date = work_end_date;
	}
	public String getWork_user_id() {
		return work_user_id;
	}
	public void setWork_user_id(String work_user_id) {
		this.work_user_id = work_user_id;
	}
	public String getWork_user_name() {
		return work_user_name;
	}
	public void setWork_user_name(String work_user_name) {
		this.work_user_name = work_user_name;
	}

	
	
}
