package com.spring.grouping.work.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.grouping.group.mapper.GroupMapper;
import com.spring.grouping.mypage.domain.UserVO;
import com.spring.grouping.work.domain.WorkListNameVO;
import com.spring.grouping.work.domain.WorkVO;
import com.spring.grouping.work.mapper.WorkMapper;

@Service
public class WorkService {
	@Autowired
	private WorkMapper workMapper;
	
	@Autowired
	private GroupMapper groupMapper;
	
	/**
	 * 업무 리스트 조회
	 * @return List<WorkVO>
	 * @throws Exception
	 */
	public List<WorkVO> selectWorkList(String seq_grp_number) throws Exception{
		System.out.println(workMapper.selectWorkList(seq_grp_number).size());
		return workMapper.selectWorkList(seq_grp_number);
	}
	
	/**
	 * 업무 멤버 리스트 조회
	 * @return List<UserVO>
	 * @throws Exception
	 */
	public List<UserVO> selectMemberList(String seq_grp_number) throws Exception{
		return groupMapper.selectMemberList(seq_grp_number);
	}
	
	/**
	 * 업무 생성
	 * @return
	 * @throws Exception
	 */
	public int insertWork(WorkVO work) throws Exception{
		return workMapper.insertWork(work);
	}
	
	/**
	 * 업무리스트 이름 조회
	 * @return WorkListNameVO
	 * @throws Exception
	 */
	public WorkListNameVO selectWorkListName(String seq_grp_number) throws Exception{
		return workMapper.selectWorkListName(seq_grp_number);
	}
	
	/**
	 * 업무리스트 이름 수정
	 * @return
	 */
	public int updateListName(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return workMapper.updateListName(map);
	}
	
	/**
	 * 업무 상세 조회 
	 * @return WorkVO
	 */
	public WorkVO selectWorkDetail(String seq_work_number) {
		// TODO Auto-generated method stub
		return workMapper.selectWorkDetail(seq_work_number);
	}
	
	/**
	 * 업무 수정
	 * @return
	 */
	public int updateWork(WorkVO work) {
		// TODO Auto-generated method stub
		return workMapper.updateWork(work);
	}
	
	/**
	 * 업무 삭제
	 * @return
	 */
	public int deleteWork(String seq_work_number) {
		// TODO Auto-generated method stub
		return workMapper.deleteWork(seq_work_number);
	}
}
