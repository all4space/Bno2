package scit.master.planbe.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.VO.TaskVO;
import scit.master.planbe.VO.UsersVO;

public interface TaskService {
	
	

public ArrayList<TaskVO> getList(String searchtype,String searchword, String target, int userno, int startRecord, int countPerPage);//업무 리스트 출력하기

public void updateTask(TaskVO taskVo);//업무 리스트 수정

public ArrayList<TaskVO> Day(TaskVO task);//일별 업무 리스트

public ArrayList<TaskVO> Week(TaskVO task);//주별 업무 리스트

public ArrayList<TaskVO> Month(TaskVO task);//월별 업무 리스트

public TaskVO Search(TaskVO taskVo);//업무  검색

public void Insert(TaskVO task, int userno);//업무생성.

public void DownLoad(TaskVO task);//다운로드.

public ArrayList<MemberVO>ContactInfo();//컨텍트 정보.

public void deleteTask(TaskVO taskVo);// 업무 삭제

public TaskVO searchTask(String a, String b, int userno, int taskNo); // prgress에서 task 가져오기

public int getTotalCount(String searchtype,String searchword,String target, int userno); // 총 레코드 수 가져오기.

public void excelList(HttpServletResponse response, String searchtype, String searchword, int userno, String target, int startRecord, int countPerPage); // 엑셀 다운로드 

public ArrayList<ProjectVO> projectNoList(MemberVO memberVO); // 프로젝트 넘버 가져오기

public UsersVO userInfo(String attribute); // userno 가져오기

public ArrayList<TaskVO>getTotalList(int userno); // 전체 리스트 (페이지 수와 상관없이) 가져오기




	
	
}//TaskController


