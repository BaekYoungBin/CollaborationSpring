package model;

import java.util.ArrayList;
import java.util.List;


public interface UserService {

	String ID_Confirm(String user_id);
	int userInsert(UserDTO user);
	UserDTO userLogin(UserDTO user);
	List<ProjectVO> ProjectView();
	List<PostVO> PostView();
	int Post_Write(PostVO pv);
	String getProjectName(String project_id);
	PostVO Post_Detail(String post_id);
	int Post_count(String post_id);
	int Post_Modify(PostVO pv);
	int Post_Delete(String post_id);
	int Project_Add(ProjectVO pv);
}
