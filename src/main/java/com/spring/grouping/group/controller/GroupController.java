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

import com.spring.grouping.group.domain.GroupVO;
import com.spring.grouping.group.service.GroupService;
import com.spring.grouping.handler.GroupChatHandler;
import com.spring.grouping.user.domain.UserVO;

/**
 * 그룹 컨트롤러
 */
@Controller
@RequestMapping(value = "/group")
public class GroupController {
	@Autowired
	GroupService service;

	@RequestMapping(value = "/groupView.do")
	public ModelAndView groupView(HttpSession session) {
		ModelAndView mv = new ModelAndView();


		mv.addObject("group",service.selectGroupList((String)session.getAttribute("user_id")));
		mv.addObject("favoriteGroup", service.selectFavoriteGroupList((String)session.getAttribute("user_id")));
		mv.addObject("newstGroup", service.selectNewestGroupList((String)session.getAttribute("user_id")));
		mv.setViewName("/group/groupView");
		return mv;
	}

	@RequestMapping(value = "/groupRegister.do")
	@ResponseBody
	public int groupRegister(GroupVO group, HttpSession session) throws Exception {
			group.setGrp_leader_id((String)session.getAttribute("user_id"));	
			return service.groupInsert(group, session);
	}
	
	
	 @RequestMapping(value = "/selectGroupList.do")
	    public ModelAndView selectGroupList(HttpSession session){
		 ModelAndView mv = new ModelAndView();
		 List<GroupVO> group = service.selectGroupList((String)session.getAttribute("user_id"));

		 mv.addObject("group", group);
		mv.addObject("favorite_group", service.selectFavoriteGroupList((String)session.getAttribute("user_id")));
		 mv.setViewName("/group/modifyGroup");
	        return mv;
	   } 
	 @RequestMapping(value = "/updateFavoriteGroupList.do")
	 @ResponseBody
	    public int updateFavoriteGroupList(String seq_grp_number, HttpSession session){
		 System.out.println(seq_grp_number);
		return service.updateFavoriteGroupList(seq_grp_number, session);
	   } 
	 @RequestMapping(value = "/updateNewestGroupList.do")
	 @ResponseBody
	    public int updateNewestGroupList(String seq_grp_number, HttpSession session){
		 System.out.println(seq_grp_number);
		return service.updateNewestGroupList(seq_grp_number, session);
	   }
	 @RequestMapping(value = "/deleteGroup.do")
	 @ResponseBody
	    public int deleteGroup(String seq_grp_number, HttpSession session){
		 System.out.println(seq_grp_number);
		return service.deleteGroup(seq_grp_number, session);
	   }
	 @RequestMapping(value = "/outGroup.do")
	 @ResponseBody
	    public int outGroup(String seq_grp_number, HttpSession session){
		 System.out.println(seq_grp_number);
		return service.outGroup(seq_grp_number, session);
	   }
	 @RequestMapping(value = "/joinGroupMain.do")
	    public String joinGroupMain(String seq_grp_number, HttpSession session){
		 System.out.println("여기 불리는거 맞아요");
		 session.setAttribute("seq_grp_number", seq_grp_number);
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("seq_grp_number", seq_grp_number);
		 map.put("user_id", (String)session.getAttribute("user_id"));
		 service.updateGrpUseHist(map);
		 
			return "redirect:../main/mainView.do";
	   }
	 
	 @RequestMapping(value = "/inviteUser.do")
	 @ResponseBody
	 public int inviteUser(String user_id, HttpSession session){
		 Map<String, Object> map = new HashMap<>();
		 map.put("user_id", user_id);
		 map.put("seq_grp_number", (String)session.getAttribute("seq_grp_number"));
		 return service.inviteUser(map);
	   }
	 @RequestMapping(value = "/accessUser.do")
	 @ResponseBody
	 public List<UserVO> accessUser(HttpSession session){
		 List<UserVO> userlist = GroupChatHandler.getCurrentUser((String)session.getAttribute("seq_grp_number"));
		
		 return userlist;
	   }

}
