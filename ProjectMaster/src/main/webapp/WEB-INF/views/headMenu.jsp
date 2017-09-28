<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<script src = "/planbe/resources/js/jquery-3.2.1.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Head Menu</title>
</head>
<style>
.bg-black:before{
	background-color: blue;
}
</style>

<script>

$(function(){
	if('${sessionScope.loginId}' != ''){
		task();
		
		history();
		
		mail();
	}
})

/* Mail 불러 오기 */

function mail()
{
	$.ajax({
		url : "/planbe/head/getMail",
		type: "post",
		datatype: "json",
		success: function(result)
		{
			var m_list = result.mailList;
			var u_name = result.userName; 
			
			var badge = '<span class="badge red">' + m_list.length +'</span>';  
			$("#mail_badge").append(badge);
			
			var data1 = '<li class="dropdown-menu-title"><span>You have'+" "+ m_list.length +" "+'messages</span><a href="#refresh"><i class="icon-repeat"></i></a></li>';
			$("#MAIL").append(data1);
			
			$(m_list).each(function(index, item)
			{
				var addRow = '<li>';
				addRow += '<a href ="#">';
				addRow += '<span class="header">';
				addRow += '<span class="from">'+u_name[index]+'</span>';
				addRow += '<span class="time">'+item.sendDate+'</span>';
				addRow += '</span>';
				addRow += '<span class="message">'+item.mailContent+'</span>';
				addRow += '</a>';
                addRow += '</li>';
				
				$("#MAIL").append(addRow);
			})
			
			$("#MAIL").trigger("liszt:updated");
		},
		
		error: function()
		{
			alert("협업하자~ 다투지말고~");
		}
		
	})
}

 
/* history 불러오기 */

function history()
{
	$.ajax({
  		url: "/planbe/head/getHistory",
  		type: "post",
  		datatype: "json",
  		success: function(result) {
  		
  	    var badge = '<span class="badge red">' + result.length +'</span>';  
	    $("#history_badge").append(badge);
  			
  		var data = '<li class="dropdown-menu-title"><span>You have'+" "+ result.length +" "+'notifications</span><a href="#refresh"><i class="icon-repeat"></i></a></li>';	
  		$("#history").append(data);
  		
  		$(result).each(function(index, item){
			var addRow = '<li>';
			addRow += '<a href ="#">';
			addRow += '<span class = "icon green"><i class = "icon-comment-alt">';
			addRow += '</i>';
			addRow += '</span>';
			addRow += '<span class = "message">';
			addRow += item.logContent;
			addRow += '</span><br>';
			addRow += '<span class = "time">'+item.logTime+'</span>';
			addRow += '</a>';
			addRow += '</li>';
						
			$("#history").append(addRow);
			
			})
			$("#history").trigger("liszt:updated");
  		
  		}, // success,
  		error: function() 
  		{	
  		}
	})
}

/* TASK 불러오기 */	
	function task(){
		$.ajax({
		  		url: "/planbe/head/getTask",
		  		type: "post",
		  		datatype: "json",
		  		success: function(result) {
		  			
		  			
		  		    var taskList = result.taskList;
		  			var taskCount = result.taskCount;
		  			

		  		    // newMessage(taskList);
		  			
		  		    $("#taskprogress_title").append("<span>You have "+taskCount+" tasks in progress</span>");
		  			 YouhavetoDoTasks(taskList);
		  			 progress();
		  		
				}, // success,
		  		error: function() {	alert("통신 에------라!");	}
		})
	}

/* 
function newMessage(taskList){
	var count = 0;
	var addRow = null;
	$(taskList).each(function(index,item){
		if(item.taskStatus == 'new'){
			count += 1;
			addRow = "<span class='badge red'>"+count+"</span>";
		}
	})
	$("#taskprogress_badge").append(addRow);	
}
 */
 
 	function YouhavetoDoTasks(taskList){
	 

		var badge = '<span class="badge red">' + taskList.length +'</span>';  
	    $("#task_badge").append(badge);
	 
	 
 	 var color = ["taskProgress progressSlim red","taskProgress progressSlim green",
				"taskProgress progressSlim yellow",
				"taskProgress progressSlim greenLight",
				"taskProgress progressSlim orange"]
		
 	   $(taskList).each(function(index,item){
		var	addTask = '<li>'
			addTask += '<a href="#"><span class="header">';
			addTask += '<span class="title">'+item.taskName+'</span>';
			addTask += '<span class="percent"></span>';
			addTask += '</span>';
			addTask += '<div class = "'+color[index]+'">'+item.doneTime+'</div>';
    		addTask += '</a></li>';
    		
		$(".taskList").append(addTask); 
		
		if(index== 4){return false}
		})
	} 
 	
 	function progress(){
 		if($(".taskProgress")) {
				
				$(".taskProgress").each(function(){
					
					var endValue = parseInt($(this).html());
													
					$(this).progressbar({
						value: endValue
					});
					
					$(this).parent().find(".percent").html(endValue + "%");
					
				});
			
			}
 	}
 	
 	
 	/* 
 	function mailtwo(){
 		jQuery(document).ready(function($){
 			
 			if($('.messagesList').width()) {
 				
 				if(jQuery.browser.version.substring(0, 2) == "8.") {

 					$('ul.messagesList li:nth-child(2n+1)').addClass('odd');
 					
 				}
 				
 			}
 			
 		});	
 	}
 	 */
 	
</script>
<body>
<!-- start: Header -->
  

	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="/planbe/project/projectList"><img src="/planbe/resources/bootstrap/img/아이콘.jpg" style="width: 1cm;"><span>Project AtsuMe</span></a>
								
								
				<!-- start: Header Menu -->
				<div class="nav-no-collapse header-nav">
					<ul class="nav pull-right" >
					
						<li class="dropdown hidden-phone">
							<a class="btn dropdown-toggle" id = "history_badge" data-toggle="dropdown" href="#" >
								<i class="icon-bell"></i>
								<!-- 
								<span class="badge red">
								7 </span>
								 -->
							</a>
							
							
							<ul class="dropdown-menu notifications">
								<!-- <li class="dropdown-menu-title">
 									<span>You have 11 notifications</span>
									<a href="#refresh"><i class="icon-repeat"></i></a>
								</li>	 -->
                            	<div id="history"></div>
                                <li>
                            		<a class="dropdown-menu-sub-footer" href = "#">View all historys</a>
								</li>	
							</ul>
						</li>
						
						
						<!-- start: Notifications Dropdown -->
						<li class="dropdown hidden-phone">
							<a class="btn dropdown-toggle" id = "task_badge" data-toggle="dropdown" href="#">
								<i class="icon-calendar"></i>
								
<!-- 뉴 알람 5개   -->												
							</a>
							<ul class="dropdown-menu tasks">
								<li class="dropdown-menu-title" id = "taskprogress_title">
 <!-- 진행 프로젝트 Count  -->		<!-- <span>You have 5 tasks in progress</span> -->
									<a href="#refresh"><i class="icon-repeat"></i></a>
								</li>
								<div class="taskList"></div>
								<li>
                            		<a class="dropdown-menu-sub-footer" href="/planbe/task/taskForm">View all tasks</a>
								</li>	
							</ul>
						</li>
						<!-- end: Notifications Dropdown -->
						
						
						
<!-- start: Message Dropdown -->

						<li class="dropdown hidden-phone">
							<a class="btn dropdown-toggle" id = "mail_badge" data-toggle="dropdown" href="#">
								<i class="icon-envelope"></i>
							</a>
							
							<ul class="dropdown-menu messages" >
								<div id="MAIL"></div>
							
								<li>
                            		<a class="dropdown-menu-sub-footer">View all messages</a>
								</li>	
							</ul>
						</li>						
<!-- end: Message Dropdown -->								
						
						
						<!-- start: User Dropdown -->
						<li class="dropdown">
							<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="halflings-icon white user"></i>
								${userName}
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li class="dropdown-menu-title">
 									<span>Account Settings</span>
								</li>
								<li><a href="/planbe/users/profileForm"><i class="halflings-icon user"></i> Profile</a></li>
								<c:if test="${userName != null}">
								<li><a href="/planbe/users/logout"><i class="halflings-icon off"></i> Logout</a></li>
								</c:if>
								
							</ul>
						</li>
						<!-- end: User Dropdown -->
					</ul>
				</div>
				<!-- end: Header Menu -->
				
			</div>
		</div>
	</div>

<!-- end: Header -->
	
</body>
</html>