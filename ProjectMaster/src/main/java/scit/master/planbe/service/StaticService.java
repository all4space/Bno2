package scit.master.planbe.service;

import java.util.ArrayList;

import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.VO.TaskVO;
import scit.master.planbe.VO.UsersVO;

public interface StaticService {

	public ArrayList<ProjectVO> getProjectList(ArrayList<Integer> pnoList);
	
	public ArrayList<TaskVO> taskProgressOfDisease(ArrayList<Integer> pnoList); // 팀원별 업무 진행률
	
	public ArrayList<TaskVO> progress(ProjectVO vo); // 업무별 진행률
	
	public ArrayList<UsersVO> taskOfusersName(ArrayList<Integer> usersNoList);
	
	public ArrayList<TaskVO> efficienty(ProjectVO vo);

}