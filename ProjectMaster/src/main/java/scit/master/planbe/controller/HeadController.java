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
import org.springframework.web.bind.support.SessionStatus;

import scit.master.planbe.VO.TaskVO;
import scit.master.planbe.service.HeadServiceImpl;

@RequestMapping("/head")
@Controller
public class HeadController {

	@Autowired
	HeadServiceImpl service;
	
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
		request.setAttribute("taskCount", service.getTaskCount(userNo));
		HashMap<String,Object> map = new HashMap<>();
		map.put("taskList", taskList );
		map.put("taskCount", service.getTaskCount(userNo));
		System.out.println("안녕히가세요 컨트롤러 였습니다.");
		return map;
	}
}
