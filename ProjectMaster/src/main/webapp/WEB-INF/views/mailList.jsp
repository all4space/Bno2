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

<script>

/* receiver groupSelect */ 

var group;

function groupSelect(obj){
 
	// ProjectList or MemberList 가져오기 
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
		success: function(result){
			alert("success in");
			if(result) location.href="/planbe/mail/mailList"; 
		}
	}); 
}
		
				   
/* 메일 내용 확인하기 */	

var mail_no; 

function showContent(mailNo){
	alert("메일 확인");
	//alert(mailNo);
    mail_no = mailNo;
	
	$.ajax({
  		url: "/planbe/mail/getMailInfo",
  		type: "post",
  		data: {"mailNo" : mailNo},
  		datatype: "json",
  		success: function(result) {
            
  			var mail = result.mail;
  			var writer = result.writer; 
  			
          //  $(mail).each(function(index, item) {
            	$("#msgHead").empty();		
            	var data = "<h1>" + mail.mailTitle + "</h1>"
            	         + "<div class='from'><i class='halflings-icon user'></i> <b>" + writer + "</b></div>"
                         + "<div class='date'><i class='halflings-icon time'></i> <b>" + mail.sendDate + "</b></div>";
            	$("#msgHead").append(data);
            	
            	$("#msgBody").empty();		
            	var data2 = mail.mailContent;
            	$("#msgBody").append(data2);
            	
   		   // }); // for each 
		}// success
    });
}
  			
            
/* 메일 확인 체크하기  */
function checkMail(mailNo){
	alert("체크 메일");
	location.href="/planbe/mail/checkMail?mailNo=" + mailNo; 
}
 
/* 메일 삭제하기 */ 
function deleteMail(){
    alert("메일 삭제");
    if(mail_no == undefined){
    	  var no = $("#hiddenNo").val(); 
    	  mail_no = no;
    }	
    location.href="/planbe/mail/deleteMail?mailNo=" + mail_no; 
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
					<a href="/planbe/">Home</a> 
					<i class="icon-angle-right"></i>
				</li>
				<li><a href="#">Mail</a></li>
			</ul>


			<div class="row-fluid">
				
				<div class="span7">
				    <!-- 개인 단위로 받은 메일 리스트 -->
					<h1>Private Inbox</h1>
					
					<ul class="messagesList">
					<c:forEach items="${m_mail_list}" var="vo" varStatus="status">
						<li>
							<span class="from">
							 <c:choose>
								 <c:when test="${vo.checkMail == 'NO'}">
								   <i class='icon-check-empty' onclick='checkMail(${vo.mailNo})'></i>
								 </c:when>
								 <c:when test="${vo.checkMail == 'YES'}">
								   <i class='icon-check'></i>
								 </c:when>
							 </c:choose>
							 ${u_name_list[status.index]}</span><span class="title" onclick="showContent(${vo.mailNo})">
                             <c:choose>
					  			 <c:when test="${vo.mailTag == 'INFO'}">
	      							<span class="label label-info">${vo.mailTag}</span>
					  			 </c:when>
					  			 <c:when test="${vo.mailTag == 'TASK'}">
					  				 <span class="label label-success">${vo.mailTag}</span>
					  			 </c:when>
					  			 <c:when test="${vo.mailTag == 'PROBLEM'}">
					  				 <span class="label label-important">${vo.mailTag}</span>
					  			 </c:when>
					  			 <c:otherwise>
					  				<span class="label label-warning">${vo.mailTag}</span>
					  			 </c:otherwise>
						     </c:choose>		
						     ${vo.mailTitle}</span><span class="date"><b>${vo.sendDate}</b></span>
						</li>
                    </c:forEach>
					</ul>
					
					<!-- 개인이 소속된 프로젝트 단위로 받은 메일 리스트  -->
					<h1>Project Inbox</h1>
					
					<ul class="messagesList">
					<c:forEach items="${p_mail_list}" var="vo" varStatus="status">
						<li>
							<span class="from">
							 <c:choose>
								 <c:when test="${vo.checkMail == 'NO'}">
								   <i class='icon-check-empty' onclick='checkMail(${vo.mailNo})'></i>
								 </c:when>
								 <c:when test="${vo.checkMail == 'YES'}">
								   <i class='icon-check'></i>
								 </c:when>
							 </c:choose>
							 ${u_name_list2[status.index]}  <span class="label label">${p_name_list[status.index]}</span></span><span class="title" onclick="showContent(${vo.mailNo})">
                             <c:choose>
					  			 <c:when test="${vo.mailTag == 'INFO'}">
	      							<span class="label label-info">${vo.mailTag}</span>
					  			 </c:when>
					  			 <c:when test="${vo.mailTag == 'TASK'}">
					  				 <span class="label label-success">${vo.mailTag}</span>
					  			 </c:when>
					  			 <c:when test="${vo.mailTag == 'PROBLEM'}">
					  				 <span class="label label-important">${vo.mailTag}</span>
					  			 </c:when>
					  			 <c:otherwise>
					  				<span class="label label-warning">${vo.mailTag}</span>
					  			 </c:otherwise>
						     </c:choose>									
							${vo.mailTitle}</span><span class="date"><b>${vo.sendDate}</b></span>
						</li>
					</c:forEach>
					</ul>
					
					<!-- 개인 단위로 보낸 메일 리스트  -->
					<h1>Private Outbox</h1>
					
					<ul class="messagesList">
					<c:forEach items="${send_to_M}" var="vo" varStatus="status">
						<li>
							<span class="from">
                             <c:choose>
								 <c:when test="${vo.checkMail == 'NO'}">
								   <i class='icon-check-empty'></i>
								 </c:when>
								 <c:when test="${vo.checkMail == 'YES'}">
								   <i class='icon-check'></i>
								 </c:when>
							 </c:choose>							 
							${u_name_list3[status.index]}</span><span class="title" onclick="showContent(${vo.mailNo})">
							 <c:choose>
					  			 <c:when test="${vo.mailTag == 'INFO'}">
	      							<span class="label label-info">${vo.mailTag}</span>
					  			 </c:when>
					  			 <c:when test="${vo.mailTag == 'TASK'}">
					  				 <span class="label label-success">${vo.mailTag}</span>
					  			 </c:when>
					  			 <c:when test="${vo.mailTag == 'PROBLEM'}">
					  				 <span class="label label-important">${vo.mailTag}</span>
					  			 </c:when>
					  			 <c:otherwise>
					  				<span class="label label-warning">${vo.mailTag}</span>
					  			 </c:otherwise>
						     </c:choose>		
							${vo.mailTitle}</span><span class="date"><b>${vo.sendDate}</b></span>
						</li>
					</c:forEach>	
					</ul>	
					
					<!-- 프로젝트 단위로 보낸 메일 리스트  -->
					<h1>Project Outbox</h1>
					
					<ul class="messagesList">
					<c:forEach items="${send_to_P}" var="vo" varStatus="status">
						<li>
							<span class="from">
							<c:choose>
								 <c:when test="${vo.checkMail == 'NO'}">
								   <i class='icon-check-empty'></i>
								 </c:when>
								 <c:when test="${vo.checkMail == 'YES'}">
								   <i class='icon-check'></i>
								 </c:when>
							 </c:choose>	 
							 ${p_name_list2[status.index]}</span><span class="title" onclick="showContent(${vo.mailNo})">
							 <c:choose>
					  			 <c:when test="${vo.mailTag == 'INFO'}">
	      							<span class="label label-info">${vo.mailTag}</span>
					  			 </c:when>
					  			 <c:when test="${vo.mailTag == 'TASK'}">
					  				 <span class="label label-success">${vo.mailTag}</span>
					  			 </c:when>
					  			 <c:when test="${vo.mailTag == 'PROBLEM'}">
					  				 <span class="label label-important">${vo.mailTag}</span>
					  			 </c:when>
					  			 <c:otherwise>
					  				<span class="label label-warning">${vo.mailTag}</span>
					  			 </c:otherwise>
						     </c:choose>		
							${vo.mailTitle}</span><span class="date"><b>${vo.sendDate}</b></span>
						</li>
					</c:forEach>	
					</ul>	
						
					<div class="common-modal modal fade" id="common-Modal1" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-content">
							<ul class="list-inline item-details">
								<li><a href="http://themifycloud.com">Admin templates</a></li>
								<li><a href="http://themescloud.org">Bootstrap themes</a></li>
							</ul>
						</div>
					</div>	
				</div>
				
				
				<div class="span5 noMarginLeft">
					
					<div class="message dark">
						<!-- 메일 확인 디폴트 : 개인 단위로 받은 메일의 최신 메일 -->
						<div class="header" id="msgHead">
						    <input type="hidden" id="hiddenNo" value="${m_mail_list[0].mailNo}">
							<h1>${m_mail_list[0].mailTitle}</h1>
							<div class="from"><i class="halflings-icon user"></i> <b>${u_name_list[0]}</b></div>
							<div class="date"><i class="halflings-icon time"></i> <b>${m_mail_list[0].sendDate}</b></div>
							
							<div class="menu"></div>
							
						</div>
						
						<div class="content" >
							<blockquote id="msgBody">
							${m_mail_list[0].mailContent}
							</blockquote>
						<div>
						
						<hr style="background-color : silver;">
						
							<div class="control-group">
							  <label class="control-label" for="typeahead">Mail Title</label>
							  <div class="controls">
								<input type="text" class="span6 typeahead" id="mailTitle"  data-provide="typeahead" data-items="4" data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
								<p class="help-block">Start typing to activate auto complete!</p>
							  </div>
							</div>
							  
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
							 
							 <div class="actions">
							   <button type="submit" class="btn btn-primary" onclick="sendMail()">Send Mail</button>
							   <button type="reset" class="btn">Cancel</button>
							   <button tabindex="3" type="button" class="btn btn-success" onclick="deleteMail()">Delete Mail</button>
							 </div>
							
						</div>
						</div>
						
					</div>	
					
				</div>
						
			</div>
			
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
