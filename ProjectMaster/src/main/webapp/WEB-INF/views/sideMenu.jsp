<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/planbe/resources/js/jquery-3.2.1.min.js"></script>	

<title>Side Menu</title>


</head>


<body>


<!-- start: Side Menu -->
			<div id="sidebar-left" class="span2">
				<div class="nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
<!-- Main 메뉴 -->		<li><a href="/planbe/"><i class="icon-home"></i><span class="hidden-tablet"> Main</span></a></li>	
<!-- Project 메뉴 -->   <li><a href="/planbe/project/projectList"><i class="icon-edit"></i><span class="hidden-tablet"> Project</span></a></li>
<!-- Task 메뉴 -->	    <li><a href="/planbe/task/taskForm"><i class="icon-tasks"></i><span class="hidden-tablet"> Task</span></a></li>
<!-- Gantt 메뉴 -->		<li><a href="/planbe/gantt/ganttForm"><i class="icon-align-left"></i><span class="hidden-tablet"> Gantt</span></a></li>
<!-- WBS 메뉴 -->		<li><a href="/planbe/wbs/wbsForm"><i class="icon-sitemap"></i><span class="hidden-tablet"> WBS</span></a></li>	
<!-- Plan 메뉴 -->		<li><a href="/planbe/plan/planForm"><i class="icon-calendar"></i><span class="hidden-tablet"> Plan</span></a></li>
<!-- Mail 메뉴 -->		<li><a href="/planbe/mail/mailList"><i class="icon-envelope"></i><span class="hidden-tablet"> Mail</span></a></li>
<!-- Member 메뉴 -->	    <li><a href="/planbe/member/memberForm"><i class="icon-user"></i><span class="hidden-tablet"> Member</span></a></li>
<!-- Statistic 메뉴 -->	<li><a href="/planbe/static/staticForm"><i class="icon-bar-chart"></i><span class="hidden-tablet"> Statistic</span></a></li>
						<!-- <li><a href="/planbe/tasks"><i class="halflings-icon time"></i><span class="hidden-tablet"> history</span></a></li> -->
<!-- Login 메뉴 -->		<c:if test="${userName == null}">
						<li><a href="/planbe/users/loginForm"><i class="icon-lock"></i><span class="hidden-tablet"> Login</span></a></li>
					    </c:if>
<!-- Logout 메뉴 -->		<c:if test="${userName != null}">
					    <li><a href="/planbe/users/logout"><i class="halflings-icon off white"></i><span class="hidden-tablet"> Logout</span></a></li>
					    </c:if>
					</ul>
				</div>
			</div>
<!-- end: Side Menu -->

</body>
</html>
