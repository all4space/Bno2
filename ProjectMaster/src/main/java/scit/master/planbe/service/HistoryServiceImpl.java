package scit.master.planbe.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import scit.master.planbe.VO.HistoryVO;
import scit.master.planbe.dao.HistoryDAOImpl;

@Service
public class HistoryServiceImpl implements HistoryService{

	@Autowired
	HistoryDAOImpl dao;
	
	@Override
	public String getCodeContent(int CODENO) {
		
		return dao.getCodeContent(CODENO);
		
	}
	@Override
	public String getCdContent(HistoryVO history) {
		return dao.getCdContent(history);
	}
	@Override
	public void addHistory(HistoryVO history) {
		dao.addHistory(history);
	}
	@Override
	public ArrayList<HistoryVO> getHistoryList(int userNo) {
		return dao.getHistoryList(userNo);
	}
	@Override
	public ArrayList<HistoryVO> getHistory(int userNo) {
		return dao.getHistory(userNo);
	}
	@Override
	public ArrayList<HistoryVO> getProjectHistory(ArrayList<Integer> pno) {
		return dao.getProjectHistory(pno);
	}
}
