package scit.master.planbe.VO;


public class MailVO {

	private int mailNo;
	private int userNo;
	private String mailTitle;
	private String mailContent;
	private int receiveProject;
	private int receiveMember;
	private String mailTag;
	private String sendDate;
    private String checkMail;
	
    public MailVO(){}

	public MailVO(int mailNo, int userNo, String mailTitle, String mailContent, int receiveProject, int receiveMember,
			String mailTag, String sendDate, String checkMail) {
		super();
		this.mailNo = mailNo;
		this.userNo = userNo;
		this.mailTitle = mailTitle;
		this.mailContent = mailContent;
		this.receiveProject = receiveProject;
		this.receiveMember = receiveMember;
		this.mailTag = mailTag;
		this.sendDate = sendDate;
		this.checkMail = checkMail;
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

	public int getReceiveProject() {
		return receiveProject;
	}

	public void setReceiveProject(int receiveProject) {
		this.receiveProject = receiveProject;
	}

	public int getReceiveMember() {
		return receiveMember;
	}

	public void setReceiveMember(int receiveMember) {
		this.receiveMember = receiveMember;
	}

	public String getMailTag() {
		return mailTag;
	}

	public void setMailTag(String mailTag) {
		this.mailTag = mailTag;
	}

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	public String getCheckMail() {
		return checkMail;
	}

	public void setCheckMail(String checkMail) {
		this.checkMail = checkMail;
	}

	@Override
	public String toString() {
		return "MailVO [mailNo=" + mailNo + ", userNo=" + userNo + ", mailTitle=" + mailTitle + ", mailContent="
				+ mailContent + ", receiveProject=" + receiveProject + ", receiveMember=" + receiveMember + ", mailTag="
				+ mailTag + ", sendDate=" + sendDate + ", checkMail=" + checkMail + "]";
	}
	
} 
	
    
	

	

	

    
	 

	

	
	
