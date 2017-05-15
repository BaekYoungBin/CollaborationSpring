package com.spring.grouping.group.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.grouping.group.domain.GroupVO;
import com.spring.grouping.group.mapper.GroupMapper;
import com.spring.grouping.mypage.domain.UserVO;
import com.spring.grouping.work.mapper.WorkMapper;


@Service
public class GroupService {

	private static final Exception Exception = null;
	@Autowired
	private GroupMapper groupMapper;
	@Autowired
	private WorkMapper workMapper;

	/**
	 * 그룹 생성
	 * @return
	 */
	public int insertGroup(Map<String, Object> map){
		GroupVO group = (GroupVO) map.get("group");
		groupMapper.insertGroup(group);
		workMapper.insertWorkListName(group);
		map.put("seq_grp_number", group.getSeq_grp_number());
		return groupMapper.insertUserToGroup(map);
	}

	/**
	 * 그룹 리스트 조회
	 * @return
	 */
	public List<GroupVO> selectGroupList(String user_id) {
		return groupMapper.selectGroupList(user_id);

	}
	
	/**
	 * 그룹 타이틀 조회
	 * @return
	 */
	public String selectGroupTitle(String seq_grp_number) {
		return groupMapper.selectGroupTitle(seq_grp_number);
	}

	/**
	 * 최근 사용한 그룹 리스트 조회
	 * @return
	 */
	public List<GroupVO> selectNewestGroupList(String user_id) {
		return groupMapper.selectNewestGroupList(user_id);
	}

	/**
	 * 즐겨찾기 추가한 그룹 리스트 조회
	 * @return
	 */
	public List<GroupVO> selectFavoriteGroupList(String user_id) {
		return groupMapper.selectFavoriteGroupList(user_id);

	}

	/**
	 * 즐겨찾기 그룹 수정
	 * @return
	 * @throws MyException 
	 *
	 */
	public int updateFavoriteGroupList(String seq_grp_number, HttpSession session) {		
				Map<String, Object> map = new HashMap<>();
				map.put("seq_grp_number", seq_grp_number);
				map.put("user_id", (String)session.getAttribute("user_id"));
				if(groupMapper.selectFavoriteGroupListCnt(map)==5 && groupMapper.selectGroupFavoriteYN(map)==null)
					return 0;
				else
					return groupMapper.updateFavoriteGroupList(map);
	}


	/**
	 * 최근 사용한 그룹 수정
	 * @return
	 */
	public int updateNewestGroupList(String seq_grp_number, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		map.put("seq_grp_number", seq_grp_number);
		map.put("user_id", (String) session.getAttribute("user_id"));
		return groupMapper.updateNewestGroupList(map);
	}

	/**
	 * 그룹 삭제
	 * @return
	 */
	public int deleteGroup(String seq_grp_number, HttpSession session) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", (String) session.getAttribute("user_id"));
		map.put("seq_grp_number", seq_grp_number);
		return groupMapper.deleteGroup(map);
	}

	/**
	 * 그룹 탈퇴
	 * @return
	 */
	public int deleteMemberInGroup(String seq_grp_number, HttpSession session) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", (String) session.getAttribute("user_id"));
		map.put("seq_grp_number", seq_grp_number);
		return groupMapper.deleteMemberInGroup(map);
	}

	/**
	 * 그룹 초대
	 * @return
	 */
	public int insertMemberInGroup(Map<String, Object> map) {
		//그룹에 유저 중복 초대 방지
		if (groupMapper.selectMemberUser(map) == 0) {
			//그룹 유저 초대
			return groupMapper.insertUserToGroup(map);
		} 
		//그룹에 유저가 있을 경우
		else 
		{
			return 0;
		}
	}

	/**
	 * 그룹 사용 이력 업데이트
	 * @return
	 */
	public int updateGroupUseHist(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return groupMapper.updateGroupUseHist(map);
	}

	public List<UserVO> getAllUser(String seq_grp_number) {
		// TODO Auto-generated method stub
		return groupMapper.selectMemberList(seq_grp_number);
	}

}
