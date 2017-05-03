package com.spring.grouping.work.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.grouping.user.domain.UserVO;
import com.spring.grouping.work.domain.WorkListNameVO;
import com.spring.grouping.work.domain.WorkVO;
import com.spring.grouping.work.mapper.WorkMapper;

@Service
public class WorkService {
	@Autowired
	private WorkMapper workMapper;
	public List<WorkVO> selectWorkList(String seq_grp_number) throws Exception{
		return workMapper.selectWorkList(seq_grp_number);
	}
	public List<UserVO> selectMemberList(String seq_grp_number) throws Exception{
		return workMapper.selectMemberList(seq_grp_number);
	}
	public int insertWork(WorkVO work) throws Exception{
		return workMapper.insertWork(work);
	}
	public WorkListNameVO selectWorkListName(String seq_grp_number) throws Exception{
		return workMapper.selectWorkListName(seq_grp_number);
	}
	public int updateListName(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return workMapper.updateListName(map);
	}
	public WorkVO selectWorkDetail(String seq_work_number) {
		// TODO Auto-generated method stub
		return workMapper.selectWorkDetail(seq_work_number);
	}
	public int updateWork(WorkVO work) {
		// TODO Auto-generated method stub
		return workMapper.updateWork(work);
	}
	public int deleteWork(String seq_work_number) {
		// TODO Auto-generated method stub
		return workMapper.deleteWork(seq_work_number);
	}
}
