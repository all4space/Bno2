<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
	
	<!-- start: Meta -->
	<meta charset="utf-8">
	<title>Bootstrap Metro Dashboard by Dennis Ji for ARM demo</title>
	<meta name="description" content="Bootstrap Metro Dashboard">
	<meta name="author" content="Dennis Ji">
	<meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
	<!-- end: Meta -->
	
	<!-- start: Mobile Specific -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- end: Mobile Specific -->
	
	<!-- start: CSS -->
	<link id="bootstrap-style" href="/planbe/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="/planbe/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link id="base-style" href="/planbe/resources/bootstrap/css/style.css" rel="stylesheet">
	<link id="base-style-responsive" href="/planbe/resources/bootstrap/css/style-responsive.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
	<!-- end: CSS -->
	

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<link id="ie-style" href="/planbe/resources/bootstrap/css/ie.css" rel="stylesheet">
	<![endif]-->
	
	<!--[if IE 9]>
		<link id="ie9style" href="/planbe/resources/bootstrap/css/ie9.css" rel="stylesheet">
	<![endif]-->
		
	<!-- start: Favicon -->
	<link rel="shortcut icon" href="img/favicon.ico">
	<!-- end: Favicon -->
	
	
<script>	
	function ProjectList() //그룹이름에 따른 멤버 리스트 select ver
	{
		$.ajax
		({
			url: "/planbe/users/projectList",
			type: "post",
			data: {"userNo":${userVo.userNo}},
			dataType: "json",
			success: function(result)
			{
				$("#test").empty();
				
				var addRow1 = '<div class="box span12">';
				addRow1 += '<div class="box-header">';
				addRow1 += '<h2><i class="halflings-icon glass"></i><span class="break"></span>Project List</h2>';
				addRow1 += '<div class="box-icon">';
				addRow1 += '<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>';
				addRow1 += '<a href="#" class="btn-minimize"><i 	class="halflings-icon white chevron-up"></i></a>';
				addRow1 += '<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>';
				addRow1 += '</div>';
				addRow1 += '</div>';
				addRow1 += '<div class="box-content">';
				addRow1 += '<table class="table table-bordered table-striped table-condensed">';
				addRow1 += '<thead>';
				addRow1 += '<tr>';
				addRow1 += '<th>ProjectName</th>';
				addRow1 += '<th>Content';
				addRow1 += '<th>StartDate</th>';
				addRow1 += '<th>DueDate</th>';
				addRow1 += '<th>Status</th>';                                      
				addRow1 += '</tr>';
				addRow1 += '</thead>'; 
				addRow1 += '<tbody id = "ListList">';
				addRow1 += '</tbody>';
				addRow1 += '</table>';  
				addRow1 += '<div class="pagination pagination-centered">';
				addRow1 += '<ul>';
				addRow1 += '<li><a href="#">Prev</a></li>';
				addRow1 += '<li class="active">';
				addRow1 += '<a href="#">1</a>';
				addRow1 += '</li>';
				addRow1 += '<li><a href="#">2</a></li>';
				addRow1 += '<li><a href="#">3</a></li>';
				addRow1 += '<li><a href="#">4</a></li>';
				addRow1 += '<li><a href="#">Next</a></li>';
				addRow1 += '</ul>';
				addRow1 += '</div>';     
				addRow1 += '</div>';
				addRow1 += '</div>';
				
					
				$("#test").append(addRow1);
				
			
					$(result).each(function(index, item){
						
						
						  
						  var addRow2 = '<tr>';
						  addRow2 += '<td>'+item.projectName+'</td>';
						  addRow2 += '<td>'+item.projectContent+'</td>';
						  addRow2 += '<td>'+item.startDate+'</td>';
						  addRow2 += '<td class="center">'+item.dueDate+'</td>';
						 
						  alert(item.projectStatus);
						if(item.projectStatus=="NEW")
						{
							addRow2 += '<td class="center">';
							addRow2 += '<span class="label label-warning">'+item.projectStatus+'</span>';
							addRow2 += '</td>';
						}
						else if(item.projectStatus=="PROGRESS")
						{
							addRow2 += '<td class="center">';
							addRow2 += '<span class="label label-success">'+item.projectStatus+'</span>';
							addRow2 += '</td>';
						}
						else if(item.projectStatus=="COMPLETE")
						{
							addRow2 += '<td class="center">';
							addRow2 += '<span class="label label-important">'+item.projectStatus+'</span>';
							addRow2 += '</td>';
						}
						
						  addRow2 += '</tr>';                                   
						
						  $("#ListList").append(addRow2);
				})
			},
			error : function()
			{
			}
		})
	}
	
	function timeLine()
	{
		alert("ㅌ타임라인");
		$.ajax
		({
			url: "/planbe/history/timeLine",
			type: "post",
			dataType: "json",
			success: function(result)
			{
				alert("timeLine Start");
				
				
				
			},
			error : function()
			{
				alert("timelist ! error !");
			}
		})
	}
function historyList()  
{
	alert("대기타봐");
	$.ajax
	({
		url: "/planbe/users/historyList",
		type: "post",
		data: {"userNo":${userVo.userNo}},
		dataType: "json",
		success: function(result)
		{

			$("#test").empty();
			
			var addRow1 = '<div class="box span12">';
			addRow1 += '<div class="box-header">';
			addRow1 += '<h2><i class="halflings-icon glass"></i><span class="break"></span>History List</h2>';
			addRow1 += '<div class="box-icon">';
			addRow1 += '<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>';
			addRow1 += '<a href="#" class="btn-minimize"><i 	class="halflings-icon white chevron-up"></i></a>';
			addRow1 += '<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>';
			addRow1 += '</div>';
			addRow1 += '</div>';
			addRow1 += '<div class="box-content">';
			addRow1 += '<table class="table table-striped table-bordered bootstrap-datatable datatable">';
			addRow1 += '<thead>';
			addRow1 += '<tr>';
			addRow1 += '<th>LogTime</th>';
			addRow1 += '<th>LogContent</th>';
			addRow1 += '</tr>';
			addRow1 += '</thead>'; 
			addRow1 += '<tbody id = "ListList">';
			addRow1 += '</tbody>';
			addRow1 += '</table>';  
			addRow1 += '<div class="pagination pagination-centered">';
			addRow1 += '<ul>';
			addRow1 += '<li><a href="#">Prev</a></li>';
			addRow1 += '<li class="active">';
			addRow1 += '<a href="#">1</a>';
			addRow1 += '</li>';
			addRow1 += '<li><a href="#">2</a></li>';
			addRow1 += '<li><a href="#">3</a></li>';
			addRow1 += '<li><a href="#">4</a></li>';
			addRow1 += '<li><a href="#">Next</a></li>';
			addRow1 += '</ul>';
			addRow1 += '</div>';     
			addRow1 += '</div>';
			addRow1 += '</div>';
			
				
			$("#test").append(addRow1);
			
		
				$(result).each(function(index, item){
					
					
					  
					  var addRow2 = '<tr>';
					  addRow2 += '<td class="center">'+item.logTime+'</td>';
					  addRow2 += '<td class="center">'+item.logContent+'</td>';
					  addRow2 += '</tr>';                                   
					
					  $("#ListList").append(addRow2);
			})
		}, 
		error : function()
		{
			alert("error");
		}
	})
}
/* function history()  // historyList
{
	alert("대기타봐");
	$.ajax
	({
		url: "/planbe/users/historyList",
		type: "post",
		data: {"userNo":${userVo.userNo}},
		dataType: "json",
		success: function(result)
		{

			alert("abcdefg");
			$("#test").empty();
			
			var addRow1 = '<div class="row-fluid">';
				addRow1 += '<div class="span5 noMarginLeft">';
				addRow1 += '<div class="dark">';
				addRow1 += '<h1>History</h1>';
				addRow1 += '<div class="timeline">';
				addRow1 += '<div class="timeslot">';
				addRow1 += '<div class="task">';
				addRow1 += '<span>';
				addRow1 += '<span class="type">appointment</span>';
				addRow1 += '<span class="details">';
				addRow1 += 'Dennis Ji at Bootstrap Metro Dashboard HQ';
				addRow1 += '</span>';
				addRow1 += '<span>';
				addRow1 += 'remaining time';
				addRow1 += '<span class="remaining">';
				addRow1 += '3h 38m 15s';
				addRow1 += '</span>';
				addRow1 += '</span>'; 
				addRow1 += '</span>';
				addRow1 += '<div class="arrow"></div>';
				addRow1 += '</div>';							
				addRow1 += '<div class="icon">';
				addRow1 += '<i class="icon-map-marker"></i>';
				addRow1 += '</div>';
				addRow1 += '<div class="time">';
				addRow1 += '3:43 PM';
				addRow1 += '</div>';	
				addRow1 += '</div>';
				addRow1 += '<div class="clearfix"></div>';
				addRow1 += '<div class="timeslot alt">';
				addRow1 += '<div class="task">';
				addRow1 += '<span>';
				addRow1 += '<span class="type">phone call</span>';
				addRow1 += '<span class="details">';
				addRow1 += 'Dennis Ji';
				addRow1 += '</span>';
				addRow1 += '<span>';
				addRow1 += 'remaining time';
				addRow1 += '<span class="remaining">';
				addRow1 += '3h 38m 15s';
				addRow1 += '</span>';
				addRow1 += '</span>';
				addRow1 += '</span>';
				addRow1 += '<div class="arrow"></div>';
				addRow1 += '</div>';
				addRow1 += '<div class="icon">';
				addRow1 += '<i class="icon-phone"></i>';
				addRow1 += '</div>';
				addRow1 += '<div class="time">';
				addRow1 += '3:43 PM';
				addRow1 += '</div>';
				addRow1 += '</div>';
				addRow1 += '</div>';
			$("#test").append(addRow1);
			
		
				$(result).each(function(index, item){
					
					
					  
					  var addRow2 = '<tr>';
					  addRow2 += '<td>'+item.projectNo+'</td>';
					  addRow2 += '<td class="center">'+item.logTime+'</td>';
					  addRow2 += '<td class="center">'+item.logContent+'</td>';
					  addRow2 += '<td class="center">';
					  addRow2 += '<span class="label label-success">aaaa</span>';
					  addRow2 += '</td>';                                        
					  addRow2 += '</tr>';                                   
					
					  $("#ListList").append(addRow2); 
			})
		}, 
		error : function()
		{
			alert("error");
		}
	})
	
} */

	
		
	
	
	
	
	
 	function userInfo() // 여기 유저정보 뽑아내야됨
	{
		alert("B");
		$.ajax
		({
			url: "/planbe/users/userInfo",
			type: "post",
			data: {"userNo":${userVo.userNo}},
			dataType: "json",
			success: function(result)
			{
				$(result).each(function(index, item){
					var addRow = item.projectName;
					
					$("#test").append(addRow);
				})
			},
			error : function()
			{
				alert("error");
			}
		})
	} 
	
</script>
</head>

<body>

<!-- Head Menu -->
	<div>
	<%@include file="headMenu.jsp"%>
    </div>
	
		<div class="container-fluid-full">
		<div class="row-fluid">
		
<!-- Side Menu -->
	<div>
     <%@include file="sideMenu.jsp"%>
    </div>		
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<!-- start: Content -->
			<div id="content" class="span10">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="/planebe/">Home</a>
					<i class="icon-angle-right"></i> 
				</li>
				<li>
					<i class="halflings-icon info-sign wihte"></i>
					<a href="#">User InforMation</a>
				</li>
			</ul>
		
<!-- UserInfo -->
			
			<div class="row-fluid">	
				<div class="box span12">
					
					<div class="box-header">
						<h2><i class="halflings-icon info-sign wihte"></i><span class="break"></span>User Infomation</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
				
				
						<table>
							<tr>
							
								<td><font size = 4>&nbsp;&nbsp;&nbsp;User Name</font></td>
								<p></p>
								<td>
									<p style="font-weight: bold"><font size = 4>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;${userVo.userName}</font></p>
								</td>
							</tr>
							<tr>
								<td><font size = 4>&nbsp;&nbsp;&nbsp;User Id</font></td>
								<p></p>
								<td>
									<p style="font-weight: bold"><font size = 4>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;${userVo.userId}</font></p>
								</td>
							</tr>
							<tr>
								<td><font size = 4>&nbsp;&nbsp;&nbsp;Group Name</font></td>
								<p></p>
								<td>
									<p style="font-weight: bold"><font size = 4>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;${userVo.groupName}</font></p>
								</td>
							</tr>
							<tr>
								<td><font size = 4>&nbsp;&nbsp;&nbsp;Authority</font></td>
								<p></p>
								<td>
									<p style="font-weight: bold"><font size = 4>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;${userVo.authority}</font></p>
								</td>
								<p></p>
							</tr>
							
						</table>
				
						<br>
						<a class="quick-button span2">
							<i class="icon-beaker" onclick = "ProjectList()"></i>
							<p>Projects</p>
						</a>
						<a href = "/planbe/task/taskForm" class="quick-button span2">
							<i class="icon-barcode"></i>
							<p>Task</p>
						</a>
						<a href = "/planbe/plan/planForm" class="quick-button span2">
							<i class="icon-calendar"></i>
							<p>Calendar</p>
							<span class="notification red">8</span>
						</a>
						<a href = "/planbe/mail/mailList" class="quick-button span2">
							<i class="icon-envelope"></i>
							<p>E-mail</p>
						</a>
							<a class="quick-button span2">
							<i class="icon-dashboard" onclick = "historyList()"></i>
							<p>History</p>
						</a>
						<!-- <a class="quick-button span2">
							<i class="icon-thumbs-up" onclick = "timeLine()"></i>
							<p>TimeLine</p>
						</a> -->
						<div class="clearfix"></div>
						<br><br>
					</div>	
			</div><!--/row-->
					<div id = "test"></div>
		</div>
		</div>
		
					<!-- //고고뗴 -->
					
					
							<div class="row-fluid">
				
			</div>
			
	<!-- start: JavaScript-->

		<script src="/planbe/resources/bootstrap/js/jquery-1.9.1.min.js"></script>
	<script src="/planbe/resources/bootstrap/js/jquery-migrate-1.0.0.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery-ui-1.10.0.custom.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.ui.touch-punch.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/modernizr.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/bootstrap.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.cookie.js"></script>
	
		<script src='/planbe/resources/bootstrap/js/fullcalendar.min.js'></script>
	
		<script src='/planbe/resources/bootstrap/js/jquery.dataTables.min.js'></script>

		<script src="/planbe/resources/bootstrap/js/excanvas.js"></script>
	<script src="/planbe/resources/bootstrap/js/jquery.flot.js"></script>
	<script src="/planbe/resources/bootstrap/js/jquery.flot.pie.js"></script>
	<script src="/planbe/resources/bootstrap/js/jquery.flot.stack.js"></script>
	<script src="/planbe/resources/bootstrap/js/jquery.flot.resize.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.chosen.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.uniform.min.js"></script>
		
		<script src="/planbe/resources/bootstrap/js/jquery.cleditor.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.noty.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.elfinder.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.raty.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.iphone.toggle.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.uploadify-3.1.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.gritter.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.imagesloaded.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.masonry.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.knob.modified.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/jquery.sparkline.min.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/counter.js"></script>
	
		<script src="/planbe/resources/bootstrap/js/retina.js"></script>

		<script src="/planbe/resources/bootstrap/js/custom.js"></script>
	<!-- end: JavaScript-->
	
</body>
</html>
