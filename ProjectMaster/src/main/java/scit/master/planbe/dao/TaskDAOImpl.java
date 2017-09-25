package scit.master.planbe.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.VO.TaskVO;
import scit.master.planbe.VO.UsersVO;

@Repository
public class TaskDAOImpl implements TaskDAO{
	
	@Autowired
	SqlSession Sqlsession;

	
	//업무 생성하기
	@Override
	public void Insert(TaskVO taskVo,UsersVO userVO) {
		
		Map<String,Object>map=new HashMap<>();
		
		
		map.put("projectno", taskVo.getProjectNo());
		map.put("taskname", taskVo.getTaskName());
		map.put("taskcontent", taskVo.getTaskContent());
		map.put("taskpriority", taskVo.getTaskPriority());
		map.put("taskstatus", taskVo.getTaskStatus());
		map.put("taskstartdate", taskVo.getStartDate());
		map.put("taskduedate", taskVo.getDueDate());
		map.put("totaltime", taskVo.getTotalTime());
		map.put("donetime", taskVo.getDoneTime());		
		map.put("userno",userVO.getUserNo());
		
		
		System.out.println(taskVo.getStartDate());
		
		Taskmapper mapper = Sqlsession.getMapper(Taskmapper.class);
		 mapper.Insert(map);
				
	}

	// 업무 리스트 가져오기
	@Override
	public ArrayList<TaskVO> getList(String searchtype, String searchword, String target, int userno,int startRecord, int countPerPage) {
		Taskmapper mapper = Sqlsession.getMapper(Taskmapper.class);
		RowBounds rb = new RowBounds(startRecord,countPerPage);
		Map<String, Object>map=new HashMap<>();
		map.put("searchtype", searchtype);
		map.put("searchword", searchword);
		map.put("target", target);
		map.put("userno", userno);
	
		return mapper.getList(map,rb);		
	}

	// 업무 찾기
	@Override
	public TaskVO findTask(TaskVO taskVo) {		
	Taskmapper mapper = Sqlsession.getMapper(Taskmapper.class);
		return mapper.findTask(taskVo);
	}

	// 업무 수정하기
	@Override
	public void updateTask(TaskVO taskVo) {
		Taskmapper mapper = Sqlsession.getMapper(Taskmapper.class);
		 mapper.updateTask(taskVo);		
		
	}
	
	//업무 삭제하기
	public void deleteTask(TaskVO taskVo) {
		// TODO Auto-generated method stub		
		Taskmapper mapper = Sqlsession.getMapper(Taskmapper.class);
		 mapper.deleteTask(taskVo);		
				
	}
	
	
	// 총 페이지 수 가져오기.
	public int getTotalCount(String searchtype, String searchword, String target, int userno) {
		Taskmapper mapper = Sqlsession.getMapper(Taskmapper.class);
		Map<String, Object>map=new HashMap<>();
		map.put("searchtype", searchtype);
		map.put("searchword", searchword);
		map.put("target", target);
		map.put("userno", userno);
		return mapper.getTotalCount(map);		
	}

	// 프로젝트 넘버 가져오기
	@Override
	public ArrayList<ProjectVO> projectNoList(MemberVO memberVO) {
		Taskmapper mapper = Sqlsession.getMapper(Taskmapper.class);
		 mapper.projectNoList(memberVO);	
		return null;
	}

	
	// progress 에서 task 가져오기
	@Override
	public TaskVO searchTask(String searchtype, String searchword, int userno, int taskNo) {
			
		Taskmapper mapper = Sqlsession.getMapper(Taskmapper.class);
		Map<String,Object>map=new HashMap<>();
		map.put("searchtype", searchtype);
		map.put("searchword", searchword);
		map.put("userno", userno);
		map.put("taskno", taskNo);
		return mapper.searchTask(map);	
	}

	
	// 전체 리스트 수 가져오기(페이지 수와 상관없이)
	@Override
	public ArrayList<TaskVO> getTotalList(int userno) {		
		Taskmapper mapper = Sqlsession.getMapper(Taskmapper.class);
		Map<String,Object>map=new HashMap<>();	
		map.put("userno", userno);
		return mapper.getTotalList(map);	
	}

	@Override
	public int getTaskCount(int userNo) {
		Taskmapper mapper =Sqlsession.getMapper(Taskmapper.class);
		return mapper.getTaskCount(userNo);
	}
		




}
