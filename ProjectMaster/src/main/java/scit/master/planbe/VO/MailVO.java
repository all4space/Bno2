package scit.master.planbe.VO;

import java.util.ArrayList;

public class MailVO {

	private int mailNo;
	private int userNo;
	private String mailTitle;
	private String mailContent;
	private ArrayList<Integer> receiveProject;
	private ArrayList<Integer> receiveMember;
	private String mailPriority;
	private String sendDate; 
	
	public MailVO(){}

	public MailVO(int mailNo, int userNo, String mailTitle, String mailContent, ArrayList<Integer> receiveProject,
			ArrayList<Integer> receiveMember, String mailPriority, String sendDate) {
		super();
		this.mailNo = mailNo;
		this.userNo = userNo;
		this.mailTitle = mailTitle;
		this.mailContent = mailContent;
		this.receiveProject = receiveProject;
		this.receiveMember = receiveMember;
		this.mailPriority = mailPriority;
		this.sendDate = sendDate;
	}

	public int getMailNo() {
		return mailNo;
	}

	public void setMailNo(int mailNo) {
		this.mailNo = mailNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getMailTitle() {
		return mailTitle;
	}

	public void setMailTitle(String mailTitle) {
		this.mailTitle = mailTitle;
	}

	public String getMailContent() {
		return mailContent;
	}

	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}

	public ArrayList<Integer> getReceiveProject() {
		return receiveProject;
	}

	public void setReceiveProject(ArrayList<Integer> receiveProject) {
		this.receiveProject = receiveProject;
	}

	public ArrayList<Integer> getReceiveMember() {
		return receiveMember;
	}

	public void setReceiveMember(ArrayList<Integer> receiveMember) {
		this.receiveMember = receiveMember;
	}

	public String getMailPriority() {
		return mailPriority;
	}

	public void setMailPriority(String mailPriority) {
		this.mailPriority = mailPriority;
	}

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	@Override
	public String toString() {
		return "MailVO [mailNo=" + mailNo + ", userNo=" + userNo + ", mailTitle=" + mailTitle + ", mailContent="
				+ mailContent + ", receiveProject=" + receiveProject + ", receiveMember=" + receiveMember
				+ ", mailPriority=" + mailPriority + ", sendDate=" + sendDate + "]";
	}

}
    
	 

	

	
	
