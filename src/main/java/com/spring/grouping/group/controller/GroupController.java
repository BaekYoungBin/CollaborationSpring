package com.spring.grouping.group.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.grouping.common.exception.MyTransactionException;
import com.spring.grouping.group.domain.GroupVO;
import com.spring.grouping.group.service.GroupService;
import com.spring.grouping.handler.GroupChatHandler;
import com.spring.grouping.mypage.domain.UserVO;

/**
 * 그룹 컨트롤러 : 그룹화면, 그룹 생성 Ajax, 그룹 리스트, 즐겨찾기 그룹 수정 Ajax, 최근 접속 그룹 수정 Ajax, 그룹 삭제 Ajax, 그룹 탈퇴  Ajax, 
 * 그룹 접속, 멤버 초대 Ajax, 접속 멤버 리스트 Ajax
 */
@Controller
@RequestMapping(value = "/group")
public class GroupController {
	@Autowired
	GroupService service;

	/**
	 * 그룹 화면
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/groupView.do")
	public ModelAndView groupView(HttpSession session) throws Exception{
		String user_id = (String)session.getAttribute("user_id");
		ModelAndView mv = new ModelAndView();
		mv.addObject("group", service.selectGroupList(user_id));
		mv.addObject("favoriteGroup", service.selectFavoriteGroupList(user_id));
		mv.addObject("newstGroup", service.selectNewestGroupList(user_id));
		mv.setViewName("/group/groupView");
		return mv;
	}

	/**
	 * 그룹 생성(ajax)
	 */
	@RequestMapping(value = "/insertGroupAjax.do")
	@ResponseBody
	public int insertGroup(GroupVO group, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String user_id = (String)session.getAttribute("user_id");
		group.setGrp_leader_id(user_id);
		group.setGrp_reg_user_id(user_id);
		map.put("user_id", user_id);
		map.put("group", group);
		return service.insertGroup(map);
	}

	/**
	 * 그룹 리스트
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/selectGroupList.do")
	public ModelAndView selectGroupList(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("요기는됨");
		List<GroupVO> group = service.selectGroupList((String) session.getAttribute("user_id"));
		mv.addObject("group", group);
		mv.addObject("favorite_group", service.selectFavoriteGroupList((String) session.getAttribute("user_id")));
		mv.setViewName("/group/modifyGroupView");
		return mv;
	}

	/**
	 * 즐겨찾기 그룹 수정 Ajax
	 * @param seq_grp_number 그룹 넘버, 
	 * @param session Http세션
	 * @throws MyTransactionException 트랜잭션 처리 예외
	 */
	@RequestMapping(value = "/updateFavoriteGroupListAjax.do")
	@ResponseBody
	public int updateFavoriteGroupList(String seq_grp_number, HttpSession session) {
		return service.updateFavoriteGroupList(seq_grp_number, session);
	}

	/**
	 * 최근 접속 그룹 수정 Ajax
	 */
	@RequestMapping(value = "/updateNewestGroupListAjax.do")
	@ResponseBody
	public int modifyNewestGroupList(String seq_grp_number, HttpSession session) throws Exception{
		return service.updateNewestGroupList(seq_grp_number, session);
	}

	/**
	 * 그룹 삭제 Ajax
	 */
	@RequestMapping(value = "/deleteGroupAjax.do")
	@ResponseBody
	public int removeGroup(String seq_grp_number, HttpSession session) throws Exception{
		return service.deleteGroup(seq_grp_number, session);
	}

	/**
	 * 그룹 탈퇴  Ajax
	 */
	@RequestMapping(value = "/deleteMemberInGroupAjax.do")
	@ResponseBody
	public int withdrawGroup(String seq_grp_number, HttpSession session) throws Exception{
		return service.deleteMemberInGroup(seq_grp_number, session);
	}
	
	/**
	 * 그룹 접속
	 * return redirect
	 */
	@RequestMapping(value = "/redirectGroupMain.do")
	public String redirectGroupMain(String seq_grp_number, HttpSession session) throws Exception{
		session.setAttribute("seq_grp_number", seq_grp_number);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq_grp_number", seq_grp_number);
		map.put("user_id", (String) session.getAttribute("user_id"));
		service.updateGroupUseHist(map);
		return "redirect:../main/mainView.do";
	}

	/**
	 * 멤버 초대 Ajax
	 */
	@RequestMapping(value = "/insertMemberInGroupAjax.do")
	@ResponseBody
	public int insertMemberInGroup(String user_id, HttpSession session) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("seq_grp_number", (String) session.getAttribute("seq_grp_number"));
		return service.insertMemberInGroup(map);
	}

	/**
	 * 접속 멤버 리스트 Ajax
	 */
	@RequestMapping(value = "/accessUser.do")
	@ResponseBody
	public List<UserVO> accessUser(HttpSession session) throws Exception{
		List<UserVO> userlist = GroupChatHandler.getCurrentUser((String) session.getAttribute("seq_grp_number"));
		return userlist;
	}
	
	/**
	 * 그룹 멤버 리스트 Ajax
	 */
	@RequestMapping(value = "/allUser.do")
	@ResponseBody
	public List<UserVO> allUser(HttpSession session) throws Exception{
		List<UserVO> userlist = service.getAllUser((String) session.getAttribute("seq_grp_number"));
		return userlist;
	}


}
