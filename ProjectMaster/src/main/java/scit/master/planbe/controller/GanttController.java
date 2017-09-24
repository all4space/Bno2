package scit.master.planbe.controller;


import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.TaskVO;
import scit.master.planbe.service.GanttServiceImpl;
import scit.master.planbe.service.StaticServiceImpl;

@RequestMapping("/gantt")
@Controller
public class GanttController {
	
	@Autowired
	GanttServiceImpl service;
	@Autowired
	StaticServiceImpl static_service;
	
	//1 Gantt 페이지 불러오기 
	@RequestMapping(value = "ganttForm", method = RequestMethod.GET)
	public String ganttForm(String projectNo, Model model) {
		String address = "redirect:/member/getProjectList";
			if(projectNo != null){
				address = "forward:/member/getProjectList";
				model.addAttribute("projectNo", projectNo);
			}
		return address;
	}
	
	//2 Gantt 불러오기
	@RequestMapping(value = "getGantt", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String,Object> getGantt(MemberVO m_vo) {
		ArrayList<TaskVO> taskList = service.getGantt(m_vo);
		ArrayList<Integer> memberNoList = new ArrayList<>();
		
		for (TaskVO taskVO : taskList) {
			memberNoList.add(taskVO.getMemberNo());
		}
		
		HashMap<String,Object> map = new HashMap<>();
		
		map.put("taskList", taskList);
		map.put("taskUserName", static_service.taskOfusersName(memberNoList));
		return map;
	}
	
	@RequestMapping(value = "year", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<TaskVO> year(MemberVO m_vo) {
		return service.year(m_vo);
	}
	
	@RequestMapping(value = "month", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<TaskVO> month(MemberVO m_vo) {
		return service.month(m_vo);
	}
}
