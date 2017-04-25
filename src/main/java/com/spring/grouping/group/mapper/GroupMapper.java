package com.spring.grouping.group.mapper;

import java.util.List;
import java.util.Map;

import com.spring.grouping.group.domain.GroupVO;

public interface GroupMapper {

	public int groupInsert(GroupVO group) throws Exception;
	public int groupInUserInsert(Map<String, Object> map) throws Exception;
	public List<GroupVO> selectNewestGroup();
	public List<GroupVO> selectFavoriteGroup();
}
