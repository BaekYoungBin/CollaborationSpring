package com.spring.grouping.work.mapper;

import java.util.List;
import java.util.Map;

import com.spring.grouping.group.domain.GroupVO;
import com.spring.grouping.work.domain.WorkListNameVO;
import com.spring.grouping.work.domain.WorkVO;

public interface WorkMapper {
	public List<WorkVO> selectWorkList(String seq_Grp_number) throws Exception;
	public int insertWork(WorkVO work) throws Exception;
	public WorkListNameVO selectWorkListName(String seq_grp_number);
	public int updateListName(Map<String, Object> map);
	public WorkVO selectWorkDetail(String seq_work_number);
	public int updateWork(WorkVO work);
	public int deleteWork(String seq_work_number);
	public int insertWorkListName(GroupVO group);
}
