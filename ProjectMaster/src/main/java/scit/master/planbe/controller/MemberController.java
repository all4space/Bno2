package scit.master.planbe.controller;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import scit.master.planbe.VO.HistoryVO;
import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.service.MemberServiceImpl;
import scit.master.planbe.service.ProjectServiceImpl;
import scit.master.planbe.service.UsersServiceImpl;

@RequestMapping("/member")
@Controller
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	
	@Autowired
	ProjectServiceImpl projectService;

	@Autowired
	UsersServiceImpl usersService;

	
	@RequestMapping(value = "memberForm", method = RequestMethod.GET)
	public ModelAndView memberForm(HttpSession session) {
		String userId = (String) session.getAttribute("loginId");
		String groupName = projectService.getGroupName(userId);
		
		System.out.println(usersService.getUserVo(groupName));
		
		ModelAndView mov = new ModelAndView("/memberForm");
		mov.addObject("userVo", usersService.getUserVo(groupName));
		System.out.println("mov? " + mov.toString());
		
		return mov;
	}
	
	@RequestMapping(value = "getProjectList", method = RequestMethod.GET) //로그인 유저의 멤버넘버를 가져온다.
	public ModelAndView getProjectList(HttpSession session, Model model,String projectNo) {
		String userId = (String) session.getAttribute("loginId");
		HashMap<String,Object> map = service.getProjectList(userId);
		ModelAndView mav = new ModelAndView("/ganttForm");
		mav.addObject("member", map.get("member"));
		mav.addObject("project", map.get("project"));
		if(projectNo != null){
			mav.addObject("projectNo",projectNo);
		}
		return mav;
	}
	
	@RequestMapping(value = "getProjectNo", method = RequestMethod.GET) //로그인 유저가 멤버로 속한 프로젝트 넘버를 가져온다.
	public String getProjectNo(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("loginId");
		model.addAttribute("projectNo_list", service.getProjectNo(userId)); 
		return "staticForm";
	}
	
	@RequestMapping(value = "favoriteAdd", method = RequestMethod.POST)
	@ResponseBody
	public boolean favoriteAdd(int projectNo, HttpSession session)
	{
		MemberVO memberVo = new MemberVO();
		
		String userId = (String) session.getAttribute("loginId");
		memberVo.setUserNo(usersService.getUserNo(userId));
		memberVo.setProjectNo(projectNo);
		
		return service.favoriteAdd(memberVo);
	}
	
	@RequestMapping(value = "favoriteDelete", method = RequestMethod.POST)
	@ResponseBody
	public boolean favoriteDelete(int projectNo, HttpSession session)
	{
		MemberVO memberVo = new MemberVO();
		
		String userId = (String) session.getAttribute("loginId");
		memberVo.setUserNo(usersService.getUserNo(userId));
		memberVo.setProjectNo(projectNo);
		
		return service.favoriteDelete(memberVo);
	}
	
	@RequestMapping(value = "favoriteCheck", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<MemberVO> favoriteCheck(ArrayList<ProjectVO> projectList, HttpSession session)
	{
		ArrayList<MemberVO> memberVo = new ArrayList<MemberVO>();
		System.out.println("파보리테 : " + projectList.toString());
		
		return memberVo;
	}
}
