package scit.master.planbe.dao;

import scit.master.planbe.VO.HistoryVO;

public interface HistoryMapper {

	public String getCodeContent(int cODENO);

	public String getCdContent(HistoryVO history);

	public void addHistory(HistoryVO history);
	       
	
}
   
