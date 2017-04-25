package com.spring.grouping.group.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.grouping.group.domain.GroupVO;
import com.spring.grouping.group.mapper.GroupMapper;


@Service
public class GroupService {
	@Autowired
	private GroupMapper groupMapper;
	
	
	public int groupInsert(GroupVO group, HttpSession session) throws Exception {
		group.setGrp_leader_id((String) session.getAttribute("userId"));
		group.setFavorite_yn(null);
		group.setReg_user_name((String) session.getAttribute("userName"));
		groupMapper.groupInsert(group);
		System.out.println(group.getseq_grp_number());
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("groupNum", group.getseq_grp_number());
		map.put("userId", (String) session.getAttribute("userId"));
		System.out.println("그룹아이디뽑아볼게"+map.get("groupNum"));
		groupMapper.groupInUserInsert(map);
		return 0;
	}
	
	public List<GroupVO> selectNewestGroup(){
		return groupMapper.selectNewestGroup();
		
	}
	public List<GroupVO> selectFavoriteGroup(){
		return groupMapper.selectFavoriteGroup();
		
	}
}



	