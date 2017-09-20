package scit.master.planbe.dao;

import java.util.ArrayList;

import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.VO.TaskVO;
import scit.master.planbe.VO.UsersVO;

public interface TaskDAO {
	public void Insert(TaskVO taskVo,UsersVO userVO); // 업무 생성
	public ArrayList<TaskVO> getList(String searchtype,String searchword,String target,int userno, int startRecord, int countPerPage);//업무 리스트 출력하기
	public TaskVO findTask(TaskVO taskVo); // 업무 찾기
	public void updateTask(TaskVO taskVo); // 업무 수정하기
	public int getTotalCount(String searchtype,String searchword,String target,int userno); // 총 레코드 수 가져오기
	public ArrayList<ProjectVO>projectNoList(MemberVO memberVO); // 프로젝트 넘버 가져오기
	public TaskVO searchTask(String searchtype, String searchword,int userno,int taskNo); // progress 에서 task 가져오기
	public ArrayList<TaskVO> getTotalList(int userno); // 전체 리스트 수 (페이지 수와 상관없이) 가져오기
	public int getTaskCount(int userNo);//task 갯수세기
	
}

