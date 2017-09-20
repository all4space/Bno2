package scit.master.planbe.dao;

import java.util.ArrayList;

import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.VO.TaskVO;
import scit.master.planbe.VO.UsersVO;

public interface MailDAO {
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
}
