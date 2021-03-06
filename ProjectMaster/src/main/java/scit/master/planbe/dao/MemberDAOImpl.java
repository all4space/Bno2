package scit.master.planbe.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.ProjectVO;


@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession Sqlsession;

	@Override
	public void ManagerAdd(MemberVO memberVo) {
		MemberMapper mapper = Sqlsession.getMapper(MemberMapper.class);
		mapper.ManagerAdd(memberVo);
	}
	
	@Override
	public void MemberAdd(MemberVO memberVo) {
		MemberMapper mapper = Sqlsession.getMapper(MemberMapper.class);
		mapper.MemberAdd(memberVo);	
	}  
	
	@Override
	public ArrayList<MemberVO> getMyProject(String userId) {
		MemberMapper mapper = Sqlsession.getMapper(MemberMapper.class);
		return mapper.getMyProject(userId);
	}  
	
	@Override
	public ArrayList<ProjectVO> getProjectInfo(ArrayList<Integer> projectNo) {
		StaticMapper mapper = Sqlsession.getMapper(StaticMapper.class);
		return mapper.getProjectList(projectNo);
	}

	@Override
	public ArrayList<Integer> getProjectNo(String userId) {
		System.out.println("다오다오 안들어와?");
		System.out.println("dao : "+userId );
		MemberMapper mapper = Sqlsession.getMapper(MemberMapper.class);
		return mapper.getProjectNo(userId);
	}
	@Override
	public ArrayList<MemberVO> getMemberList(int projectNo) {
		MemberMapper mapper = Sqlsession.getMapper(MemberMapper.class);
		return mapper.getMemberList(projectNo);
	}
	@Override
	public boolean favoriteAdd(MemberVO memberVo) {
		MemberMapper mapper = Sqlsession.getMapper(MemberMapper.class);
		return mapper.favoriteAdd(memberVo);
	}
	@Override
	public boolean favoriteDelete(MemberVO memberVo) {
		MemberMapper mapper = Sqlsession.getMapper(MemberMapper.class);
		return mapper.favoriteDelete(memberVo);
	}
	@Override
	public ArrayList<MemberVO> getFavorite(int userNo) {
		MemberMapper mapper = Sqlsession.getMapper(MemberMapper.class);
		return mapper.getFavorite(userNo);
	}
}
