package scit.master.planbe.service;

import java.util.ArrayList;

import scit.master.planbe.VO.HistoryVO;

public interface HistoryService {

	public String getCodeContent(int CODENO);

	public String getCdContent(HistoryVO history);

	public void addHistory(HistoryVO history);

	public ArrayList<HistoryVO> getHistoryList(int userNo);

}
