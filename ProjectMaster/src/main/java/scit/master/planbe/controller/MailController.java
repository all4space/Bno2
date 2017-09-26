package scit.master.planbe.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import scit.master.planbe.VO.MailVO;
import scit.master.planbe.VO.MemberVO;
import scit.master.planbe.VO.ProjectVO;
import scit.master.planbe.VO.UsersVO;
import scit.master.planbe.service.MailServiceImpl;

@RequestMapping("/mail")
@Controller
public class MailController {
	
	@Autowired
    MailServiceImpl service;
	
	// MailForm 불러오기 
	@RequestMapping(value = "mailForm", method = RequestMethod.GET)
	public String mailForm() {
	        return "mailForm";
	}
	
	// SelectList 불러오기 
	@RequestMapping(value = "getSelectList", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> getSelectList(String group, HttpSession session) {
	    System.out.println(group);
	    HashMap<String, Object> map = new HashMap<>();
	    
	    String userId = (String)session.getAttribute("loginId");
	    UsersVO uvo = service.getUserInfo(userId);
	    
	    /* projectList  */	
	    if("project".equals(group)){
	    	/* CTO 권한의 경우 */
	    	if("cto".equals(uvo.getAuthority())){
	    		// CTO 그룹의 전체 프로젝트 가져오기
	    		ArrayList<ProjectVO> all_p_list = service.getAllProjectList(uvo.getGroupName());
	    		map.put("all_p_list", all_p_list);
	    	} else {
	        /* Manager or Member 권한의 경우 */
	    		// Manager or Member가 속한 프로젝트 가져오기 
	    		ArrayList<ProjectVO> my_p_list = service.getMyProjectList(uvo.getUserNo());
	    		map.put("my_p_list", my_p_list);
	    	}
	    } else if("member".equals(group)){
	    	/* CTO 권한의 경우 */
	    	if("cto".equals(uvo.getAuthority())){
	    		// CTO 그룹의 전체 멤버(user) 가져오기 
	    		ArrayList<UsersVO> all_u_list = service.getAllMemberList(uvo.getGroupName());
	    		map.put("all_u_list", all_u_list);
	    	} else {
	    	/* Manager or Member 권한의 경우 */
	    		// Manager or Member가 속한 프로젝트에 속한 멤버 가져오기
	    		ArrayList<ProjectVO> my_p_list = service.getMyProjectList(uvo.getUserNo());
	    		ArrayList<Integer> my_m_userNo = new ArrayList<>();
	    		for(ProjectVO pvo : my_p_list){
	    			ArrayList<MemberVO> m_info_list = service.getMyMemberInfo(pvo.getProjectNo());
	    			for(MemberVO mvo : m_info_list){
	    				if(!my_m_userNo.contains(mvo.getUserNo()))
	    				my_m_userNo.add(mvo.getUserNo());
	    			}//inner for
	    		}//outer for
	    		
	    		ArrayList<UsersVO> my_u_list = new ArrayList<>(); 
	    		for(int userNo : my_m_userNo){
	    			UsersVO muvo = service.getUserInfo2(userNo);
	    				my_u_list.add(muvo);
	    		}//for
	    		map.put("my_u_list", my_u_list);
	    	}//else
	    }//else
	    return map;
	}
	    

	// SendMail
	@RequestMapping(value = "sendMail", method = RequestMethod.POST)
	@ResponseBody
	public boolean sendMail(MailVO vo, HttpSession session, String p_no_list, String u_no_list) {
		System.out.println("Send Mail접근");
		boolean result=false; 
		
		String userId = (String)session.getAttribute("loginId");
		UsersVO uvo = service.getUserInfo(userId);
		vo.setUserNo(uvo.getUserNo()); 
		
		if(p_no_list != ""){
			String[] pArray = p_no_list.split(",");
			for(int i=0; i < pArray.length; i++){
                vo.setReceiveProject(Integer.parseInt(pArray[i]));				
                result = service.sendMail(vo);
                System.out.println(result);
			}
		}

		if(u_no_list != ""){
			System.out.println("멤넘" + u_no_list);
			String[] uArray = u_no_list.split(",");
			for(int i=0; i < uArray.length; i++){
                vo.setReceiveMember(Integer.parseInt(uArray[i]));				
                System.out.println(vo.getReceiveMember());
                System.out.println(vo.toString());
                result = service.sendMail(vo);
                System.out.println(result);
			}
		}
		return result;
	}
        
	
	// MailList 불러오기 
	@RequestMapping(value = "mailList", method = RequestMethod.GET)
	public String mailList(HttpSession session, Model model) {
		
		String userId = (String)session.getAttribute("loginId");
		UsersVO uvo = service.getUserInfo(userId);
		int userNo = uvo.getUserNo();
		
		/* 개인에게 온 메일리스트 가져오기  */
		ArrayList<MailVO> m_mail_list = service.getMemberMailList(userNo);
		/* 메일 송신자의 userName 가져오기 */
		ArrayList<String> u_name_list = new ArrayList<>();
		for(MailVO vo : m_mail_list){
			UsersVO uvo2 = service.getUserInfo2(vo.getUserNo());
            u_name_list.add(uvo2.getUserName());
		}
		
		/* 프로젝트에게 온 메일리스트 가져오기 */
		ArrayList<MailVO> p_mail_list = service.getProjectMailList(userNo);
        ArrayList<String> p_name_list = new ArrayList<>();
        ArrayList<String> u_name_list2 = new ArrayList<>();

        /* 메일 송신자가 지정한 projectName & 메일 송신자의 userName 가져오기 */
		for(MailVO vo : p_mail_list){
			int projectNo = vo.getReceiveProject();
			p_name_list.add(service.getProjectName(projectNo));
			UsersVO uvo2 = service.getUserInfo2(vo.getUserNo());
			u_name_list2.add(uvo2.getUserName());
		}

		
		/* 내가 보낸 메일 리스트 가져오기 */
		ArrayList<MailVO> send_mail_list = service.getMySendMailList(userNo);
		ArrayList<MailVO> send_to_M = new ArrayList<>();
		ArrayList<MailVO> send_to_P = new ArrayList<>();
		
		for(MailVO vo : send_mail_list){
		    if(vo.getReceiveProject() == 0){
			   send_to_M.add(vo);    
		    } else { 
               send_to_P.add(vo);		    	
		    }
		}
		
		/* 메일 수신자의 projectName 가져오기 */
		ArrayList<String> p_name_list2 = new ArrayList<>();
		for(MailVO vo : send_to_P){
			int projectNo = vo.getReceiveProject();
			p_name_list2.add(service.getProjectName(projectNo));
		}

		/* 메일 수신자의 userName 가져오기 */
	    ArrayList<String> u_name_list3 = new ArrayList<>(); 
	    for(MailVO vo : send_to_M){
	    	int userNo2 = vo.getReceiveMember();
	    	u_name_list3.add(service.getUserName(userNo2));
	    }
		
		model.addAttribute("m_mail_list", m_mail_list);
		model.addAttribute("u_name_list", u_name_list);
		
		model.addAttribute("p_mail_list", p_mail_list);
		model.addAttribute("p_name_list", p_name_list);
		model.addAttribute("u_name_list2", u_name_list2);
		
		model.addAttribute("send_to_M", send_to_M);
		model.addAttribute("send_to_P", send_to_P); 
		model.addAttribute("u_name_list3", u_name_list3);
		model.addAttribute("p_name_list2", p_name_list2);
		
		return "mailList";
	}
	
	// getMailInfo 불러오기 
	@RequestMapping(value = "getMailInfo", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> getMailInfo(int mailNo) {
		System.out.println("메일인포");
		System.out.println(Integer.toString(mailNo));  
        
		HashMap<String, Object> map = new HashMap<>();
		MailVO vo = service.getMailInfo(mailNo);
        String writer = service.getUserName(vo.getUserNo());
		
        map.put("mail", vo);
		map.put("writer", writer);
	    
		return map;
	}
	
	// checkMail  
	@RequestMapping(value = "checkMail", method = RequestMethod.GET)
	public String checkMail(int mailNo) {
		System.out.println("체크메일");
	    System.out.println(Integer.toString(mailNo));  
	    boolean result = service.checkMail(mailNo);
	    return "forward:/mail/mailList";
	}
	
	// deleteMail  
	@RequestMapping(value = "deleteMail", method = RequestMethod.GET)
	public String  deleteMail(int mailNo) {
		System.out.println("메일삭제");
	    System.out.println(Integer.toString(mailNo));  
	    service.deleteMail(mailNo);
	    return "forward:/mail/mailList";
	}
}
