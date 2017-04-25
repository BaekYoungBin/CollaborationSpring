package com.spring.grouping.board.domain;

import java.sql.Date;

public class BoardVO {


	int SEQ_BOARD_NUMBER;	
	String board_title;
	String board_content;
	String board_Reg_dt;
	String board_reg_user_id;
	String board_Reg_user_name;
	String board_udt_dt;
	String board_udt_user_id;
	public int getSEQ_BOARD_NUMBER() {
		return SEQ_BOARD_NUMBER;
	}
	public void setSEQ_BOARD_NUMBER(int SEQ_BOARD_NUMBER) {
		SEQ_BOARD_NUMBER = SEQ_BOARD_NUMBER;
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
	public String getBoard_Reg_dt() {
		return board_Reg_dt;
	}
	public void setBoard_Reg_dt(String board_Reg_dt) {
		this.board_Reg_dt = board_Reg_dt;
	}
	public String getBoard_reg_user_id() {
		return board_reg_user_id;
	}
	public void setBoard_reg_user_id(String board_reg_user_id) {
		this.board_reg_user_id = board_reg_user_id;
	}
	public String getBoard_Reg_user_name() {
		return board_Reg_user_name;
	}
	public void setBoard_Reg_user_name(String board_Reg_user_name) {
		this.board_Reg_user_name = board_Reg_user_name;
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
