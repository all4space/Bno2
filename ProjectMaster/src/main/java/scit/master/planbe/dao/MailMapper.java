package scit.master.planbe.dao;

import java.util.ArrayList;

import scit.master.planbe.VO.MailVO;
import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.VO.UsersVO;

public interface MailMapper {
	// groupName 가져오기     
	public UsersVO getUserInfo(String userId);
	// 그룹의 전체 프로젝트 리스트 가져오기 
	public ArrayList<ProjectVO> getAllProjectList(String groupName);
	// 그룹의 전체 user 리스트 가져오기 
	public ArrayList<UsersVO> getAllMemberList(String groupName);
	// Manager or Member가 속한 프로젝트 가져오기 
	public ArrayList<ProjectVO> getMyProjectList(int userNo);
	// Manager or Member가 속한 프로젝트에 속한 멤버 정보 가져오기 
	public ArrayList<MemberVO> getMyMemberInfo(int projectNo);
	// Manager or Member가 속한 프로젝트에 속한 멤버의 userName 가져오기
	public UsersVO getUserInfo2(int userNo);
	// sendMail
	public int sendMail(MailVO vo);
	// MemberMailList 
	public ArrayList<MailVO> getMemberMailList(int userNo);
	// ProjectMailList 
	public ArrayList<MailVO> getProjectMailList(int userNo);
	// MySendMailList
	public ArrayList<MailVO> getMySendMailList(int userNo);
	// Project Name 가져오기 
	public String getProjectName(int projectNo);
	// User Name 가져오기 
	public String getUserName(int userNo);
	// MailInfo 가져오기 
	public MailVO getMailInfo(int mailNo);
	// Check Mail
	public int checkMail(int mailNo);
	// Delete Mail
	public int deleteMail(int mailNo);
	       
}

