package scit.master.planbe.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import scit.master.planbe.VO.PlanVO;


@Repository
public class PlanDAOImpl implements PlanDAO {

	@Autowired
	SqlSession Sqlsession;

	@Override
	public void insertPlan(PlanVO planVO) {
		PlanMapper mapper = Sqlsession.getMapper(PlanMapper.class);
		System.out.println(planVO);
		mapper.insertPlan(planVO);
		
	}  
	
	
	

}
