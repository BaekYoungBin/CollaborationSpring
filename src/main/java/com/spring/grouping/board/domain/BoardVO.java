package com.spring.grouping.board.domain;

import java.sql.Date;

public class BoardVO {

	int seq_board_number;	
	String board_title;
	String board_content;
	String board_reg_dt;
	String board_reg_user_id;
	String board_reg_user_name;
	String board_udt_dt;
	String board_udt_user_id;
	public int getSeq_board_number() {
		return seq_board_number;
	}

	public void setSeq_board_number(int seq_board_number) {
		this.seq_board_number = seq_board_number;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_reg_dt() {
		return board_reg_dt;
	}

	public void setBoard_reg_dt(String board_reg_dt) {

		this.board_reg_dt = board_reg_dt;
	}

	public String getBoard_reg_user_id() {
		return board_reg_user_id;
	}

	public void setBoard_reg_user_id(String board_reg_user_id) {
		this.board_reg_user_id = board_reg_user_id;
	}

	public String getBoard_reg_user_name() {
		return board_reg_user_name;
	}

	public void setBoard_reg_user_name(String board_reg_user_name) {
		this.board_reg_user_name = board_reg_user_name;
	}

	public String getBoard_udt_dt() {
		return board_udt_dt;
	}

	public void setBoard_udt_dt(String board_udt_dt) {
		this.board_udt_dt = board_udt_dt;
	}

	public String getBoard_udt_user_id() {
		return board_udt_user_id;
	}

	public void setBoard_udt_user_id(String board_udt_user_id) {
		this.board_udt_user_id = board_udt_user_id;
	}

	

	public BoardVO(){};
}
