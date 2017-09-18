package scit.master.planbe.VO;

public class HistoryVO {

	private int projectNo;
	private String logTime;
	private String logContent;
	private String CdSelect;
	private int CodeNo;
	private int UserNo;
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public String getLogTime() {
		return logTime;
	}
	public void setLogTime(String logTime) {
		this.logTime = logTime;
	}
	public String getLogContent() {
		return logContent;
	}
	public void setLogContent(String logContent) {
		this.logContent = logContent;
	}
	public String getCdSelect() {
		return CdSelect;
	}
	public void setCdSelect(String cdSelect) {
		CdSelect = cdSelect;
	}
	public int getCodeNo() {
		return CodeNo;
	}
	public void setCodeNo(int codeNo) {
		CodeNo = codeNo;
	}
	public int getUserNo() {
		return UserNo;
	}
	public void setUserNo(int userNo) {
		UserNo = userNo;
	}
	@Override
	public String toString() {
		return "HistoryVO [projectNo=" + projectNo + ", logTime=" + logTime + ", logContent=" + logContent
				+ ", CdSelect=" + CdSelect + ", CodeNo=" + CodeNo + ", UserNo=" + UserNo + "]";
	}
	
	
}