package com.spring.grouping.work.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.grouping.user.domain.UserVO;
import com.spring.grouping.user.service.UserService;
import com.spring.grouping.work.domain.WorkListNameVO;
import com.spring.grouping.work.domain.WorkVO;
import com.spring.grouping.work.service.WorkService;

@Controller
@RequestMapping(value = "/work")
public class WorkController {
	@Autowired
	WorkService service;
	
	@Autowired
	UserService user_service;
	
	@RequestMapping(value = "/workView.do")
	public ModelAndView workView(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main/workView");
		WorkListNameVO worklistname = service.selectWorkListName((String)session.getAttribute("seq_grp_number"));
		mv.addObject("worklistname", worklistname);
		System.out.println(worklistname.getFirst_list_name());
		return mv;
	}
	@RequestMapping(value = "/selectMemberList.do")
	@ResponseBody
	public List<UserVO> GetMemberList(HttpSession session) throws Exception {
		System.out.println("흐음 이거될텐데왜안된다고하지");
		List<UserVO> userlist = service.selectMemberList((String)session.getAttribute("seq_grp_number"));
		return userlist;
	}
	@RequestMapping(value = "/selectWorkList.do")
	@ResponseBody
	public List<WorkVO> selectWorkList(HttpSession session) throws Exception {
		System.out.println("워크 리스트 보내드릴게요");
		List<WorkVO> worklist = service.selectWorkList((String)session.getAttribute("seq_grp_number"));
		System.out.println(worklist.size());
		return service.selectWorkList((String)session.getAttribute("seq_grp_number"));
	}
	@RequestMapping(value = "/workRegister.do")
	@ResponseBody
	public int workNewAdd(WorkVO work, HttpSession session) throws Exception {
		work.setSeq_grp_number((String)session.getAttribute("seq_grp_number"));	
		System.out.println("워크 카테고리는 : "+work.getWork_category());
		String user_name = user_service.selectUserName((String)session.getAttribute("user_id"));
		work.setWork_user_name(user_name);
		return service.insertWork(work);
	}
	
	@RequestMapping(value="/modifyListName.do")
	@ResponseBody
	public int modifyListName(String work_category, String list_name, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("work_category", work_category);
		map.put("list_name", list_name);
		map.put("seq_grp_number", (String)session.getAttribute("seq_grp_number"));
		return service.updateListName(map);
	}
	@RequestMapping(value="/selectWorkDetail.do")
	@ResponseBody
	public WorkVO selectWorkDetail(String seq_work_number) throws Exception {

		System.out.println("워크 디테일 불러옵니다"+seq_work_number);
		
		return service.selectWorkDetail(seq_work_number);
	}
	@RequestMapping(value="/updateWork.do")
	@ResponseBody
	public int updateWork(WorkVO work) throws Exception {
		
		String user_name = user_service.selectUserName(work.getWork_user_id());
		work.setWork_user_name(user_name);
		
		
		return service.updateWork(work);
	}
	@RequestMapping(value="/deleteWork.do")
	@ResponseBody
	public int deleteWork(String seq_work_number) throws Exception {
		
		
		return service.deleteWork(seq_work_number);
	}
	
	
}
