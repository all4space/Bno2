package scit.master.planbe.controller;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

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
	public String mailForm(HttpSession session, Model model) {
	    /*
		String userId = (String)session.getAttribute("loginId");

	    UsersVO uvo = service.getUserInfo(userId);
	        CTO 권한의 경우 
           if("cto".equals(uvo.getAuthority())){
	        	// CTO 그룹의 전체 프로젝트 가져오기
	        	ArrayList<ProjectVO> all_p_list = service.getAllProjectList(uvo.getGroupName());

	        	// CTO 그룹의 전체 멤버(user) 가져오기 
	        	ArrayList<UsersVO> all_u_list = service.getAllMemberList(uvo.getGroupName());
	        	//System.out.println("p리스트" + all_p_list.toString() + "멤바" + all_u_list);
	        	
	        	model.addAttribute("all_p_list", all_p_list); // 그룹의 전체 프로젝트 리스트 
	        	model.addAttribute("all_u_list", all_u_list); // 그룹의 전체 멤버(user) 리스트
	        	
	        } else { 
	        Manager or Member 권한의 경우 
	        	// Manager or Member가 속한 프로젝트 가져오기 
	        	ArrayList<ProjectVO> my_p_list = service.getMyProjectList(uvo.getUserNo());
	        	
	        	// Manager or Member가 속한 프로젝트에 속한 멤버 가져오기
	        	ArrayList<Integer> my_m_userNo = new ArrayList<>();
	        	for(ProjectVO pvo : my_p_list){
	        		ArrayList<MemberVO> m_info_list = service.getMyMemberInfo(pvo.getProjectNo());
	        		for(MemberVO mvo : m_info_list){
	        			my_m_userNo.add(mvo.getUserNo());
	        		}
	        	}
                
	        	ArrayList<UsersVO> my_u_list = new ArrayList<>(); 
	        	for(int userNo : my_m_userNo){
	        		UsersVO muvo = service.getUserInfo2(userNo);
	        		if(!my_u_list.contains(muvo)){
	        			my_u_list.add(muvo);
	        		}
	        	}
	        	
	        	System.out.println("my프젝리스트" + my_p_list + "my멤바리스트" + my_u_list);
	        	
	            model.addAttribute("my_p_list", my_p_list); // 소속된 프로젝트 리스트 
	            model.addAttribute("my_u_list", my_u_list); // 소속된 프로젝트의 멤버 리스트 
	        }//else
           */
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
	    			//if(!my_u_list.contains(muvo)){
	    				my_u_list.add(muvo);
	    			// }
	    		}//for
	    		map.put("my_u_list", my_u_list);
	    	}//else
	    }//else
	    return map;
	}
	    

	// SendMail
	@RequestMapping(value = "sendMail", method = RequestMethod.POST)
	public String sendMail(MailVO vo, HttpSession session, String p_no_list, String u_no_list) {
		System.out.println("Send Mail접근");
		System.out.println("넘겨온 값은 무엇이냐 : " + vo.toString());
		
		String userId = (String)session.getAttribute("loginId");
		UsersVO uvo = service.getUserInfo(userId);
		vo.setUserNo(uvo.getUserNo()); 
		
		if(p_no_list != ""){
			System.out.println("프넘" + p_no_list);
			String[] pArray = p_no_list.split(",");
			for(int i=0; i < pArray.length; i++){
                vo.setReceiveProject(Integer.parseInt(pArray[i]));				
                System.out.println(vo.getReceiveProject());
                System.out.println(vo.toString());
                boolean result = service.sendMail(vo);
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
                boolean result = service.sendMail(vo);
                System.out.println(result);
			}
		}
		
		return "mailForm";
	}
        
	
	// MailList 불러오기 
	@RequestMapping(value = "mailList", method = RequestMethod.GET)
	public String mailList(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("loginId");
		UsersVO uvo = service.getUserInfo(userId);
		int userNo = uvo.getUserNo();
		
		/* 개인에게 온 메일리스트 가져오기  */
		ArrayList<MailVO> mmlist = service.getMemberMailList(userNo);
		/* 메일 송신자의 userName 가져오기 */
		ArrayList<String> umlist = new ArrayList<>();
		for(MailVO vo : mmlist){
			UsersVO uvo2 = service.getUserInfo2(vo.getUserNo());
            umlist.add(uvo2.getUserName());
		}
		System.out.println(umlist);
		
		/* 프로젝트에게 온 메일리스트 불러오기 */
		ArrayList<MailVO> pmlist = service.getProjectMailList(userNo);
		System.out.println(pmlist);
		/* 메일 송신자의 userName 가져오기 */
		ArrayList<String> umlist2 = new ArrayList<>();
		for(MailVO vo : pmlist){
			UsersVO uvo2 = service.getUserInfo2(vo.getUserNo());
            umlist2.add(uvo2.getUserName());
		}
		
		/* 내가 보낸 메일 리스트 가져오기 */
		ArrayList<MailVO> smlist = service.getMySendMailList(userNo);
	    System.out.println(smlist);
	    
		model.addAttribute("mmlist", mmlist);
		model.addAttribute("umlist", umlist);
		model.addAttribute("pmlist", pmlist);
		model.addAttribute("umlist2", umlist2);
		model.addAttribute("smlist", smlist);
		
		return "mailList";
	}
}
