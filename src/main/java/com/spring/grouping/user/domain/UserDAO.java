package com.spring.grouping.user.domain;

import java.util.ArrayList;
import java.util.List;

import com.spring.grouping.board.domain.BoardVO;
import com.spring.grouping.group.domain.GroupVO;



public interface UserDAO {

	String ID_Confirm(String user_id);
	int userInsert(UserDTO user);
	UserDTO userLogin(UserDTO user);
	List<GroupVO> ProjectView();
	List<BoardVO> PostView();
	int Post_Write(BoardVO pv);
	String getProjectName(String project_id);
	
	
	
	
	
	
	
	
	
}





