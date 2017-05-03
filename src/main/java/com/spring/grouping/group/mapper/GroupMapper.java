package com.spring.grouping.group.mapper;

import java.util.List;
import java.util.Map;

import com.spring.grouping.group.domain.GroupVO;

public interface GroupMapper {

	public int groupInsert(GroupVO group) throws Exception;
	public int groupInUserInsert(Map<String, Object> map) throws Exception;
	public int insertWorkListName(int seq_grp_number)throws Exception;
	public List<GroupVO> selectNewestGroupList(String user_id);
	
	public List<GroupVO> selectFavoriteGroupList(String user_id);
	
	public List<GroupVO> selectGroupList(String user_id);
	public int updateFavoriteGroupList(Map<String, Object> map);
	public int selectFavoriteGroupListCnt(Map<String, Object> map);
	public int updateNewestGroupList(Map<String, Object> map);
	public int deleteGroup(Map<String, Object> map);
	public int outGroup(Map<String, Object> map);
	public int inviteUser(Map<String, Object> map);
	public int selectMemberUser(Map<String, Object> map);
}
