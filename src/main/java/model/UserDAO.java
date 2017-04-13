package model;

import java.util.ArrayList;
import java.util.List;



public interface UserDAO {

	String ID_Confirm(String user_id);
	int userInsert(UserDTO user);
	UserDTO userLogin(UserDTO user);
	List<ProjectVO> ProjectView();
	List<PostVO> PostView();
	int Post_Write(PostVO pv);
	String getProjectName(String project_id);
	
	
	
	
	
	
	
	
	
}





