package scit.master.planbe.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.PlanVO;
import scit.master.planbe.VO.TaskVO;
import scit.master.planbe.dao.PlanDAOImpl;

@Service
public class PlanServiceImpl implements PlanService{

	@Autowired
	PlanDAOImpl dao;


	
	// 일정 생성하기
	@Override
	public void insertPlan(PlanVO planVO) {
		dao.insertPlan(planVO);
				
	}


	// 일정 수정하기
	@Override
	public void updatePlan(PlanVO planVO) {
		dao.updatePlan(planVO);
		
	}


	// 일정 찾기
	@Override
	public PlanVO searchPlan(int calNo) {
		return dao.searchPlan(calNo);
	}


	// 일정 삭제하기
	@Override
	public void deletePlan(int calNo) {
		dao.deletePlan(calNo);
		
	}


	// 일정 리스트 가져오기
	@Override
	public ArrayList<PlanVO> getList(int userno) {
		return 	dao.getList(userno);
	}
	
}
	



