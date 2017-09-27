package scit.master.planbe.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import scit.master.planbe.VO.HistoryVO;
import scit.master.planbe.VO.MailVO;
import scit.master.planbe.VO.TaskVO;
import scit.master.planbe.service.HeadServiceImpl;
import scit.master.planbe.service.HistoryServiceImpl;
import scit.master.planbe.service.MailServiceImpl;

@RequestMapping("/head")
@Controller
public class HeadController {

	@Autowired
	HeadServiceImpl service;
	
	@Autowired
	HistoryServiceImpl historyService;
	
	@Autowired
	MailServiceImpl mailService;
	
	
	@RequestMapping(value = "getTask", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String,Object> getTask(HttpSession session, HttpServletRequest request) {
		System.out.println("어서 오세요 컨트롤러 입니다.");
		int userNo = (int) session.getAttribute("userno");
		ArrayList<TaskVO> taskList = service.getTask(userNo);
	
		for (TaskVO taskVO : taskList) {
			double donetime = taskVO.getDoneTime(); double totalTime = taskVO.getTotalTime();
			int percent =  (int) Math.round((donetime / totalTime) * 100);
			taskVO.setDoneTime(percent);
		}
		HashMap<String,Object> map = new HashMap<>();
		map.put("taskList", taskList );
		map.put("taskCount", service.getTaskCount(userNo));
		System.out.println("안녕히가세요 컨트롤러 였습니다.");
		return map;
	}
	
	@RequestMapping(value = "getHistory", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<HistoryVO> getHistory(HttpSession session, HttpServletRequest request) {
		
		System.out.println("여기는 히스토리 컨트롤입니다..");
		
		int userNo = (int) session.getAttribute("userno");
		ArrayList<HistoryVO> history = historyService.getHistory(userNo);
				
		System.out.println(history.toString());
		
		return history;
	}
	@RequestMapping(value = "getMail", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String,Object> getMail(HttpSession session, HttpServletRequest request) {
		
		System.out.println("여기는 메이루 컨트롤입니다..");
		
		int userNo = (int) session.getAttribute("userno");
		
		ArrayList<MailVO> mail = mailService.mailList(userNo);
		ArrayList<String> userName = new ArrayList<>();
		
		for(int i = 0; i < mail.size(); i++)
		{
			userName.add(mailService.getUserName(mail.get(i).getUserNo())); 
		}
		
		System.out.println(userName.toString());
		System.out.println(mail.toString());
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("mailList", mail );
		map.put("userName", userName);
		
		
		return map;
	}
}
