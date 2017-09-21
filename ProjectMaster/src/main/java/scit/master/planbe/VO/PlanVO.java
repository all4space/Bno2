package scit.master.planbe.VO;

import java.util.Date;

public class PlanVO {
	
	private int calNo;
	private int userNo;
	private String startDate;
	private String startTime;
	private String endDate;
	private String endTime;
	private String title;
	private String content;
	
	
	public PlanVO() {
		super();
	}


	public PlanVO(int calNo, int userNo, String startDate, String startTime, String endDate, String endTime,
			String title, String content) {
		super();
		this.calNo = calNo;
		this.userNo = userNo;
		this.startDate = startDate;
		this.startTime = startTime;
		this.endDate = endDate;
		this.endTime = endTime;
		this.title = title;
		this.content = content;
	}


	public int getCalNo() {
		return calNo;
	}


	public void setCalNo(int calNo) {
		this.calNo = calNo;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getStartTime() {
		return startTime;
	}


	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}


	public String getEndTime() {
		return endTime;
	}


	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	@Override
	public String toString() {
		return "PlanVO [calNo=" + calNo + ", userNo=" + userNo + ", startDate=" + startDate
				+ ", startTime=" + startTime + ", endDate=" + endDate + ", endTime=" + endTime + ", title=" + title
				+ ", content=" + content + "]";
	}



}
