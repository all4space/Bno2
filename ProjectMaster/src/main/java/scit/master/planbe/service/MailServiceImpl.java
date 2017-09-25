package scit.master.planbe.service;


import java.util.ArrayList;

import javax.jws.soap.SOAPBinding.Use;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import scit.master.planbe.VO.MailVO;
import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.VO.UsersVO;
import scit.master.planbe.dao.MailDAOImpl;


@Service
public class MailServiceImpl implements MailService {

	@Autowired
	MailDAOImpl dao;
	
	@Override
	public UsersVO getUserInfo(String userId) {
        return dao.getUserInfo(userId);		
	}

	@Override
	public ArrayList<ProjectVO> getAllProjectList(String groupName) {
		return dao.getAllProjectList(groupName);
	}

	@Override
	public ArrayList<UsersVO> getAllMemberList(String groupName) {
        return dao.getAllMemberList(groupName);
	}

	@Override
	public ArrayList<ProjectVO> getMyProjectList(int userNo) {
        return dao.getMyProjectList(userNo);
	}

	@Override
	public ArrayList<MemberVO> getMyMemberInfo(int projectNo) {
		return dao.getMyMemberInfo(projectNo);
	}

	@Override
	public UsersVO getUserInfo2(int userNo) {
		return dao.getUserInfo2(userNo);
	}

	@Override
	public boolean sendMail(MailVO vo) {
		if(dao.sendMail(vo) == 1) return true;
		return false;
	}

	@Override
	public ArrayList<MailVO> getMemberMailList(int userNo) {
		return dao.getMemberMailList(userNo);
	}

	@Override
	public ArrayList<MailVO> getProjectMailList(int userNo) {
		return dao.getProjectMailList(userNo);
	}

	@Override
	public ArrayList<MailVO> getMySendMailList(int userNo) {
		return dao.getMySendMailList(userNo);
	}

	@Override
	public String getProjectName(int projectNo) {
        return dao.getProjectName(projectNo);
 	}

	@Override
	public String getUserName(int userNo) {
		return dao.getUserName(userNo);
	}

	@Override
	public MailVO getMailInfo(int mailNo) {
		return dao.getMailInfo(mailNo);
	}

	@Override
	public boolean checkMail(int mailNo) {
		if(dao.checkMail(mailNo) == 1) return true;
		return false;
	}

	@Override
	public boolean deleteMail(int mailNo) {
		if(dao.deleteMail(mailNo) == 1) return true;
		return false;
	}

}

		

	



	





	 
	


	



