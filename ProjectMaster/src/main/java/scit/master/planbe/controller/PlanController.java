package scit.master.planbe.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import scit.master.planbe.VO.PlanVO;
import scit.master.planbe.VO.TaskVO;
import scit.master.planbe.service.PlanServiceImpl;
import scit.master.planbe.service.TaskServiceImpl;

@RequestMapping("/plan")
@Controller
public class PlanController {
	
	@Autowired
	PlanServiceImpl service;
	
	@Autowired
	TaskServiceImpl ts;
	
	// Plan 페이지 불러오기 
	@RequestMapping(value ="planForm", method = RequestMethod.GET)
	public String planForm(Model model, HttpSession session) {		
		int userNo=(int)session.getAttribute("userno");
		model.addAttribute("userNo", userNo);
		
		return "planForm";
	}
	
	// PDF 페이지 불러오기 
	@RequestMapping(value ="pdfForm", method = RequestMethod.GET)
	public String pdfForm() {
		return "pdf";
	}
	
	// 일정 생성하기
		@RequestMapping(value ="insertPlan", method = RequestMethod.POST)
		public String insertPlan(PlanVO planVO,Model model) {
			System.out.println(planVO);
			service.insertPlan(planVO);			
			return "planForm";
		}
		
		// 일정 수정하기
		@RequestMapping(value ="updatePlan", method = RequestMethod.POST)
		public String updatePlan(PlanVO planVO,Model model) {
				System.out.println(planVO);
				System.out.println("왔업?");
				service.updatePlan(planVO);
				
			return "redirect:planForm";
		}
	
		// 일정 삭제하기
				@RequestMapping(value ="deletePlan", method = RequestMethod.GET)
				public String deletePlan(int calNo,Model model) {					
					service.deletePlan(calNo);					
					return "redirect:planForm";
				}
				
				// 일정 찾기
				@RequestMapping(value ="searchPlan", method = RequestMethod.POST)
				public String searchPlan(int calNo,Model model) {
					service.searchPlan(calNo);					
					return "redirect:updatePlan";
				}
				
				
				// 일정 리스트 가져오기(calendar DB에서 가져오기// 개인 plan)
				
			
				@RequestMapping(value ="getList", method = RequestMethod.POST)
				@ResponseBody
				public HashMap<String,Object> getList(Model model,HttpSession session) {
					
					ArrayList<PlanVO>list=new ArrayList<>();
					ArrayList<TaskVO>taskList=new ArrayList<>();
					
					HashMap<String,Object>map=new HashMap<>();
					
						list=service.getList(); 
						
						int userno = (int) session.getAttribute("userno");	
						taskList=ts.getTotalList(userno); 
						
						map.put("planList", list);
						map.put("TaskList", taskList);
					
				
					return map;
				}	
			
	
}
