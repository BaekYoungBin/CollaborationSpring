package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("service")
public class UserServiceImpl implements UserService{


	@Autowired
	SqlSession sqlsession;


	@Override
	public String ID_Confirm(String user_id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("iD_Confirm", user_id);
	}

	@Override
	public int userInsert(UserDTO user) {
		// TODO Auto-generated method stub
		return sqlsession.insert("userInsert", user);	
		}

	@Override
	public UserDTO userLogin(UserDTO user) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("userLogin", user);
	}

	@Override
	public List<ProjectVO> ProjectView() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("projectView");
	}

	@Override
	public List<PostVO> PostView() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("postView");
	}

	@Override
	public int Post_Write(PostVO pv) {
		// TODO Auto-generated method stub
		return sqlsession.insert("post_Write", pv);
	}

	@Override
	public String getProjectName(String project_id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("getProjectName", project_id);
	}

	@Override
	public PostVO Post_Detail(String post_id) {
		System.out.println(post_id);
		// TODO Auto-generated method stub
		return sqlsession.selectOne("post_Detail", post_id);
	}

	@Override
	public int Post_count(String post_id) {
		// TODO Auto-generated method stub
		
		return sqlsession.update("post_count", post_id);
	}

	@Override
	public int Post_Modify(PostVO pv) {
		// TODO Auto-generated method stub
		return sqlsession.update("post_Modify", pv);
	}

	@Override
	public int Post_Delete(String post_id) {
		// TODO Auto-generated method stub
		return sqlsession.delete("post_Delete", post_id);
	}

	@Override
	public int Project_Add(ProjectVO pv) {
		// TODO Auto-generated method stub
		return sqlsession.insert("project_Add", pv);
	}
	
	
}
