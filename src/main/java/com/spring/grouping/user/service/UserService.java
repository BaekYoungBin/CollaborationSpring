package com.spring.grouping.user.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.grouping.board.domain.BoardVO;
import com.spring.grouping.group.domain.GroupVO;
import com.spring.grouping.user.domain.UserVO;

@Service("service")
public class UserService{


	@Autowired
	SqlSession sqlsession;


	public String ID_Confirm(String user_id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("iD_Confirm", user_id);
	}

	public int userInsert(UserVO user) {
		// TODO Auto-generated method stub
		return sqlsession.insert("userInsert", user);	
		}

	public String userLogin(UserVO user) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("userLogin", user);
	}

	public List<GroupVO> ProjectView() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("projectView");
	}

	public List<BoardVO> PostView() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("postView");
	}

	public int Post_Write(BoardVO pv) {
		// TODO Auto-generated method stub
		return sqlsession.insert("post_Write", pv);
	}

	public String getProjectName(String project_id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("getProjectName", project_id);
	}

	public BoardVO Post_Detail(String post_id) {
		System.out.println(post_id);
		// TODO Auto-generated method stub
		return sqlsession.selectOne("post_Detail", post_id);
	}

	public int Post_count(String post_id) {
		// TODO Auto-generated method stub
		
		return sqlsession.update("post_count", post_id);
	}

	public int Post_Modify(BoardVO pv) {
		// TODO Auto-generated method stub
		return sqlsession.update("post_Modify", pv);
	}

	public int Post_Delete(String post_id) {
		// TODO Auto-generated method stub
		return sqlsession.delete("post_Delete", post_id);
	}

	public int Project_Add(GroupVO pv) {
		// TODO Auto-generated method stub
		return sqlsession.insert("project_Add", pv);
	}
	
	
}
