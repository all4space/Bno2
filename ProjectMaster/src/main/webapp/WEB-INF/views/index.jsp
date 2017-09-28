<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
	
	<!-- start: Meta -->
	<meta charset="utf-8">
	<title>PROJECT B</title>
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
		<link id="ie-style" href="css/ie.css" rel="stylesheet">
	<![endif]-->
	
	<!--[if IE 9]>
		<link id="ie9style" href="css/ie9.css" rel="stylesheet">
	<![endif]-->
		
	<!-- start: Favicon -->
	<link rel="shortcut icon" href="/planbe/resources/bootstrap/img/favicon.ico">
	<!-- end: Favicon -->
	
		
</head>
<style>
.icon_set a .quick-button metro span2{
	display : inline-block;
	text-align: center;
	margin-right : 20px;
	margin-left : 20px;
	width: 300px;
}
.icon_set a .quick-button metro span2:hover,
.icon_set a .quick-button metro span2:focus,
.icon_set a .quick-button metro span2:active{
background-color: #fc9476;
border-color: #fc9476;
}

.title{
	font-weight: bold;
	font-size: medium;
}

.title,
.content{
	color: black;
}
img{
	width: 300%;
}

td{
	padding-right: 15px;
	padding-left: 15px;
}

td i,
td span{
	text-align: center;
	color: white;
}
td i :hover,
td i :focus,
td i :active,
td span :hover,
td span :focus,
td span :actvie{
	background-color: #fc9476;
	border-color: #fc9476;
}
</style>
<body>
<!-- Head Menu -->
	<div>
	<%@include file="headMenu.jsp"%>
    </div>
	
		<div class="container-fluid-full">
		<div class="row-fluid" style="margin-right: 0%; width: 100%;">
		
			<!-- start: Content -->
			<div id="content" class="span4" style="width: 100%;padding: 20px; margin: 0px;	margin-left: 0% !important; background: url('/planbe/resources/bootstrap/img/배경.jpg');">
			
			
			<ul class="breadcrumb" style="background: rgba(255,255,255,0.5);">
				
					<i class="icon-home"></i>
					<a href="index.jsp" style="color: white;">Main</a> 
				
			</ul>
			
			<div><h1 style="font: 200;font-weight: bold;color: rgba(255,255,255,0.7);">Our Project of Team Name is Project Atsume !</h1></div>
			<div class="row-fluid" style = "float:left; width : 40%; margin : 0;">	
			<div>
					<div class="icon_set">
						<a class="quick-button metro span4" style="background: rgba(255,255,255,0.7);" href="/planbe/project/projectForm">
							<img src = "/planbe/resources/bootstrap/img/project.png">
							<p class="title" style="text-align: center; color: #fc9476; background:rgba(0,0,0,0.7); ">Project</p>
							<p class="content" style="text-align: center;">프로젝트 시작<br>생성,추가,삭제<br>가능합니다.<br>Start!</p>
						</a>
					</div>
					<div class="icon_set">				
						<a class="quick-button metro span4" style="background: rgba(255,255,255,0.7);" href="/planbe/member/memberForm">
							<img src ="/planbe/resources/bootstrap/img/member.png">
							<p class="title" style="text-align: center; color: #fc9476; background:rgba(0,0,0,0.7);">member</p>
							<p class="content" style="text-align: center;">멤버 초대<br>프로젝트의<br>구성원을 추가<br>해보세요!</p>
						</a>
					</div>
					<div class="icon_set">
						<a class="quick-button metro span4" style="background: rgba(255,255,255,0.7);">
							<img src = "/planbe/resources/bootstrap/img/task.png" href="/planbe/task/taskForm">
							<p class="title" style="text-align: center; color: #fc9476; background:rgba(0,0,0,0.7);">task</p>
							<p class="content" style="text-align: center;">팀원 업무 분배<br>업무들을<br>멤버 별로 할당<br>할 수 있어요.</p>
						</a>
					</div>
					<div class="clearfix" style="width:50%;"></div>
			</div><!--uppder Icons  1줄 -->
			
			<div>
					<div class="icon_set">
						<a class="quick-button metro span4" style="background: rgba(255,255,255,0.7);">
							<img src = "/planbe/resources/bootstrap/img/calendar.png" href="/planbe/plan/planForm">
							<p class="title" style="text-align: center; color: #fc9476;background:rgba(0,0,0,0.7);">calendar</p>
							<p class="content" style="text-align: center;">일정 관리<br>프로젝트<br>개인 둘다 OK<br>모두 관리해요!</p>
						</a>
					</div>				
					<div class="icon_set">				
						<a class="quick-button metro span4" style="background: rgba(255,255,255,0.7);">
							<img src ="/planbe/resources/bootstrap/img/static.png" href="/planbe/static/staticForm">
							<p class="title" style="text-align: center; color: #fc9476;background:rgba(0,0,0,0.7);">static</p>
							<p class="content" style="text-align: center;">통계 분석<br>프로젝트의<br>진행률,효율도<br>제공합니다.</p>
						</a>
						</div>
					<div class="icon_set">				
						<a class="quick-button metro span4" style="background: rgba(255,255,255,0.7);">
							<img src = "/planbe/resources/bootstrap/img/mail.png" href="/planbe/mail/mailForm">
							<p class="title" style="text-align: center; color: #fc9476; background:rgba(0,0,0,0.7);">mail</p>
							<p class="content" style="text-align: center;">멤버간 메일<br>할 말은 메일<br>상단에서<br>알람 확인 !</p>
						</a>
					</div>
				<div class="clearfix" style="width:452px;"></div>
			</div> <!--Under Icons  -->
			</div>		<!-- row  -->	
			
			
<!-- 왼쪽 --> <div class="row-fluid" style="float:right;width : 50%; text-align: center;">
				<label style="font: 100;font-weight: bold;color: rgba(255,255,255,0.7);">Gantt와 WBS는 연동이 가능합니다. <br>WBS에서 보던 프로젝트를 Gantt로 볼 수 있어요!</label>
				<div class ="two_chart">
					<div class="icon_set">				
						<a class="quick-button metro span4" style="background: rgba(255,255,255,0.7);" href="/planbe/gantt/ganttForm">
							<img src = "/planbe/resources/bootstrap/img/gantt.png">
							<p class="title" style="text-align: center; color: #fc9476; background-color:rgba(0,0,0,0.7);">Gantt</p>
							<p class="content" style="text-align: center;">프로젝트 별<Br> Gantt Chart 확인이 가능합니다.</p>
						</a>
					</div>
					<div class ="icon_set">
							<p></p>
							<img class = "span4" src = "/planbe/resources/bootstrap/img/마루마루.PNG" style="width: 30%; background: rgba(0,0,0,0.2);">
					</div>
					<div class="icon_set">				
						<a class="quick-button metro span4" style="float: right; background: rgba(255,255,255,0.7);" href="/planbe/wbs/wbsForm">
							<img src = "/planbe/resources/bootstrap/img/wbs (2).png">
							<p class="title" style="text-align: center; color: #fc9476; background:rgba(0,0,0,0.7);">WBS</p>
							<p class="content" style="text-align: center;">프로젝트 별 <Br>WBS Chart 확인이 가능합니다.</p>
						</a>
					</div> 
				</div><!-- Gantt Wbs 묶은 div  -->
			<div class="clearfix"></div>
			</div><!-- row  -->
		</div><!-- content  -->
<!-- 			<div class="row-fluid">
				
				<div class="span3 statbox purple" onTablet="span6" onDesktop="span3">
					<div class="boxchart">5,6,7,2,0,4,2,4,8,2,3,3,2</div>
					<div class="number">854<i class="icon-arrow-up"></i></div>
					<div class="title">visits</div>
					<div class="footer">
						<a href="#"> read full report</a>
					</div>	
				</div>
				<div class="span3 statbox green" onTablet="span6" onDesktop="span3">
					<div class="boxchart">1,2,6,4,0,8,2,4,5,3,1,7,5</div>
					<div class="number">123<i class="icon-arrow-up"></i></div>
					<div class="title">sales</div>
					<div class="footer">
						<a href="#"> read full report</a>
					</div>
				</div>
				<div class="span3 statbox blue noMargin" onTablet="span6" onDesktop="span3">
					<div class="boxchart">5,6,7,2,0,-4,-2,4,8,2,3,3,2</div>
					<div class="number">982<i class="icon-arrow-up"></i></div>
					<div class="title">orders</div>
					<div class="footer">
						<a href="#"> read full report</a>
					</div>
				</div>
				<div class="span3 statbox yellow" onTablet="span6" onDesktop="span3">
					<div class="boxchart">7,2,2,2,1,-4,-2,4,8,,0,3,3,5</div>
					<div class="number">678<i class="icon-arrow-down"></i></div>
					<div class="title">visits</div>
					<div class="footer">
						<a href="#"> read full report</a>
					</div>
				</div>	
				
			</div>		

			<div class="row-fluid">
				
				<div class="span8 widget blue" onTablet="span7" onDesktop="span8">
					
					<div id="stats-chart2"  style="height:282px" ></div>
					
				</div>
				
				<div class="sparkLineStats span4 widget green" onTablet="span5" onDesktop="span4">

                    <ul class="unstyled">
                        
                        <span class="sparkLineStats3"></span> 
                            Pageviews: 
                            <span class="number">781</span>
                        
                        <span class="sparkLineStats4"></span>
                            Pages / Visit: 
                            <span class="number">2,19</span>
                        
                        <span class="sparkLineStats5"></span>
                            Avg. Visit Duration: 
                            <span class="number">00:02:58</span>
                        
                        <span class="sparkLineStats6"></span>
                            Bounce Rate: <span class="number">59,83%</span>
                        
                        <span class="sparkLineStats7"></span>
                            % New Visits: 
                            <span class="number">70,79%</span>
                        
                        <span class="sparkLineStats8"></span>
                            % Returning Visitor: 
                            <span class="number">29,21%</span>
                        

                    </ul>
					
					<div class="clearfix"></div>

                </div>End .sparkStats

			</div>
			
						
			<div class="row-fluid">
				
				<div class="widget blue span5" onTablet="span6" onDesktop="span5">
					
					<h2><span class="glyphicons globe"><i></i></span> Demographics</h2>
					
					<hr>
					
					<div class="content">
						
						<div class="verticalChart">
							
							<div class="singleBar">
							
								<div class="bar">
								
									<div class="value">
										<span>37%</span>
									</div>
								
								</div>
								
								<div class="title">US</div>
							
							</div>
							
							<div class="singleBar">
							
								<div class="bar">
								
									<div class="value">
										<span>16%</span>
									</div>
								
								</div>
								
								<div class="title">PL</div>
							
							</div>
							
							<div class="singleBar">
							
								<div class="bar">
								
									<div class="value">
										<span>12%</span>
									</div>
								
								</div>
								
								<div class="title">GB</div>
							
							</div>
							
							<div class="singleBar">
							
								<div class="bar">
								
									<div class="value">
										<span>9%</span>
									</div>
								
								</div>
								
								<div class="title">DE</div>
							
							</div>
							
							<div class="singleBar">
							
								<div class="bar">
								
									<div class="value">
										<span>7%</span>
									</div>
								
								</div>
								
								<div class="title">NL</div>
							
							</div>
							
							<div class="singleBar">
							
								<div class="bar">
								
									<div class="value">
										<span>6%</span>
									</div>
								
								</div>
								
								<div class="title">CA</div>
							
							</div>
							
							<div class="singleBar">
							
								<div class="bar">
								
									<div class="value">
										<span>5%</span>
									</div>
								
								</div>
								
								<div class="title">FI</div>
							
							</div>
							
							<div class="singleBar">
							
								<div class="bar">
								
									<div class="value">
										<span>4%</span>
									</div>
								
								</div>
								
								<div class="title">RU</div>
							
							</div>
							
							<div class="singleBar">
							
								<div class="bar">
								
									<div class="value">
										<span>3%</span>
									</div>
								
								</div>
								
								<div class="title">AU</div>
							
							</div>
							
							<div class="singleBar">
							
								<div class="bar">
								
									<div class="value">
										<span>1%</span>
									</div>
								
								</div>
								
								<div class="title">N/A</div>
							
							</div>	
							
							<div class="clearfix"></div>
							
						</div>
					
					</div>
					
				</div>/span
				
				<div class="widget span3 red" onTablet="span6" onDesktop="span3">
					
					<h2><span class="glyphicons pie_chart"><i></i></span> Browsers</h2>
					
					<hr>
					
					<div class="content">
						
						<div class="browserStat big">
							<img src="/planbe/resources/bootstrap/img/browser-chrome-big.png" alt="Chrome">
							<span>34%</span>
						</div>
						<div class="browserStat big">
							<img src="/planbe/resources/bootstrap/img/browser-firefox-big.png" alt="Firefox">
							<span>34%</span>
						</div>
						<div class="browserStat">
							<img src="/planbe/resources/bootstrap/img/browser-ie.png" alt="Internet Explorer">
							<span>34%</span>
						</div>
						<div class="browserStat">
							<img src="/planbe/resources/bootstrap/img/browser-safari.png" alt="Safari">
							<span>34%</span>
						</div>
						<div class="browserStat">
							<img src="/planbe/resources/bootstrap/img/browser-opera.png" alt="Opera">
							<span>34%</span>
						</div>	
								
						
					</div>
				</div>
				
				<div class="widget yellow span4 noMargin" onTablet="span12" onDesktop="span4">
					<h2><span class="glyphicons fire"><i></i></span> Server Load</h2>
					<hr>
					<div class="content">
						 <div id="serverLoad2" style="height:224px;"></div>
					</div>
				</div>
			
			</div>
			
			<div class="row-fluid">
				
				<div class="box black span4" onTablet="span6" onDesktop="span4">
					<div class="box-header">
						<h2><i class="halflings-icon white list"></i><span class="break"></span>Weekly Stat</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<ul class="dashboard-list metro">
							
								<a href="#">
									<i class="icon-arrow-up green"></i>                               
									<strong>92</strong>
									New Comments                                    
								</a>
							
						  
							<a href="#">
							  <i class="icon-arrow-down red"></i>
							  <strong>15</strong>
							  New Registrations
							</a>
						  
						  
							<a href="#">
							  <i class="icon-minus blue"></i>
							  <strong>36</strong>
							  New Articles                                    
							</a>
						  
						  
							<a href="#">
							  <i class="icon-comment yellow"></i>
							  <strong>45</strong>
							  User reviews                                    
							</a>
						  
						  
							<a href="#">
							  <i class="icon-arrow-up green"></i>                               
							  <strong>112</strong>
							  New Comments                                    
							</a>
						  
						  
							<a href="#">
							  <i class="icon-arrow-down red"></i>
							  <strong>31</strong>
							  New Registrations
							</a>
						  
						  
							<a href="#">
							  <i class="icon-minus blue"></i>
							  <strong>93</strong>
							  New Articles                                    
							</a>
						  
						  
							<a href="#">
							  <i class="icon-comment yellow"></i>
							  <strong>256</strong>
							  User reviews                                    
							</a>
						  
						</ul>
					</div>
				</div>/span
				
				<div class="box black span4" onTablet="span6" onDesktop="span4">
					<div class="box-header">
						<h2><i class="halflings-icon white user"></i><span class="break"></span>Last Users</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<ul class="dashboard-list metro">
							<li class="green">
								<a href="#">
									<img class="avatar" alt="Dennis Ji" src="/planbe/resources/bootstrap/img/avatar.jpg">
								</a>
								<strong>Name:</strong> Dennis Ji<br>
								<strong>Since:</strong> Jul 25, 2012 11:09<br>
								<strong>Status:</strong> Approved             
							
							<li class="yellow">
								<a href="#">
									<img class="avatar" alt="Dennis Ji" src="/planbe/resources/bootstrap/img/avatar.jpg">
								</a>
								<strong>Name:</strong> Dennis Ji<br>
								<strong>Since:</strong> Jul 25, 2012 11:09<br>
								<strong>Status:</strong> Pending                                
							
							<li class="red">
								<a href="#">
									<img class="avatar" alt="Dennis Ji" src="/planbe/resources/bootstrap/img/avatar.jpg">
								</a>
								<strong>Name:</strong> Dennis Ji<br>
								<strong>Since:</strong> Jul 25, 2012 11:09<br>
								<strong>Status:</strong> Banned                                  
							
							<li class="blue">
								<a href="#">
									<img class="avatar" alt="Dennis Ji" src="/planbe/resources/bootstrap/img/avatar.jpg">
								</a>
								<strong>Name:</strong> Dennis Ji<br>
								<strong>Since:</strong> Jul 25, 2012 11:09<br>
								<strong>Status:</strong> Updated                                 
							
						</ul>
					</div>
				</div>/span
				
				<div class="box black span4 noMargin" onTablet="span12" onDesktop="span4">
					<div class="box-header">
						<h2><i class="halflings-icon white check"></i><span class="break"></span>To Do List</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<div class="todo metro">
							<ul class="todo-list">
								<li class="red">
									<a class="action icon-check-empty" href="#"></a>	
									Windows Phone 8 App 
									<strong>today</strong>
								
								<li class="red">
									<a class="action icon-check-empty" href="#"></a>
									New frontend layout
									<strong>today</strong>
								
								<li class="yellow">
									<a class="action icon-check-empty" href="#"></a>
									Hire developers
									<strong>tommorow</strong>
								
								<li class="yellow">
									<a class="action icon-check-empty" href="#"></a>
									Windows Phone 8 App
									<strong>tommorow</strong>
								
								<li class="green">
									<a class="action icon-check-empty" href="#"></a>
									New frontend layout
									<strong>this week</strong>
								
								<li class="green">
									<a class="action icon-check-empty" href="#"></a>
									Hire developers
									<strong>this week</strong>
								
								<li class="blue">
									<a class="action icon-check-empty" href="#"></a>
									New frontend layout
									<strong>this month</strong>
								
								<li class="blue">
									<a class="action icon-check-empty" href="#"></a>
									Hire developers
									<strong>this month</strong>
								
							</ul>
						</div>	
					</div>
				</div>
			
			</div>
			<div class="row-fluid hideInIE8 circleStats">
				
				<div class="span2" onTablet="span4" onDesktop="span2">
                	<div class="circleStatsItemBox yellow">
						<div class="header">Disk Space Usage</div>
						<span class="percent">percent</span>
						<div class="circleStat">
                    		<input type="text" value="58" class="whiteCircle" />
						</div>		
						<div class="footer">
							<span class="count">
								<span class="number">20000</span>
								<span class="unit">MB</span>
							</span>
							<span class="sep"> / </span>
							<span class="value">
								<span class="number">50000</span>
								<span class="unit">MB</span>
							</span>	
						</div>
                	</div>
				</div>

				<div class="span2" onTablet="span4" onDesktop="span2">
                	<div class="circleStatsItemBox green">
						<div class="header">Bandwidth</div>
						<span class="percent">percent</span>
						<div class="circleStat">
                    		<input type="text" value="78" class="whiteCircle" />
						</div>
						<div class="footer">
							<span class="count">
								<span class="number">5000</span>
								<span class="unit">GB</span>
							</span>
							<span class="sep"> / </span>
							<span class="value">
								<span class="number">5000</span>
								<span class="unit">GB</span>
							</span>	
						</div>
                	</div>
				</div>

				<div class="span2" onTablet="span4" onDesktop="span2">
                	<div class="circleStatsItemBox red">
						<div class="header">Memory</div>
						<span class="percent">percent</span>
                    	<div class="circleStat">
                    		<input type="text" value="100" class="whiteCircle" />
						</div>
						<div class="footer">
							<span class="count">
								<span class="number">64</span>
								<span class="unit">GB</span>
							</span>
							<span class="sep"> / </span>
							<span class="value">
								<span class="number">64</span>
								<span class="unit">GB</span>
							</span>	
						</div>
                	</div>
				</div>

				<div class="span2 noMargin" onTablet="span4" onDesktop="span2">
                	<div class="circleStatsItemBox pink">
						<div class="header">CPU</div>
						<span class="percent">percent</span>
                    	<div class="circleStat">
                    		<input type="text" value="83" class="whiteCircle" />
						</div>
						<div class="footer">
							<span class="count">
								<span class="number">64</span>
								<span class="unit">GHz</span>
							</span>
							<span class="sep"> / </span>
							<span class="value">
								<span class="number">3.2</span>
								<span class="unit">GHz</span>
							</span>	
						</div>
                	</div>
				</div>

				<div class="span2" onTablet="span4" onDesktop="span2">
                	<div class="circleStatsItemBox blue">
						<div class="header">Memory</div>
						<span class="percent">percent</span>
                    	<div class="circleStat">
                    		<input type="text" value="100" class="whiteCircle" />
						</div>
						<div class="footer">
							<span class="count">
								<span class="number">64</span>
								<span class="unit">GB</span>
							</span>
							<span class="sep"> / </span>
							<span class="value">
								<span class="number">64</span>
								<span class="unit">GB</span>
							</span>	
						</div>
                	</div>
				</div>

				<div class="span2" onTablet="span4" onDesktop="span2">
                	<div class="circleStatsItemBox green">
						<div class="header">Memory</div>
						<span class="percent">percent</span>
                    	<div class="circleStat">
                    		<input type="text" value="100" class="whiteCircle" />
						</div>
						<div class="footer">
							<span class="count">
								<span class="number">64</span>
								<span class="unit">GB</span>
							</span>
							<span class="sep"> / </span>
							<span class="value">
								<span class="number">64</span>
								<span class="unit">GB</span>
							</span>	
						</div>
                	</div>
				</div>
						
			</div>		
			
			<div class="row-fluid">	

				<a class="quick-button metro yellow span2">
					<i class="icon-group"></i>
					<p>Users</p>
					<span class="badge">237</span>
				</a>
				<a class="quick-button metro red span2">
					<i class="icon-comments-alt"></i>
					<p>Comments</p>
					<span class="badge">46</span>
				</a>
				<a class="quick-button metro blue span2">
					<i class="icon-shopping-cart"></i>
					<p>Orders</p>
					<span class="badge">13</span>
				</a>
				<a class="quick-button metro green span2">
					<i class="icon-barcode"></i>
					<p>Products</p>
				</a>
				<a class="quick-button metro pink span2">
					<i class="icon-envelope"></i>
					<p>Messages</p>
					<span class="badge">88</span>
				</a>
				<a class="quick-button metro black span2">
					<i class="icon-calendar"></i>
					<p>Calendar</p>
				</a>
				
				<div class="clearfix"></div>
								
			</div>/row -->
			
	<!--fluid-container-->
	</div><!-- end: Content -->
 		</div><!-- content.span10 -->
		<!-- fluid-row -->
	<!-- <div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">Ã</button>
			<h3>Settings</h3>
		</div>
		<div class="modal-body">
			<p>Here settings can be configured...</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a>
			<a href="#" class="btn btn-primary">Save changes</a>
		</div>
	</div>
	
	<div class="common-modal modal fade" id="common-Modal1" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<ul class="list-inline item-details">
				<a href="http://themifycloud.com">Admin templates</a>
				<a href="http://themescloud.org">Bootstrap themes</a>
			</ul>
		</div>
	</div> -->
 	<!-- <div class="clearfix"></div> --> 
<footer>
			<div id="sidebar-bottom" class="span2" style="width: auto;">
				<div class="nav-collapse sidebar-nav">
					<table class="nav nav-tabs nav-stacked main-menu">
					<tr>
<!-- Main 메뉴 -->		<td><a href="/planbe/"><i class="icon-home"></i><span class="hidden-tablet"> Main</span></a></td>	
<!-- Project 메뉴 -->   <td><a href="/planbe/project/projectList"><i class="icon-edit"></i><span class="hidden-tablet"> Project</span></a></td>
<!-- Task 메뉴 -->	  <td><a href="/planbe/task/taskForm"><i class="icon-tasks"></i><span class="hidden-tablet"> Task</span></a></td>
<!-- Gantt 메뉴 -->	<td><a href="/planbe/gantt/ganttForm"><i class="icon-align-left"></i><span class="hidden-tablet"> Gantt</span></a></td>
<!-- WBS 메뉴 -->	<td><a href="/planbe/wbs/wbsForm"><i class="icon-sitemap"></i><span class="hidden-tablet"> WBS</span></a></td>	
<!-- Plan 메뉴 -->	<td><a href="/planbe/plan/planForm"><i class="icon-calendar"></i><span class="hidden-tablet"> Plan</span></a></td>
<!-- Mail 메뉴 -->	<td><a href="/planbe/mail/mailList"><i class="icon-envelope"></i><span class="hidden-tablet"> Mail</span></a></td>
<!-- Member 메뉴 -->	<td> <a href="/planbe/member/memberForm"><i class="icon-user"></i><span class="hidden-tablet"> Member</span></a></td>
<!-- Statistic 메뉴 --><td><a href="/planbe/static/staticForm"><i class="icon-bar-chart"></i><span class="hidden-tablet"> Statistic</span></a></td>
					<!-- <a href="/planbe/tasks"><i class="halflings-icon time"></i><span class="hidden-tablet"> history</span></a> -->
<!-- Login 메뉴 -->	<td><c:if test="${userName == null}">
						<a href="/planbe/users/loginForm"><i class="icon-lock"></i><span class="hidden-tablet"> Login</span></a>
					    </c:if>
<!-- Logout 메뉴 -->		<c:if test="${userName != null}">
					    <a href="/planbe/users/logout"><i class="halflings-icon off white"></i><span class="hidden-tablet"> Logout</span></a>
					    </c:if>
					</td>
					</tr>
					</table>
				</div>
			</div>	
</footer>
	<footer>

		<p>
			<span style="text-align:left;float:left">&copy; 2017 <a href="/planbe/ourTeam" alt="Bootstrap_Metro_Dashboard">SCIT MASTER 33rd CLASS B TEAM 2 </a></span>
			
		</p>

	</footer>
	
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
