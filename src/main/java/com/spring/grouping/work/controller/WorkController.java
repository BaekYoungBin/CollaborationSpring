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

import com.spring.grouping.mypage.domain.UserVO;
import com.spring.grouping.mypage.service.MypageService;
import com.spring.grouping.work.domain.WorkListNameVO;
import com.spring.grouping.work.domain.WorkVO;
import com.spring.grouping.work.service.WorkService;

/**
 * 업무 컨트롤러 : 업무 화면, 그룹멤버 리스트 조회 Ajax, 업무 리스트 조회 Ajax, 업무 등록 Ajax, 업무 리스트 이름 변경 Ajax, 업무 상세 조회 Ajax
 * 업무 수정 Ajax, 업무 삭제 Ajax
 */
@Controller
@RequestMapping(value = "/work")
public class WorkController {
	@Autowired
	WorkService service;
	
	@Autowired
	MypageService user_service;
	
	/**
	 * 업무 화면
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/workView.do")
	public ModelAndView workView(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main/workView");
		WorkListNameVO worklistname = service.selectWorkListName((String)session.getAttribute("seq_grp_number"));
		mv.addObject("worklistname", worklistname);
		return mv;
	}
	
	/**
	 * 그룹멤버 리스트 조회 Ajax
	 * @return List<UserVO>
	 */
	@RequestMapping(value = "/selectMemberList.do")
	@ResponseBody
	public List<UserVO> GetMemberList(HttpSession session) throws Exception {
		List<UserVO> userlist = service.selectMemberList((String)session.getAttribute("seq_grp_number"));
		return userlist;
	}
	
	/**
	 * 업무 리스트 조회 Ajax
	 * 
	 * @return List<WorkVO>
	 */
	@RequestMapping(value = "/selectWorkList.do")
	@ResponseBody
	public List<WorkVO> selectWorkList(HttpSession session) throws Exception {
		System.out.println((String)session.getAttribute("seq_grp_number"));
		return service.selectWorkList((String)session.getAttribute("seq_grp_number"));
	}
	
	/**
	 * 업무 등록 Ajax
	 */
	@RequestMapping(value = "/workRegister.do")
	@ResponseBody
	public int workNewAdd(WorkVO work, HttpSession session) throws Exception {
		work.setSeq_grp_number((String)session.getAttribute("seq_grp_number"));	
		String user_name = user_service.selectUserName((String)session.getAttribute("user_id"));
		work.setWork_user_name(user_name);
		return service.insertWork(work);
	}
	
	/**
	 * 업무 리스트 이름 변경 Ajax
	 */
	@RequestMapping(value="/modifyListName.do")
	@ResponseBody
	public int modifyListName(String work_category, String list_name, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("work_category", work_category);
		map.put("list_name", list_name);
		map.put("seq_grp_number", (String)session.getAttribute("seq_grp_number"));
		return service.updateListName(map);
	}
	
	/**
	 * 업무 상세 조회 Ajax
	 * @return WorkVO
	 */
	@RequestMapping(value="/selectWorkDetail.do")
	@ResponseBody
	public WorkVO selectWorkDetail(String seq_work_number) throws Exception {

		return service.selectWorkDetail(seq_work_number);
	}
	
	/**
	 * 업무 수정 Ajax
	 */
	@RequestMapping(value="/updateWork.do")
	@ResponseBody
	public int updateWork(WorkVO work) throws Exception {
		String user_name = user_service.selectUserName(work.getWork_user_id());
		work.setWork_user_name(user_name);
		return service.updateWork(work);
	}
	
	/**
	 * 업무 삭제 Ajax
	 */
	@RequestMapping(value="/deleteWork.do")
	@ResponseBody
	public int deleteWork(String seq_work_number) throws Exception {
		return service.deleteWork(seq_work_number);
	}
}
