package scit.master.planbe.controller;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

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
import scit.master.planbe.VO.UsersVO;
import scit.master.planbe.service.HistoryServiceImpl;
import scit.master.planbe.service.MemberServiceImpl;
import scit.master.planbe.service.ProjectServiceImpl;
import scit.master.planbe.service.UsersServiceImpl;

@RequestMapping("/project")
@Controller
public class ProjectController {
	private int CODENO = 1;
	
	HistoryVO history = new HistoryVO();
	MemberVO memberVo = new MemberVO();
	
	@Autowired
	ProjectServiceImpl service;
	
	@Autowired
	UsersServiceImpl usersService;
	
	@Autowired
	MemberServiceImpl memberService;
	
	@Autowired
	HistoryServiceImpl historyService;
	
	// ProjectList 
	@RequestMapping(value = "projectList", method = RequestMethod.GET)
	public ModelAndView projectList(HttpSession session)
	{
		String userId = (String) session.getAttribute("loginId");
	
		ModelAndView mov = new ModelAndView("/projectList");
		
		ArrayList<ProjectVO> project = service.getProjectList(usersService.getUserNo(userId));
		ArrayList<MemberVO> memberVo = memberService.getFavorite(usersService.getUserNo(userId));
		
		int userNo = usersService.getUserNo(userId);
		
		System.out.println("projectList" + usersService.getUserInfo(userNo).toString());
		
		mov.addObject("userNo",userNo);
		mov.addObject("users", usersService.getUserInfo(userNo));
		mov.addObject("projectList", project);
		mov.addObject("member", memberVo);
		
		return mov;
	}
	
	//프로젝트 삭제
	@RequestMapping(value = "projectDelete", method = RequestMethod.GET)
	public String projectDelete(ProjectVO projectList, HttpSession session) {
		String code = "c";
		
		String userName =(String)session.getAttribute("loginId");
		history.setCdSelect(code);//create update delete 직접줌
		history.setProjectNo(projectList.getProjectNo()); //프젝넘버 히스토리 VO에 저장
		history.setUserNo(usersService.getUserNo(userName)); // 유저넘버 히스토리 VO에 저장
		
		projectHistory(history, userName);
		
		service.projectDelete(projectList.getProjectNo());
		
		return "redirect:projectList";
	}
	@RequestMapping(value = "groupMemberList", method = RequestMethod.POST)
	   @ResponseBody
	   public ArrayList<UsersVO> groupMemberList(String userId) {
	      UsersVO uvo = new UsersVO();
	      String groupname = service.getGroupName(userId);
	      uvo.setGroupName(groupname);
	      uvo.setUserId(userId);
	      return service.groupMemberList(uvo);
	   }
	
	
	   // group MemberList
	   @RequestMapping(value = "projectForm", method = RequestMethod.GET)
	   public ModelAndView projectForm(HttpSession session) {
	      
	      String groupname = service.getGroupName((String)session.getAttribute("loginId"));
	      
	      ModelAndView mov = new ModelAndView("/projectForm");
	      mov.addObject("groupManagerList", service.groupManagerList(groupname));
	      System.out.println("mov? " + mov.toString());
	      
	      return mov;
	   }
	
	@RequestMapping(value = "projectAdd", method = RequestMethod.POST)
	public String projectAdd(Model model, HttpSession session, UsersVO userVo, 
			ProjectVO projectList, MemberVO memberVo, String memberList, String managerId) throws ParseException {
		
		String code = "a";
		
		String userId = (String) session.getAttribute("loginId");
		projectList.setUserNo(usersService.getUserNo(userId));
		/*String[] startDate = new String[3];
		String[] dueDate = new String[3];
		
		
		String start = projectVo.getStartDate();
		String due = projectVo.getDueDate();
		
		startDate = start.split("/");
		dueDate = due.split("/");

		start = startDate[2] + "/" + startDate[0] + "/" + startDate[1];
		due = dueDate[2] + "/" + dueDate[0] + "/" + dueDate[1];
		
		projectVo.setStartDate(start);
		projectVo.setDueDate(due);*/
	
		System.out.println(userVo.toString());
		System.out.println(memberVo.toString());
		System.out.println("부모가없다" + projectList.toString());
		
		
		System.out.println(managerId);
		System.out.println(memberList);
		service.projectAdd(projectList); // 여기까지 프로젝트 생성
		
		
		// 지금부터 매니저에 떄려박을거양
		
		System.out.println(service.getProjectSeq());
		System.out.println(usersService.getUserNo(managerId));
		
		memberVo.setProjectNo(service.getProjectSeq());
		memberVo.setUserNo(usersService.getUserNo(managerId));

		SimpleDateFormat stringFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		Date start = stringFormat.parse(projectList.getStartDate());
		Date due = dateFormat.parse(projectList.getDueDate());
		
		long work = due.getTime() - start.getTime();
        long workDays = 8*(work / (24 * 60 * 60 * 1000));
        
        memberVo.setCanWork((int)workDays);
        memberVo.setMustWork((int)workDays);
        
        System.out.println(memberVo.toString());
        memberService.ManagerAdd(memberVo);
       
        
        String[] member = memberList.split(","); 
        
        for(int i = 0; i < member.length; i++)
		{
        	System.out.println(member[i]);
        	memberVo.setUserNo(
        	usersService.getUserNo(member[i]));
        	System.out.println(memberVo.toString());
        	
        	memberService.MemberAdd(memberVo);
		}
        
        //String content = "a프로젝트가 새성되었습니다 를셀렉트로불러봐";
        
        projectList.setProjectNo(service.getProjectSeq());
        String userName =(String)session.getAttribute("loginId");
		history.setCdSelect(code);//create update delete 직접줌
		
		history.setProjectNo(projectList.getProjectNo()); //프젝넘버 히스토리 VO에 저장
		history.setUserNo(usersService.getUserNo((String)session.getAttribute("loginId"))); // 유저넘버 히스토리 VO에 저장
		
		projectHistory(history, userName);
		
		model.addAttribute("memberVo", memberService.getMemberList(memberVo.getProjectNo()));

		System.out.println(memberService.getMemberList(memberVo.getProjectNo()));
		
		return "forward:/task/newTaskForm";
	}
	
	@RequestMapping(value = "projectUpdateForm", method = RequestMethod.GET)
	public String projectUpdateForm(ProjectVO projectList, Model model) {
		
		ProjectVO list = service.getProjectInfo(projectList.getProjectNo());
		
		model.addAttribute("projectList",list);
		System.out.println(list.toString());
		
		return "projectUpdateForm";	
		
	}
	
	@RequestMapping(value = "projectUpdate", method = RequestMethod.POST)
	public String projectUpdate(ProjectVO projectList, HttpSession session) {

		String code = "b";
		
		System.out.println("ProjectUpdate : " + projectList.toString());
		//날짜 짜르고
		projectList.setStartDate(projectList.getStartDate().substring(0, 10));
		projectList.setDueDate(projectList.getDueDate().substring(0, 10));

		
		
		
		String userName =(String)session.getAttribute("loginId");
		history.setCodeNo(CODENO);//project task 직접줌
		history.setCdSelect(code);//create update delete 직접줌
		history.setProjectNo(projectList.getProjectNo()); //프젝넘버 히스토리 VO에 저장
		history.setUserNo(usersService.getUserNo((String)session.getAttribute("loginId"))); // 유저넘버 히스토리 VO에 저장
		
		
		
		String content = userName  + "님이"; 
		content += service.getprojectName(history.getProjectNo()) + "프로젝트를";
		content += historyService.getCodeContent(CODENO) + "을/를";
		content += historyService.getCdContent(history) + "햇엉"; // 저장될 문자열 작성 CONTENT

		content += "변경사항 : ";
	
		
		System.out.println("1111111" + projectList.getProjectName());
		System.out.println("2222222" + service.getProjectInfo(projectList.getProjectNo()).getProjectName());
		
		
		if(!(projectList.getProjectName().equals(service.getProjectInfo(projectList.getProjectNo()).getProjectName())))
		{
			content += "ProjectName 변경 : " + service.getProjectInfo(projectList.getProjectNo()).getProjectName() + " = > " + projectList.getProjectName();
		}

		if(!(projectList.getProjectContent().equals(service.getProjectInfo(projectList.getProjectNo()).getProjectContent())))
		{
			content += "ProjectContent 변경 : " + service.getProjectInfo(projectList.getProjectNo()).getProjectContent() + " = > " + projectList.getProjectContent();
		}
		
		if(!(projectList.getStartDate().equals(service.getProjectInfo(projectList.getProjectNo()).getStartDate().substring(0, 10))))
		{
			content += "startDate 변경 :" + service.getProjectInfo(projectList.getProjectNo()).getStartDate().substring(0, 10) + " = > " + projectList.getStartDate(); 
		}
		
		if(!(projectList.getDueDate().equals(service.getProjectInfo(projectList.getProjectNo()).getDueDate().substring(0, 10))))
		{
			content += "DueDate 변경 :" + service.getProjectInfo(projectList.getProjectNo()).getDueDate().substring(0, 10) + " = > " + projectList.getDueDate(); 
		}
		
		System.out.println(content); // CONTENT 값 확인 
		
		history.setLogContent(content); //CONTENT값 VO에 세팅
		historyService.addHistory(history); //history 디비에 히스토리정보 저장

	
		service.projectUpdate(projectList);

		
		
		return "redirect:projectList";	
		
	}
	
	@RequestMapping(value = "projectInfo", method = RequestMethod.GET)
	public String projectInfo(ProjectVO pvo, Model model) {

	System.out.println(pvo.toString());
	int projectNo = pvo.getProjectNo();
	
	service.getProjectInfo(projectNo);

	model.addAttribute("pvo",service.getProjectInfo(projectNo));
	
	
		return "projectInfo";	
	}
	
	public void projectHistory(HistoryVO history, String userName)
	{
		history.setCodeNo(CODENO);
		
		String content = userName  + "님이"; 
		content += history.getProjectNo() + "번";
		content += service.getprojectName(history.getProjectNo());
		content += historyService.getCodeContent(CODENO) + "을/를";
		content += historyService.getCdContent(history) + "햇엉"; // 저장될 문자열 작성 CONTENT
		
		System.out.println(content); // CONTENT 값 확인 
		
		history.setLogContent(content); //CONTENT값 VO에 세팅
		historyService.addHistory(history); //history 디비에 히스토리정보 저장
	}
}
	
	
	

