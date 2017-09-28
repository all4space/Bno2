package scit.master.planbe.dao;

import java.util.ArrayList;

import scit.master.planbe.VO.HistoryVO;

public interface HistoryDAO {

	public String getCodeContent(int CODENO);

	public String getCdContent(HistoryVO history);

	public void addHistory(HistoryVO history);

	public ArrayList<HistoryVO> getHistoryList(int userNo);

	public ArrayList<HistoryVO> getHistory(int userNo);
	
	public ArrayList<HistoryVO> getProjectHistory(ArrayList<Integer> pno);	
}
