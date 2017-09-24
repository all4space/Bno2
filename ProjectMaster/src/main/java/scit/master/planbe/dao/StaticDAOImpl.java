package scit.master.planbe.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.VO.TaskVO;
import scit.master.planbe.VO.UsersVO;


@Repository
public class StaticDAOImpl implements StaticDAO {

	@Autowired
	SqlSession Sqlsession;

	@Override
	public ArrayList<ProjectVO> getProjectList(ArrayList<Integer> pnoList) {
		StaticMapper mapper = Sqlsession.getMapper(StaticMapper.class);
		System.out.println(pnoList+"dao");
		System.out.println(mapper.getProjectList(pnoList));
		return mapper.getProjectList(pnoList);  
	}

	@Override
	public ArrayList<TaskVO> taskProgressOfDisease(ArrayList<Integer> pnoList) {
		StaticMapper mapper = Sqlsession.getMapper(StaticMapper.class);
		return mapper.taskProgressOfDisease(pnoList);
	}

	@Override
	public ArrayList<TaskVO> progress(ProjectVO vo) {
		StaticMapper mapper = Sqlsession.getMapper(StaticMapper.class);
		return mapper.progress(vo);
	}

	@Override
	public ArrayList<MemberVO> usernoGetMember(ArrayList<Integer> memberNoList) { //UsersVO 반환 userno가지고
		StaticMapper mapper = Sqlsession.getMapper(StaticMapper.class);
		return mapper.usernoGetMember(memberNoList);
	}
	
	@Override
	public ArrayList<UsersVO> taskOfusersName(ArrayList<MemberVO> usersNoList) {
		StaticMapper mapper = Sqlsession.getMapper(StaticMapper.class);
		return mapper.taskOfusersName(usersNoList);
	}

	@Override
	public ArrayList<TaskVO> efficienty(ProjectVO vo) {
		StaticMapper mapper = Sqlsession.getMapper(StaticMapper.class);
		System.out.println("들어오미까 dao11" + vo);
		System.out.println("들어오미까 dao22" + mapper.efficienty(vo));
		return mapper.efficienty(vo);
	}

	
	
	

}
