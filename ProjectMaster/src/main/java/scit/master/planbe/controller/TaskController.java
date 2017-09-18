package scit.master.planbe.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import scit.master.planbe.VO.PageNavigator;
import scit.master.planbe.VO.TaskVO;
import scit.master.planbe.VO.UsersVO;
import scit.master.planbe.dao.UsersDAOImpl;
import scit.master.planbe.service.MemberServiceImpl;
import scit.master.planbe.service.TaskService;

@RequestMapping("/task")
@Controller
public class TaskController {
	
	@Autowired
	TaskService task;
	
	@Autowired
	MemberServiceImpl ms;
	
	@Autowired
	UsersDAOImpl dao;
	
	//task.jsp로 이동
	@RequestMapping(value = "taskForm", method = RequestMethod.GET)
	public String taskForm(Model model,HttpSession session,
							@RequestParam(value="currentPage", defaultValue="1") int currentPage,
							@RequestParam(value="searchtype", defaultValue="") String searchtype,
							@RequestParam(value="searchword", defaultValue="") String searchword,
							@RequestParam(value="target", defaultValue="") String target) {
		
		int userno = (int) session.getAttribute("userno");
		int totalRecordCount=task.getTotalCount(searchtype, searchword,target,userno);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount, 5);
		model.addAttribute("taskList",task.getList(searchtype,searchword,target,userno,navi.getStartRecord(),navi.getCountPerPage())); 
		model.addAttribute("result", navi);
		return "taskForm";				
	}
	
	//progress.jsp로 이동
	@RequestMapping(value = "progressForm", method = RequestMethod.GET)
	public String progressForm(HttpSession session,Model model) {
		
		int userno = (int) session.getAttribute("userno");	
		model.addAttribute("allList",task.getTotalList(userno));
		return "progress";
	}
	
	
	// 전체 리스트 출력하기(페이지 수와 상관없이~)
	@ResponseBody
	@RequestMapping(value="getChart", method= RequestMethod.POST)
	public ArrayList<TaskVO> getChart(Model model,HttpSession session) {
		int userno = (int) session.getAttribute("userno");		
		return task.getTotalList(userno);
	}
	
	//newTask.jsp로 이동
	@RequestMapping(value = "newTaskForm", method = RequestMethod.GET)
	public String newTaskForm(Model model,HttpSession session) {		
		
		model.addAttribute("projectList", ms.getProjectNo((String)session.getAttribute("loginId")));
		System.out.println(ms.getProjectNo((String)session.getAttribute("loginId")));
		return "newTask";
	}
	
	//새로운 업무 생성하기.
	@RequestMapping(value = "newTask", method = RequestMethod.POST)
	public String newTask(TaskVO taskVo,Model model,HttpSession session) {
		
		UsersVO userVO=dao.idCheck((String)session.getAttribute("loginId"));
		task.Insert(taskVo,userVO);	
		return "redirect:taskForm";
	}
	
	//updateTask.jsp로 이동
		@RequestMapping(value = "updateTaskForm", method = RequestMethod.GET)
		public String updateTaskForm(TaskVO taskVo,Model model) {		
			
			model.addAttribute("updateTask", task.Search(taskVo)); 
		
			return "updateTask";
		}
		
		//업무 수정하기
		@RequestMapping(value = "updateTask", method = RequestMethod.POST)
		public String updateTask(TaskVO taskVo,Model model) {
				task.updateTask(taskVo);
			return "redirect:taskForm";
		}
		
		//업무 삭제하기
		@RequestMapping(value = "deleteTask", method = RequestMethod.POST)
		public String deleteTask(TaskVO taskVo,Model model) {			
				task.deleteTask(taskVo);
			return "redirect:taskForm";
		}
		
		//엑셀 다운로드
		@RequestMapping(value = "ExcelDownload", method = RequestMethod.GET)
		public String ExcelDownload(HttpServletResponse response,HttpSession session,
									@RequestParam(value="currentPage", defaultValue="1") int currentPage,
									@RequestParam(value="searchtype", defaultValue="") String searchtype,
									@RequestParam(value="target", defaultValue="") String target,
									@RequestParam(value="searchword", defaultValue="") String searchword){
			
			int userno = (int) session.getAttribute("userno");	
			int totalRecordCount=task.getTotalCount(searchtype, searchword,target,userno);
			PageNavigator navi = new PageNavigator(currentPage, totalRecordCount, 5);			
				task.excelList(response,searchtype,searchword,userno,target,navi.getStartRecord(),navi.getCountPerPage());
			return "taskForm";
		}
	
		
		
		//Progress 검색
		@RequestMapping(value = "selectTask", method = RequestMethod.GET)
		public String selectTask(Model model, HttpSession session,
								@RequestParam(value="searchtype", defaultValue="") String searchtype,
								@RequestParam(value="searchword", defaultValue="") String searchword,
								@RequestParam(value="value", defaultValue="") int taskNo,
								@RequestParam(value="taskValue", defaultValue="") String allTask) {
			
		
			int userno = (int) session.getAttribute("userno");	
			
			
			System.out.println("selectTaskNo : "+ taskNo);
			if (taskNo > 0) {
			 model.addAttribute("searchProgress", task.searchTask(searchtype, searchword,userno,taskNo));
			}
			if (taskNo == 0) {
			model.addAttribute("totalList",task.getTotalList(userno));
			System.out.println(task.getTotalList(userno));
			}
			
			model.addAttribute("allList",task.getTotalList(userno));
			
			return "progress";				
		}
		
		
		
	
}

	

	
	
