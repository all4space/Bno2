package scit.master.planbe.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import scit.master.planbe.VO.PlanVO;
import scit.master.planbe.service.PlanServiceImpl;

@RequestMapping("/plan")
@Controller
public class PlanController {
	
	@Autowired
	PlanServiceImpl service;
	
	// Plan 페이지 불러오기 
	@RequestMapping(value ="planForm", method = RequestMethod.GET)
	public String planForm(Model model, HttpSession session) {		
		int userNo=(int)session.getAttribute("userno");
		model.addAttribute("userNo", userNo);
		model.addAttribute("getList", service.getList());
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
				
				
				// 일정 리스트 가져오기
				
			
				@RequestMapping(value ="getList", method = RequestMethod.POST)
				@ResponseBody
				public ArrayList<PlanVO> getList(Model model) {
					ArrayList<PlanVO>list=new ArrayList<>();
					list=service.getList();
					
					return list;
				}	
				

				
	
}
