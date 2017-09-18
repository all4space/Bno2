package scit.master.planbe.service;

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
}
