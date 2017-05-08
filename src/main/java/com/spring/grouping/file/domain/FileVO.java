package com.spring.grouping.file.domain;

public class FileVO {
	int seq_file_number;
	int seq_grp_number;
	String file_title;
	String file_content;
	String file_path;
	String file_reg_dt;
	String file_reg_user_id;
	String file_udt_dt;
	String file_udt_user_id;
	String file_reg_user_name;
	public String getFile_reg_user_name() {
		return file_reg_user_name;
	}

	public void setFile_reg_user_name(String file_reg_user_name) {
		this.file_reg_user_name = file_reg_user_name;
	}

	String file_name;
	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public int getSeq_file_number() {
		return seq_file_number;
	}

	public void setSeq_file_number(int seq_file_number) {
		this.seq_file_number = seq_file_number;
	}

	public int getSeq_grp_number() {
		return seq_grp_number;
	}

	public void setSeq_grp_number(int seq_grp_number) {
		this.seq_grp_number = seq_grp_number;
	}

	public String getFile_title() {
		return file_title;
	}

	public void setFile_title(String file_title) {
		this.file_title = file_title;
	}

	public String getFile_content() {
		return file_content;
	}

	public void setFile_content(String file_content) {
		this.file_content = file_content;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getFile_reg_dt() {
		return file_reg_dt;
	}

	public void setFile_reg_dt(String file_reg_dt) {
		this.file_reg_dt = file_reg_dt;
	}

	public String getFile_reg_user_id() {
		return file_reg_user_id;
	}

	public void setFile_reg_user_id(String file_reg_user_id) {
		this.file_reg_user_id = file_reg_user_id;
	}

	public String getFile_udt_dt() {
		return file_udt_dt;
	}

	public void setFile_udt_dt(String file_udt_dt) {
		this.file_udt_dt = file_udt_dt;
	}

	public String getFile_udt_user_id() {
		return file_udt_user_id;
	}

	public void setFile_udt_user_id(String file_udt_user_id) {
		this.file_udt_user_id = file_udt_user_id;
	}

	public FileVO(){};
}
