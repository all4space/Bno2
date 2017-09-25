package scit.master.planbe.service;

import java.util.ArrayList;
import java.util.HashMap;

import scit.master.planbe.VO.MemberVO;

public interface MemberService {

	public void ManagerAdd(MemberVO memberVo);
	public void MemberAdd(MemberVO memberVo);
	
	public HashMap<String,Object> getProjectList(String userId);
	public ArrayList<Integer> getProjectNo(String userId);
	public ArrayList<MemberVO> getMemberList(int projectNo);
	public boolean favoriteAdd(MemberVO memberVo);
	public boolean favoriteDelete(MemberVO memberVo);
	public ArrayList<MemberVO> getFavorite(int userNo);


}
