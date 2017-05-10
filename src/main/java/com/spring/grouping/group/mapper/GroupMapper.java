package com.spring.grouping.group.mapper;

import java.util.List;
import java.util.Map;

import com.spring.grouping.group.domain.GroupVO;
import com.spring.grouping.mypage.domain.UserVO;

public interface GroupMapper {

	public int insertGroup(GroupVO group);
	public int insertUserToGroup(Map<String, Object> map);
	
	public List<GroupVO> selectNewestGroupList(String user_id);
	public String selectGroupTitle(String seq_grp_number);
	public List<GroupVO> selectFavoriteGroupList(String user_id);
	
	public List<GroupVO> selectGroupList(String user_id);
	public int updateFavoriteGroupList(Map<String, Object> map);
	public int selectFavoriteGroupListCnt(Map<String, Object> map);
	public int updateNewestGroupList(Map<String, Object> map);
	public int deleteGroup(Map<String, Object> map);
	public int deleteMemberInGroup(Map<String, Object> map);
	public int insertMemberInGroup(Map<String, Object> map);
	public int selectMemberUser(Map<String, Object> map);
	public int updateGroupUseHist(Map<String, Object> map);
	public List<UserVO> selectMemberList(String seq_grp_number);
}
