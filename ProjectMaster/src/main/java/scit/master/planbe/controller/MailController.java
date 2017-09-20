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
	    System.out.println("ALL P"+map.get("all_p_list"));
	    System.out.println("ALL U"+map.get("all_u_list"));
	    System.out.println("MY P"+map.get("my_p_list"));
	    System.out.println("MY U"+ map.get("my_u_list"));
	    return map;
	}
	    		
	
	// MailList 불러오기 
	@RequestMapping(value = "mailList", method = RequestMethod.GET)
	public String mailList() {
		return "mailList";
	}
}
