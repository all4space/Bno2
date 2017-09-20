package scit.master.planbe.service;

import java.util.ArrayList;

import scit.master.planbe.VO.TaskVO;

public interface HeadService {
	
	public ArrayList<TaskVO> getTask(int userNo);
	
	public int getTaskCount(int userNo);
}
