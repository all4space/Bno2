package scit.master.planbe.service;

import java.util.ArrayList;

import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.PlanVO;
import scit.master.planbe.VO.TaskVO;

public interface PlanService {
	

	public void insertPlan(PlanVO planVO); // 일정 생성하기
	
	public void updatePlan(PlanVO planVO); // 일정 수정하기
	
	public PlanVO searchPlan(int calNo); // 일정 찾기
	
	public void deletePlan(int calNo); // 일정 삭제하기
	
	public ArrayList<PlanVO>getList(int userno);// 일정 리스트 가져오기
	
	
	
 
}
