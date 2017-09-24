package scit.master.planbe.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import scit.master.planbe.VO.MailVO;
import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.VO.UsersVO;


@Repository
public class MailDAOImpl implements MailDAO {

	@Autowired
	SqlSession Sqlsession;

	@Override
	public UsersVO getUserInfo(String userId) {
		MailMapper mapper = Sqlsession.getMapper(MailMapper.class);
		return mapper.getUserInfo(userId);
	}

	@Override
	public ArrayList<ProjectVO> getAllProjectList(String groupName) {
		MailMapper mapper = Sqlsession.getMapper(MailMapper.class);
		return mapper.getAllProjectList(groupName);
	}

	@Override
	public ArrayList<UsersVO> getAllMemberList(String groupName) {
		MailMapper mapper = Sqlsession.getMapper(MailMapper.class);
		return mapper.getAllMemberList(groupName);
	}

	@Override
	public ArrayList<ProjectVO> getMyProjectList(int userNo) {
		MailMapper mapper = Sqlsession.getMapper(MailMapper.class);
		return mapper.getMyProjectList(userNo);
	}

	@Override
	public ArrayList<MemberVO> getMyMemberInfo(int projectNo) {
		MailMapper mapper = Sqlsession.getMapper(MailMapper.class);
		return mapper.getMyMemberInfo(projectNo);
	}

	@Override
	public UsersVO getUserInfo2(int userNo) {
		MailMapper mapper = Sqlsession.getMapper(MailMapper.class);
		return mapper.getUserInfo2(userNo);
	}

	@Override
	public int sendMail(MailVO vo) {
		MailMapper mapper = Sqlsession.getMapper(MailMapper.class);
		return mapper.sendMail(vo);
	}

	@Override
	public ArrayList<MailVO> getMemberMailList(int userNo) {
		MailMapper mapper = Sqlsession.getMapper(MailMapper.class);
		return mapper.getMemberMailList(userNo);
	}

	@Override
	public ArrayList<MailVO> getProjectMailList(int userNo) {
		MailMapper mapper = Sqlsession.getMapper(MailMapper.class);
		return mapper.getProjectMailList(userNo);
	}

	@Override
	public ArrayList<MailVO> getMySendMailList(int userNo) {
		MailMapper mapper = Sqlsession.getMapper(MailMapper.class);
		return mapper.getMySendMailList(userNo);
	}

	@Override
	public String getProjectName(int projectNo) {
		MailMapper mapper = Sqlsession.getMapper(MailMapper.class);
		return mapper.getProjectName(projectNo);
	}

	@Override
	public String getUserName(int userNo) {
		MailMapper mapper = Sqlsession.getMapper(MailMapper.class);
		return mapper.getUserName(userNo);
	}
	
}






	
	
	
	





	
