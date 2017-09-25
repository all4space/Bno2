<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
	
	<!-- start: Meta -->
	<meta charset="utf-8">
	<title>Modify Page</title>
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
	<link rel="shortcut icon" href="/planbe/resources/bootstrap/img/favicon.ico">
	<!-- end: Favicon -->
	
			<style type="text/css">
			body { background: url(/planbe/resources/bootstrap/img/bg-login.jpg) !important; }
		</style>
		
		
<script src="/planbe/resources/js/jquery-3.2.1.min.js"></script>		
<script src="/planbe/resources/bootstrap/js/jquery-1.9.1.min.js"></script>
</head>
<script>

   /* 회원 가입 양식 유효성 체크 */
   $(function() {
	    	setUserInfo();
		  $("#modify").click(function() {
			
			   if($("#userName").val().length == 0){
				  alert("이름을 입력해 주세요");
				  $("#userName").focus();
				  return false;
			  } else if($("#userPwd").val().length == 0){
				  alert("비밀번호를 입력해 주세요");
				  $("#userPwd").focus();
				  return false;
			  } else if($("#groupName").val().length == 0){
				  alert("그룹 이름을 입력해 주세요");
				  $("#groupName").focus();
				  return false;
			  }
			  document.fm.submit();
				  
		})
   });

function setUserInfo(){
	var id = ${userVO.userId}
	var authority = ${userVO.Authority}
		$("#id").attr("value",id);
		$("#id").attr("readonly",true);
		
		
		
		if(authority == 'CTO' || authority == 'cto'){
			$("#cto").attr("checked",true);
		}else if (authority == 'Manager' || authority == 'manager'){
			
			$("#Manager").prop("checked", true);
		}else if (authority == 'Member' || authority == 'member'){
			$("#Member").attr("checked",true);
		} 
}
</script>

<style>
#checkId
{
	float: right;
	margin-right: 6%;
}
</style>

<body>
		<div class="container-fluid-full">
		<div class="row-fluid">
					
			<div class="row-fluid">
				<div class="login-box">
					<div class="icons">
						<a href="index.jsp"><i class="halflings-icon home"></i></a>
						<a href="#"><i class="halflings-icon cog"></i></a>
					</div>
					<h2>Modify your account to information</h2>
					<form class="form-horizontal" name="fm" action="modify" method="post">
						<fieldset>
							
							<div class="input-prepend" title="UserId">
								<span class="add-on"><i class="halflings-icon user"></i></span>
								<input class="input-large span10" name="userId" id="id" type="text" placeholder="type userId"/>
							</div>
							
							<div class="clearfix"></div>
							<div class="input-prepend" title="UserName">
								<span class="add-on"><i class="halflings-icon user"></i></span>
								<input class="input-large span10" name="userName" id="userName" type="text" placeholder="type userName"/>
							</div>
							<div class="clearfix"></div>

							<div class="input-prepend" title="UserPwd">
								<span class="add-on"><i class="halflings-icon lock"></i></span>
								<input class="input-large span10" name="userPwd" id="userPwd" type="password" placeholder="type password"/>
							</div>
							<div class="clearfix"></div>
							
							<div class="clearfix"></div>
							<div class="input-prepend" title="GroupName">
								<span class="add-on"><i class="halflings-icon user"></i></span>
								<input class="input-large span10" name="groupName" id="groupName" type="text" placeholder="type groupName"/>
							</div>
							<div class="clearfix"></div>
                            
		                         <label><input id = "cto" type="radio" name="authority" value="cto" disabled="disabled"/> CTO</label>
		                         <label><input id = "Manager" type="radio" name="authority" value="manager" disabled="disabled"/> Manager</label>
		                         <label><input id = "Member" type="radio" name="authority" value="member" disabled="disabled"/> Member</label>
								
							<div class="button-join">	
							    <center>
								<button type="button" class="btn btn-modify" id="modify">Modify</button>
								<button class="btn btn-backToCancel" onclick = "location.href='/planbe/'">cancel</button>
							    </center>
							</div>
					</form>
							    
				</div><!--/span-->
			</div><!--/row-->
							
								 
                            
                                   
			

	</div><!--/.fluid-container-->
	
		</div><!--/fluid-row-->
	    <div class="common-modal modal fade" id="common-Modal1" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-content">
				<ul class="list-inline item-details">
					<li><a href="http://themifycloud.com">Admin templates</a></li>
					<li><a href="http://themescloud.org">Bootstrap themes</a></li>
				</ul>
			</div>
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
