package scit.master.planbe.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import scit.master.planbe.VO.HistoryVO;
import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.PageNavigator;
import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.VO.TaskVO;
import scit.master.planbe.VO.UsersVO;
import scit.master.planbe.dao.UsersDAOImpl;
import scit.master.planbe.service.HistoryServiceImpl;
import scit.master.planbe.service.MemberServiceImpl;
import scit.master.planbe.service.ProjectServiceImpl;
import scit.master.planbe.service.TaskService;

@RequestMapping("/task")
@Controller
public class TaskController {
	
	private int CODENO = 2; // 히스토리시 테스크값은 2번
	HistoryVO history = new HistoryVO(); //히스토리 개체
	
	@Autowired
	HistoryServiceImpl historyService;
	
	@Autowired
	TaskService task;
	
	@Autowired
	MemberServiceImpl ms;
	
	@Autowired
	UsersDAOImpl dao;
	
	@Autowired
	ProjectServiceImpl ps;
	
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
		
		System.out.println(task.getList(searchtype,searchword,target,userno,navi.getStartRecord(),navi.getCountPerPage()));
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
	@RequestMapping(value = "newTaskForm")
	public String newTaskForm(ArrayList<MemberVO> memberVo, Model model,HttpSession session) {		
		
	
		model.addAttribute("projectVO", ps.getProjectList((int)session.getAttribute("userno")));
		model.addAttribute("projectList", ms.getProjectNo((String)session.getAttribute("loginId")));
		
	
		return "newTask";
	}
	
	//새로운 업무 생성하기.
	@RequestMapping(value = "newTask", method = RequestMethod.POST)
	public String newTask(TaskVO taskVo,Model model,HttpSession session,int pms) {
		
		String code = "a";
		
		
		UsersVO userVO=dao.idCheck((String)session.getAttribute("loginId"));
		
		if (pms == userVO.getUserNo()) {
			task.Insert(taskVo,userVO.getUserNo());
		}else if (pms != userVO.getUserNo()) {
			task.Insert(taskVo,pms);
		}
		

		
		String userName =(String)session.getAttribute("loginId");
		history.setCdSelect(code);//create update delete 직접줌
		history.setProjectNo(taskVo.getProjectNo()); //프젝넘버 히스토리 VO에 저장
		history.setUserNo(userVO.getUserNo()); // 유저넘버 히스토리 VO에 저장
		
		TaskHistory(history, userName, taskVo.getTaskName());
		

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
		public String updateTask(TaskVO taskVo,Model model, HttpSession session) {
			String code = "b";
			
			System.out.println("taskUpdate : " + taskVo.toString());
			
				
			String userName =(String)session.getAttribute("loginId");
			history.setCodeNo(CODENO);//project task 직접줌
			history.setCdSelect(code);//create update delete 직접줌
			history.setProjectNo(taskVo.getProjectNo()); //프젝넘버 히스토리 VO에 저장
			history.setUserNo(dao.getUserNo((String)session.getAttribute("loginId"))); // 유저넘버 히스토리 VO에 저장
		
			
			System.out.println("왜 널이야" + history.getProjectNo());
			//System.out.println(projectDao.getProjectName(history.getProjectNo()));
			
			
			String content = userName  + "님이"; 
			content += taskVo.getProjectNo() + "방 프로젝트의 ";
			
			//content += projectDao.getProjectName(history.getProjectNo()) + "프로젝트의";
			TaskVO vo = task.Search(taskVo);
			
			content += vo.getTaskName() + " Task 를 ";
			content += historyService.getCdContent(history) + " 햇엉  "; // 저장될 문자열 작성 CONTENT
			content += " 변경사항 : ";
		
			
			System.out.println("1111111" + taskVo.getTaskName());
			System.out.println("2222222" + vo.getTaskName());
			
				if(!(taskVo.getTaskName().equals(vo.getTaskName())))
				{
					content += " TaskName 변경 : " + vo.getTaskName() + " = >" + taskVo.getTaskName();
				}
				if(!(taskVo.getTaskContent().equals(vo.getTaskContent())))
				{
					content += " TaskContent 변경 : " + vo.getTaskContent() + " = > " + taskVo.getTaskContent();
				}
				if(!(taskVo.getTaskPriority().equals(vo.getTaskPriority())))
				{
					content += " TaskPriority 변경 : " + vo.getTaskPriority() + " = > " + taskVo.getTaskPriority();
				}
				if(!(vo.getTotalTime() == vo.getDoneTime()))
				{
					if(taskVo.getDoneTime() == taskVo.getTotalTime())
					{
						taskVo.setTaskStatus("COMPLETE");
						content += " TaskStatus 변경 : " + vo.getTaskStatus() + " = > " + "COMPLETE";
					}
					else if(!(taskVo.getTaskStatus().equals(vo.getTaskStatus())))
					{
						content += " TaskStatus 변경 : " + vo.getTaskStatus() + " = > " + taskVo.getTaskStatus();
						
					}
				}
				else
				{
					if(taskVo.getDoneTime() == taskVo.getTotalTime() || !(taskVo.getTaskStatus().equals(vo.getTaskStatus())))
					{
						taskVo.setTaskStatus("COMPLETE");
					}
				}
				if(!(taskVo.getStartDate().equals(vo.getStartDate())))
				{
					content += " TaskStartDate 변경 : " + vo.getStartDate() + " = > " + taskVo.getStartDate();
				}
				
				
				if(!(taskVo.getTotalTime() == vo.getTotalTime()))
				{
					content += " TaskTotalTime 변경 : " + vo.getTotalTime() + " = > " + taskVo.getTotalTime();
					
					if(!(taskVo.getDoneTime() == taskVo.getTotalTime()))
					{
						taskVo.setTaskStatus("PROGRESS");
					}
				}
				if(!(taskVo.getDoneTime() == vo.getDoneTime()))
				{
					content += " TaskDoneTime 변경 : " + vo.getDoneTime() + " = > " + taskVo.getDoneTime();
					
					if(!(taskVo.getDoneTime() == taskVo.getTotalTime()))
					{
						taskVo.setTaskStatus("PROGRESS");
					}
					
				}
			
			
			
			
	
			System.out.println(content); // CONTENT 값 확인 
			
			history.setLogContent(content); //CONTENT값 VO에 세팅
			
			
			historyService.addHistory(history); //history 디비에 히스토리정보 저장
		
				
			task.updateTask(taskVo);
			
			
				
			return "redirect:taskForm";
		}
		
		//업무 삭제하기
		@RequestMapping(value = "deleteTask", method = RequestMethod.POST)
		public String deleteTask(TaskVO taskVo,Model model, HttpSession session) {			
			
			String code = "c";
			
			task.deleteTask(taskVo);
				
			System.out.println("new TaksVo : "+taskVo.toString());
			
			String userName =(String)session.getAttribute("loginId");
			
			
			history.setCdSelect(code);//create update delete 직접줌
			history.setProjectNo(taskVo.getProjectNo()); //프젝넘버 히스토리 VO에 저장
			history.setUserNo(dao.getUserNo(userName)); // 유저넘버 히스토리 VO에 저장
			
			TaskHistory(history, userName, taskVo.getTaskName());
				
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
		@RequestMapping(value = "projectMemberList", method = RequestMethod.POST)
		@ResponseBody
		public ArrayList<UsersVO> projectMemberList(int projectNo,Model model)
		{
			ArrayList<MemberVO> member = ms.getMemberList(projectNo);
			ArrayList<UsersVO> users = new ArrayList<>();
			for(int i =0; i < member.size(); i++)
			{
				
				users.add(dao.getUserInfo(member.get(i).getUserNo()));
			}
			System.out.println("고고와 난데쓰까"+users.toString());
			
			
			
			return users;
			
		}
		
		
		private void TaskHistory(HistoryVO history, String userName, String taskName) {
			
			history.setCodeNo(CODENO);
			
			String content = userName  + "님이"; 
			content += history.getProjectNo() + "방의";
			content += taskName + "TASK를";
			content += historyService.getCdContent(history) + "햇엉"; // 저장될 문자열 작성 CONTENT
			
			System.out.println(content); // CONTENT 값 확인 
			
			history.setLogContent(content); //CONTENT값 VO에 세팅
			historyService.addHistory(history); //history 디비에 히스토리정보 저장
		}
		
		
}

	

	
	

