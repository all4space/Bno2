package scit.master.planbe.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import scit.master.planbe.VO.PlanVO;


@Repository
public class PlanDAOImpl implements PlanDAO {

	@Autowired
	SqlSession Sqlsession;

	// 일정 생성
	@Override
	public void insertPlan(PlanVO planVO) {
		PlanMapper mapper = Sqlsession.getMapper(PlanMapper.class);		
		mapper.insertPlan(planVO);
		
	}

	//일정 수정
	@Override
	public void updatePlan(PlanVO planVO) {
		System.out.println(planVO);
		PlanMapper mapper = Sqlsession.getMapper(PlanMapper.class);
		mapper.updatePlan(planVO);
		
	}

	
	// 일정 검색
	@Override
	public PlanVO searchPlan(int calNo) {
		PlanMapper mapper = Sqlsession.getMapper(PlanMapper.class);
		return mapper.searchPlan(calNo);
	}

	// 일정 삭제
	@Override
	public void deletePlan(int calNo) {
		PlanMapper mapper = Sqlsession.getMapper(PlanMapper.class);
		mapper.deletePlan(calNo);
			
	}

	// 일정 리스트 가져오기
	@Override
	public ArrayList<PlanVO> getList() {
		PlanMapper mapper = Sqlsession.getMapper(PlanMapper.class);
		return mapper.getList();
	}  
	
	
	

}
