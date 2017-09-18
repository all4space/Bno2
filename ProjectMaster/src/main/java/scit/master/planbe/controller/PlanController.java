package scit.master.planbe.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
			service.insertPlan(planVO);
			
			return "planForm";
		}
	
	
}
