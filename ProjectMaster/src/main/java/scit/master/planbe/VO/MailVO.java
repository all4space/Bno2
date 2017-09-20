package scit.master.planbe.VO;

public class MailVO {

	private int mailNo;
	private int userNo;
	private String mailTitle;
	private String mailContent;
	private String receiveProject;
	private String receiveMember;
	private String mailPriority;
	private String sendDate; 
	
	public MailVO(){}

	public MailVO(int mailNo, int userNo, String mailTitle, String mailContent, String receiveProject,
			String receiveMember, String mailPriority, String sendDate) {
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

	public String getReceiveProject() {
		return receiveProject;
	}

	public void setReceiveProject(String receiveProject) {
		this.receiveProject = receiveProject;
	}

	public String getReceiveMember() {
		return receiveMember;
	}

	public void setReceiveMember(String receiveMember) {
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
	

    
	 

	

	
	
