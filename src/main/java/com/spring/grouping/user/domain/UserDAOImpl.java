package com.spring.grouping.user.domain;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.grouping.board.domain.BoardVO;
import com.spring.grouping.group.domain.GroupVO;

@Repository("dao")
public class UserDAOImpl implements UserDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = null;

	@Autowired
	DataSource MySQLdataSource;
	
	@Override
	public String ID_Confirm(String user_id) {
		// TODO Auto-generated method stub
		sql = "select * from user where user_id = ?";
		try {
			conn = MySQLdataSource.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_id);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			} else

				return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	@Override
	public int userInsert(UserDTO user) {
		// TODO Auto-generated method stub
		int count = 0;
		String sql = "insert into user" + "(user_id, name, password) " + "values(?,?,?)";

		try {
			conn = MySQLdataSource.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUser_id());
			ps.setString(2, user.getName());
			ps.setString(3, user.getPassword());
			count = ps.executeUpdate();
			/*
			 * PreparedStatementŬ������ ����޼��� ��ȣ �ȿ��� ������ �� ����.
			 * executeUpdate(���ڰ�) : INSERT, UPDATE, DELETE�� ���� �� ���� =
			 * �̰Ž� StatementŬ������ ������
			 */
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}


	@Override
	public UserDTO userLogin(UserDTO user) {
		sql = "select * from user where user_id = ? && password = ?";

		UserDTO u = new UserDTO();
		try {
			conn = MySQLdataSource.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUser_id());
			ps.setString(2, user.getPassword());
			rs = ps.executeQuery();
			
		if(rs.next()){
			u.setUser_id(rs.getString(1));
			u.setName(rs.getString(2));
			u.setPassword(rs.getString(3));
		}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}

	@Override
	public ArrayList<GroupVO> ProjectView() {
		// TODO Auto-generated method stub

		ArrayList<GroupVO> pv = new ArrayList<GroupVO>();
		
		sql = "select * from project";
		
		try {
			conn = MySQLdataSource.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				pv.add(new GroupVO(rs.getInt(1), rs.getString(2), rs.getString(3)));			
			}
			System.out.println(pv.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pv;
		
		
		
	}

	@Override
	public ArrayList<BoardVO> PostView() {
		ArrayList<BoardVO> pv = new ArrayList<BoardVO>();
		sql = "select * from post order by post_id desc";
		
		try {
			conn = MySQLdataSource.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()){
				pv.add(new BoardVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getString(7)));			
			}
			System.out.println(pv.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pv;
	}

	@SuppressWarnings("null")
	@Override
	public int Post_Write(BoardVO pv) {
		// TODO Auto-generated method stub
		int count = 0;
		HttpSession s = null;
		String sql = "insert into post" + "(post_subject, user_id, date, post_detail, name) " + "values(?,?,curdate(),?,?)";

		try {
			conn = MySQLdataSource.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, pv.getPost_subject());
			ps.setString(2, (String) s.getAttribute("user_id"));
			
			ps.setString(3, pv.getPost_detail());
			ps.setString(4,(String) s.getAttribute("name"));
			count = ps.executeUpdate();
			/*
			 * PreparedStatementŬ������ ����޼��� ��ȣ �ȿ��� ������ �� ����.
			 * executeUpdate(���ڰ�) : INSERT, UPDATE, DELETE�� ���� �� ���� =
			 * �̰Ž� StatementŬ������ ������
			 */
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public String getProjectName(String project_id) {
		// TODO Auto-generated method stub
		
		sql = "select project_name  from project where project_id = ?";
		
			try {
				conn = MySQLdataSource.getConnection();
				ps = conn.prepareStatement(sql);
				ps.setString(1,project_id);
				rs = ps.executeQuery();
				if (rs.next()) {
					return rs.getString(1);
				} else
					return null;
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		
		return null;
	}
}
