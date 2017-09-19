package scit.master.planbe.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.VO.TaskVO;
import scit.master.planbe.dao.MailDAOImpl;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	MailDAOImpl dao;

	@Override
	public ArrayList<MemberVO> getMemberList(String userId) {
		return dao.getMemberList(userId);
	}

	@Override
	public ProjectVO getProjectInfo(int projectNo) {
		ProjectVO pvo = dao.getProjectInfo(projectNo);
		pvo.setStartDate(pvo.getStartDate().substring(0, 10));
		pvo.setDueDate(pvo.getDueDate().substring(0, 10));
		return pvo;
	}

	@Override
	public ArrayList<TaskVO> getTaskList(int projectNo) {
		ArrayList<TaskVO> t_list = dao.getTaskList(projectNo);
		for(TaskVO vo : t_list){
			vo.setStartDate(vo.getStartDate().substring(0, 10));
			vo.setDueDate(vo.getDueDate().substring(0, 10));
		}
		return t_list;
	}
	
	@Override
	public String getMember(int memberNo) {
		return dao.getMember(memberNo);
	}
	
	@Override
	public boolean updateTask(TaskVO vo) {
		vo.setStartDate(vo.getStartDate().substring(0, 10)); 
		vo.setDueDate(vo.getDueDate().substring(0,10)); 
		if(dao.updateTask(vo) == 1) return true;	   
		return false;
	}
	
	@Override
	public boolean deleteTask(int taskNo) {
		if(dao.deleteTask(taskNo) == 1) return true;
		return false;
	}
	
}





	 
	


	



