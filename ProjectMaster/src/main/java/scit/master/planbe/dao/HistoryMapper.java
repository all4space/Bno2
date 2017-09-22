package scit.master.planbe.dao;

import java.util.ArrayList;

import scit.master.planbe.VO.HistoryVO;

public interface HistoryMapper {

	public String getCodeContent(int cODENO);

	public String getCdContent(HistoryVO history);

	public void addHistory(HistoryVO history);


	public ArrayList<HistoryVO> getHistoryList(int userNo);
	       
	
}
   
