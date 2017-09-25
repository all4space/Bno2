package scit.master.planbe.dao;

import java.util.ArrayList;

import scit.master.planbe.VO.MemberVO;

public interface MemberMapper {

	public void ManagerAdd(MemberVO memberVo);

	public void MemberAdd(MemberVO memberVo);

	public ArrayList<MemberVO> getMyProject(String userId);
	
	public ArrayList<Integer> getProjectNo(String userId);

	public ArrayList<MemberVO> getMemberList(int projectNo);

	public boolean favoriteAdd(MemberVO memberVo);

	public boolean favoriteDelete(MemberVO memberVo);

	public ArrayList<MemberVO> getFavorite(int userNo);

}