package scit.master.planbe.service;

import scit.master.planbe.VO.HistoryVO;

public interface HistoryService {

	public String getCodeContent(int CODENO);

	public String getCdContent(HistoryVO history);

	public void addHistory(HistoryVO history);

}
