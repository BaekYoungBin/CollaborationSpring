package com.spring.grouping.user.mapper;

import java.util.List;

import com.spring.grouping.group.domain.GroupVO;

public interface UserMapper {

	public int groupInsert(GroupVO group) throws Exception;
	public List<GroupVO> selectNewestGroup();
	public List<GroupVO> selectFavoriteGroup();
}
