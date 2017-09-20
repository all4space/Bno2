package scit.master.planbe.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import scit.master.planbe.VO.TaskVO;
import scit.master.planbe.dao.TaskDAOImpl;

@Service
public class HeadServiceImpl implements HeadService{

	@Autowired
	TaskDAOImpl dao;

	@Override
	public ArrayList<TaskVO> getTask(int userNo) {
		System.out.println("service : "+ userNo);
		return dao.getList(null, null, null, userNo, 0, 5); 
	}

	@Override
	public int getTaskCount(int userNo) {
		return dao.getTaskCount(userNo);
	}

}
