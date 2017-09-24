package scit.master.planbe.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.dao.MemberDAOImpl;


@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDAOImpl dao;
	
	@Override
	public void ManagerAdd(MemberVO memberVo) {
		dao.ManagerAdd(memberVo);
		
	}
	
	@Override
	public void MemberAdd(MemberVO memberVo) {
		dao.MemberAdd(memberVo);
	}

	@Override
	public HashMap<String,Object> getProjectList(String userId) { // user가 속한 projectno 을 member 테이블로부터 가져온다, 그리고 project정보가져옴
		ArrayList<MemberVO> noAndstatus = dao.getMyProject(userId);
		ArrayList<Integer> projectNo = new ArrayList<>();

		for (MemberVO memberVO : noAndstatus) {
			projectNo.add(memberVO.getProjectNo());
		};
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("member", noAndstatus);
		map.put("project", dao.getProjectInfo(projectNo));
		
		return map;
	}

	@Override
	public ArrayList<Integer> getProjectNo(String userId) {
		return dao.getProjectNo(userId);
	}
	@Override
	public ArrayList<MemberVO> getMemberList(int projectNo) {
		return dao.getMemberList(projectNo);
	}
	@Override
	public boolean favoriteAdd(MemberVO memberVo) {
		return dao.favoriteAdd(memberVo);
	}
	@Override
	public boolean favoriteDelete(MemberVO memberVo) {
		return dao.favoriteDelete(memberVo);
	}
	@Override
	public ArrayList<MemberVO> getFavorite(int userNo) {
		return dao.getFavorite(userNo);
	}
}
