package scit.master.planbe.service;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.poi.sl.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.VO.TaskVO;
import scit.master.planbe.VO.UsersVO;
import scit.master.planbe.dao.TaskDAOImpl;
import scit.master.planbe.dao.UsersDAOImpl;

@Service
public class TaskServiceImpl implements TaskService{
	
	
	@Autowired
	TaskDAOImpl taskDao;
	
	@Autowired
	SqlSessionFactory sqlSessionFactory; 

	@Autowired
	UsersDAOImpl dao;

	@Override
	public ArrayList<TaskVO> Day(TaskVO task) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<TaskVO> Week(TaskVO task) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<TaskVO> Month(TaskVO task) {
		// TODO Auto-generated method stub
		return null;
	}

	//업무 생성하기
	@Override
	public void Insert(TaskVO task,int userno) {
		taskDao.Insert(task,userno);				
	}

	@Override
	public void DownLoad(TaskVO task) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<MemberVO> ContactInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	//업무 리스트 출력하기
	@Override
	public ArrayList<TaskVO> getList(String searchtype, String searchword, String target,int userno, int startRecord, int countPerPage) {

		return taskDao.getList(searchtype,searchword,target,userno,startRecord,countPerPage);
	}

	@Override
	public TaskVO Search(TaskVO taskVo) {
		return taskDao.findTask(taskVo);
	}

	
	// 업무 수정하기
	@Override
	public void updateTask(TaskVO taskVo) {
		taskDao.updateTask(taskVo);
		
	}

	@Override
	public void deleteTask(TaskVO taskVo) {
		taskDao.deleteTask(taskVo);
		
	}

	// progress에서 task 검색
	@Override
	public TaskVO searchTask(String searchtype, String searchword,int userno,int taskNo) {
		return taskDao.searchTask(searchtype,searchword,userno,taskNo);
	}
	
	// 총 페이지 레코드 가져오기
	@Override
	public int getTotalCount(String searchtype, String searchword,String target,int userno) {
		return taskDao.getTotalCount(searchtype,searchword,target,userno);
	}

	// 엑셀 다운로드
	
	@Override
	@Transactional
	public void excelList(HttpServletResponse response, String searchtype, String searchword, int userno, String target, int startRecord, int countPerPage) {
	
		SqlSession sqlsession = sqlSessionFactory.openSession();
		
		SXSSFWorkbook wb=new SXSSFWorkbook();
		SXSSFSheet sheet = wb.createSheet();
		
		RowBounds rb = new RowBounds(startRecord,countPerPage);
		Map<String, Object>map=new HashMap<>();
		map.put("searchtype", searchtype);
		map.put("searchword", searchword);
		map.put("target", target);
		map.put("userno", userno);
		
	
		
		try {
		sqlsession.select("getTotalList", userno, new ResultHandler<TaskVO>(){
			
			@Override
			public void handleResult(ResultContext<? extends TaskVO> resultContext) {
				
				TaskVO task = resultContext.getResultObject();
				    Row row =  sheet.createRow(resultContext.getResultCount() - 1);
			    	Cell cell = null;
			    	
			    		        			    	
			    	cell = row.createCell(0);
			    	cell.setCellValue(task.getProjectNo());
			        cell = row.createCell(1);
			        cell.setCellValue(task.getMemberNo());
			        cell = row.createCell(2);
			        cell.setCellValue(task.getTaskNo());
			        cell = row.createCell(3);
			        cell.setCellValue(task.getTaskName());
			        cell = row.createCell(4);
			        cell.setCellValue(task.getTaskContent());
			        cell = row.createCell(5);
			        cell.setCellValue(task.getTaskPriority());
			        cell = row.createCell(6);
			        cell.setCellValue(task.getTaskStatus());
			        cell = row.createCell(7);
			        cell.setCellValue(task.getStartDate());
			        cell = row.createCell(8);
			        cell.setCellValue(task.getDueDate());
			        cell = row.createCell(9);
			        cell.setCellValue(task.getTotalTime());
			        cell = row.createCell(10);
			        cell.setCellValue(task.getDoneTime());
				
		        
			}
		
		});
		
		response.setHeader("Set-Cookie", "fileDownload=true; path=/");
		response.setHeader("Content-Disposition", String.format("attachment; filename=\"TaskList.xlsx\""));
		wb.write(response.getOutputStream());
		} catch (IOException e) {
			response.setHeader("Set-Cookie", "fileDownload=false; path=/");
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Content-Type","text/html; charset=utf-8");
			
			OutputStream out = null;
			e.printStackTrace();
		}
		
			
		
		
	}

	
	// 프로젝트 넘버 가져오기
	@Override
	public ArrayList<ProjectVO> projectNoList(MemberVO memberVO) {
		taskDao.projectNoList(memberVO);
		return null;
	}

	// userno 가져오기
	@Override
	public UsersVO userInfo(String loginId) {
		dao.idCheck(loginId);
		return null;
	}

	// 전체 리스트 ( 페이지 수와 상관없이) 가져오기
	@Override
	public ArrayList<TaskVO> getTotalList(int userno) {		
		return taskDao.getTotalList(userno);
	}



	
}


	




