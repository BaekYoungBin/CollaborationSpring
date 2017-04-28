package com.spring.grouping.group.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.spring.grouping.group.domain.GroupVO;
import com.spring.grouping.group.mapper.GroupMapper;

@Transactional
@Service
public class GroupService {
	private static final Exception Exception = null;
	@Autowired
	private GroupMapper groupMapper;
	
	
	public int groupInsert(GroupVO group, HttpSession session) throws Exception {
		group.setGrp_leader_id((String) session.getAttribute("user_id"));
		group.setGrp_reg_user_id((String) session.getAttribute("user_id"));
		groupMapper.groupInsert(group);
		System.out.println(group.getSeq_grp_number());	
		Map<String, Object> map = new HashMap<>();
		map.put("groupNum", group.getSeq_grp_number());
		map.put("user_id", (String) session.getAttribute("user_id"));
		return groupMapper.groupInUserInsert(map);
	}
	public List<GroupVO> selectGroupList(String user_id){
		return groupMapper.selectGroupList(user_id);
		
	}
	public List<GroupVO> selectNewestGroupList(String user_id){
		System.out.println("세션 아이디는 : "+user_id);

		return groupMapper.selectNewestGroupList(user_id);
		
	}
	public List<GroupVO> selectFavoriteGroupList(String user_id){
		return groupMapper.selectFavoriteGroupList(user_id);	
	
}

	

	
	
	@Transactional(propagation=Propagation.REQUIRED)
	public int updateFavoriteGroupList(String seq_grp_number, HttpSession session){
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("seq_grp_number", seq_grp_number);
			map.put("user_id", (String)session.getAttribute("user_id"));
			
			groupMapper.updateFavoriteGroupList(map);
			if(groupMapper.selectFavoriteGroupListCnt(map) > 5)
			{
				System.out.println("다섯개 이상입니다.");
				throw Exception;
			}
			else
				return 1;
			
		} catch (Exception e) {
			System.out.println("이셉션처리해야지요");
			e.printStackTrace();
			 TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return 0;
		} 	
		
	}
	public int updateNewestGroupList(String seq_grp_number, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		map.put("seq_grp_number", seq_grp_number);
		map.put("user_id", (String)session.getAttribute("user_id"));
		
		return groupMapper.updateNewestGroupList(map);
	}
	public int deleteGroup(String seq_grp_number, HttpSession session) {
		// TODO Auto-generated method stub
		Map <String, Object> map = new HashMap<String, Object>();
		map.put("user_id", (String)session.getAttribute("user_id"));
		map.put("seq_grp_number", seq_grp_number);
		return groupMapper.deleteGroup(map);
	}
	public int outGroup(String seq_grp_number, HttpSession session) {
		// TODO Auto-generated method stub
		Map <String, Object> map = new HashMap<String, Object>();
		map.put("user_id", (String)session.getAttribute("user_id"));
		map.put("seq_grp_number", seq_grp_number);
		return groupMapper.outGroup(map);
	}
	
	
}
