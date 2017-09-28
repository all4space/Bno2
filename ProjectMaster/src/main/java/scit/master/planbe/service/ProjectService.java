package scit.master.planbe.service;

import java.util.ArrayList;

import scit.master.planbe.VO.HistoryVO;
import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.VO.UsersVO;

public interface ProjectService { //�깮�꽦
	
	public int projectAdd(ProjectVO projectVo);
	public boolean projectModify(UsersVO vo);
	public ProjectVO getProject(int projectNo);// projectNo�� �씪移섑븯�뒗 project �젙蹂� 媛��졇�삤湲�
	public ArrayList<ProjectVO> getProjectList(int userNo);
	public int projectDelete(int projectNo); // �봽濡쒖젥�듃 �궘�젣
	public void projectUpdate(ProjectVO projectList);
	public String getprojectName(int projectNo);
	public ArrayList<ProjectVO> getCtoProjectList(String groupName);
}
