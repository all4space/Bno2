<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
	
	<!-- start: Meta -->
	<meta charset="utf-8">
	<title>PROJECT</title>
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
	
<script src="/planbe/resources/js/jquery-3.2.1.min.js"></script>	
	
<script>
	

	/* 
	var my_p_list = "<c:out value='${my_p_list}'/>";
	var my_u_list = "<c:out value='${my_u_list}'/>";
	var all_p_list = "<c:out value='${all_p_list}'/>";
	var all_u_list = "<c:out value='${all_u_list}'/>";
	 */
	
	
/* receiver groupSelect */ 
  
 
var group;

function groupSelect(obj){
 
	// ProjectList or MemberList 가져오기 
	//alert("function In" + obj.value);
	
	group = obj.value;
	
	$.ajax({
		url: "/planbe/mail/getSelectList",
		type: "post",
		data: {"group" : obj.value},
		dataType: "json",
		success: function(result){
			
			alert("success in");

  			var all_p_list = result.all_p_list;
  			var my_p_list = result.my_p_list;
  			var all_u_list = result.all_u_list;
  			var my_u_list = result.my_u_list;
  			
  			var addRow = "";
  			
		    $("#selectedList").empty();

		    if(all_p_list != undefined) {
	  			$(all_p_list).each(function(index, item) {
					addRow += '<option value="'+item.projectNo+'">' + item.projectName + '</option>'; 
				});
  			} 
  				
  			if(all_u_list != undefined) {
	  			$(all_u_list).each(function(index, item) {
					addRow += '<option value="'+item.userNo+'">' + item.userName + '</option>';
				});
  			} 
  			
  			if(my_p_list != undefined) {
	  			$(my_p_list).each(function(index, item) {
					addRow += '<option value="'+item.projectNo+'">' + item.projectName + '</option>';
				});
  			} 
  			
  			if(my_u_list != undefined) {
	  			$(my_u_list).each(function(index, item) {
					addRow += '<option value="'+item.userNo+'">' + item.userName + '</option>';
				});
  			} 

			$("#selectedList").append(addRow);
		    $("#selectedList").trigger("liszt:updated");
						
		},
		error : function(){
			alert("에러뭐든");
		}
	}); 
}//groupSelect  
			

/* send Mail */
function sendMail(){

	alert(group);
	
	var p_no_list="";
	var u_no_list="";
	
	var data = $("#selectedList").val();
	
	if(group == "project"){
		// receiveProject = $("#selectedList :selected").text(); // 300304 
	//	var data = $("#selectedList").val(); // 300,304
		for(var i=0; i<data.length; i++){
			p_no_list += data[i]+",";
		}
	}
			
	if(group == "member"){
		for(var i=0; i<data.length; i++){
			u_no_list += data[i]+",";
		}
	}
			
	var mailTitle = $("#mailTitle").val();
	var mailContent = $("#mailContent").val();
	
//	var list = 	$("#receiveProject :selected").text();;
	
	$.ajax({	
		url: "/planbe/mail/sendMail",
		type: "post",
		data: {
			   "mailTitle": mailTitle, 
			   "mailContent": mailContent, 
			   "p_no_list" : p_no_list,
			   "u_no_list" : u_no_list,
			   "mailTag": $("#mailTag").val()
		       },
			   
		// dataType: "json",
		success: function(result){
			alert("success in");
		},
		
		error : function(){
			alert("sendMail 에라");
		}
	}); 
}
				   

function mailList(){
	location.href="/planbe/mail/mailList";
}
			
/*============================================================================================*/
/* //그룹 멤버리스트
 */
 function managerSelect(manager)
 {
	alert(manager.value);
	$.ajax
	({
		url :"/planbe/project/groupMemberList",
		type: "post",
		data:{"userId":manager.value},
		dataType:"json",
		success: function(result)
		{
			$("#groupMemberList").empty();
			
			$(result).each(function(index, item){
			var addRow = '<option>'
						+ item.userId
						+ '</option>';
						
			$("#groupMemberList").append(addRow);
			
			})
			$("#groupMemberList").trigger("liszt:updated");
		},
		
		error : function()
		{
			alert("응 안되");
		}
		
		
	})
 }
 /*
function managerSelect(manager) //그룹이름에 따른 멤버 리스트 select ver
{
	alert("록담이!!!" + manager.value);
	$.ajax
	({
		url: "/planbe/project/groupMemberList",
		type: "post",
		data: {"userId":manager.value},
		dataType: "json",
		success: function(result)
		{
			
			$("#groupMemberList").empty();
			
			$(result).each(function(index, item){
			var addRow = '<option>'
						+ item.userId
						+ '</option>';
						
			$("#groupMemberList").append(addRow);
			
			
			})
			$("#groupMemberList").trigger("liszt:updated");
			
		},
		error : function()
		{
		alert("록담아 제발!!");
	}
})
} */

/*=============================================================================================================  */
 
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
					<a href="index.jsp">Main</a>
					<i class="icon-angle-right"></i> 
				</li>
				<li>
					<i class="icon-edit"></i>
					<a href="#">Mail</a>
				</li>
			</ul>
							  

			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon white edit"></i><span class="break"></span>Mail</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
						<form class="form-horizontal">
						  <fieldset>
							<div class="control-group">
							  <label class="control-label" for="typeahead">Mail Title</label>
							  <div class="controls">
								<input type="text" class="span6 typeahead" id="mailTitle"  data-provide="typeahead" data-items="4" data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
								<p class="help-block">Start typing to activate auto complete!</p>
							  </div>
							</div>
							<!-- Date 는 Sysdate 로  
							<div class="control-group">
							  <label class="control-label" for="date01">Send Date</label>
							  <div class="controls">
								<input type="text" class="input-xlarge datepicker" id="date01" value="02/16/12">
							  </div>
							</div>
                             -->
                            <!-- 
							<div class="control-group">
							  <label class="control-label" for="fileInput">File input</label>
							  <div class="controls">
								<input class="input-file uniform_on" id="fileInput" type="file">
							  </div>
							</div>       
							  --> 
							  
							  <div class="control-group">
								<label class="control-label" for="selectError">Mail Tag</label>
								<div class="controls">
								  <select id="mailTag" data-rel="chosen">
									<option>INFO</option>
									<option>PROBLEM</option>
									<option>TASK</option>
								    <option>PLAN</option>
								  </select>
								</div>
							  </div>
							  <%-- 
							    <select id="groupManagerList" name = "managerId" data-rel="chosen" onchange="javascrpipt:managerSelect(this)">
								  	<option>Manager Select</option>
								  	<c:forEach items="${groupManagerList}" var="groupManagerList" >
									<option>${groupManagerList.userId}</option>
								  </c:forEach>
								  </select>
							  
							   --%>
							  
							  <div class="control-group">
								<label class="control-label" for="selectError">Receiver Group</label>
								<div class="controls">
								  <select id="groupSelectList" name="" data-rel="chosen" onchange="javascript:groupSelect(this)">
									<option value="all">ALL</option>
									<option value="project">PROJECT</option>
									<option value="member">MEMBER</option>
								  </select>
								</div>
							  </div>
							  
							  <div class="control-group">
								<label class="control-label" for="selectError1">Receiver</label>
								<div class="controls">
								  <select id="selectedList" name="selectedList" multiple data-rel="chosen">
								  </select>
								</div>
							  </div>
							    
							   
							<div class="control-group hidden-phone">
							  <label class="control-label" for="textarea2">Mail Content</label>
							  <div class="controls">
								<textarea class="cleditor" id="mailContent" rows="3"></textarea>
							  </div>
							</div>
							<div class="form-actions">
							  <button type="submit" class="btn btn-primary" onclick="sendMail()">Send Mail</button>
							  <button type="reset" class="btn">Cancel</button>
							  <button type="reset" class="btn" onclick="mailList()">MailList Test btn</button>
							</div>
						  </fieldset>
						</form>   

					</div>
				</div><!--/span-->

			</div><!--/row-->

	</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
		
	<div class="modal hide fade" id="myModal">
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
	
	<div class="clearfix"></div>
	
    <footer>

		<p>
			<span style="text-align:left;float:left">&copy; 2017 <a href="/planbe/ourTeam" alt="Bootstrap_Metro_Dashboard">SCIT MASTER 33rd CLASS B TEAM 2 </a></span>
			
		</p>

	</footer>
	
<!--========================================================================================================= -->	
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
