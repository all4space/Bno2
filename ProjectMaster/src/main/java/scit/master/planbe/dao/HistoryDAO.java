package scit.master.planbe.dao;

import scit.master.planbe.VO.HistoryVO;

public interface HistoryDAO {

	public String getCodeContent(int CODENO);

	public String getCdContent(HistoryVO history);

	public void addHistory(HistoryVO history);
	
		
}
