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
	
	
/* 메일 내용 확인하기 */	

var mail_no; 

function showContent(mailNo){
	alert("메일 확인");
	alert(mailNo);
	
	mail_no = mailNo;
	
	$.ajax({
  		url: "/planbe/mail/getMailInfo",
  		type: "post",
  		data: {"mailNo" : mailNo},
  		datatype: "json",
  		success: function(result) {
            alert("success에 들어옴");	
            
            $(result).each(function(index, item) {
            	$("#msgHead").empty();		
            	var data = "<h1>" + result.mailTitle + "</h1>"
                         + "<div class='date'><i class='halflings-icon time'></i> <b>" + result.sendDate + "</b></div>";
            	$("#msgHead").append(data);
            	
            	$("#msgBody").empty();		
            	var data2 = "<blockquote>" + result.mailContent + "</blockquote>";
            	$("#msgBody").append(data2);
            	
   		    }); // for each 
		}// success
    });
}
  			
            
/* 메일 확인 체크하기  */
function checkMail(){
	alert("체크 메일");
	location.href="/planbe/mail/checkMail?mailNo=" + mail_no; 
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
					<a href="index.jsp">Home</a> 
					<i class="icon-angle-right"></i>
				</li>
				<li><a href="#">Mail</a></li>
			</ul>


			<div class="row-fluid">
				
				<div class="span7">
					<h1>Private Inbox</h1>
					
					<ul class="messagesList">
					<c:forEach items="${mmlist}" var="vo" varStatus="status">
						<li>
							<span class="from"><span class="glyphicons star"><i></i></span>${umlist[status.index]}</span><span class="title" onclick="showContent(${vo.mailNo})">
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
					
					
					<h1>Project Inbox</h1>
					
					<ul class="messagesList">
					
					<c:forEach items="${pmlist}" var="vo" varStatus="status">
						<li>
							<span class="from"><span class="glyphicons star"><i></i></span>${umlist2[status.index]}</span><span class="title" onclick="showContent(${vo.mailNo})">
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
					
					<h1>Private Outbox</h1>
					
					<ul class="messagesList">
					<c:forEach items="${sendM}" var="vo" varStatus="status">
						<li>
							<span class="from"><span class="glyphicons star"><i></i></span>${unlist[status.index]}</span><span class="title" onclick="showContent(${vo.mailNo})">
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
					
					<h1>Project Outbox</h1>
					
					<ul class="messagesList">
					<c:forEach items="${sendP}" var="vo" varStatus="status">
						<li>
							<span class="from"><span class="glyphicons star"><i></i></span>${pnlist[status.index]}</span><span class="title" onclick="showContent(${vo.mailNo})">
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
						
						<div class="header" id="msgHead">
							<h1>${mmlist[0].mailTitle}</h1>
						<%-- 	<div class="from"><i class="halflings-icon user"></i> <b>${umlist[0]}</b></div> --%>
							<div class="date"><i class="halflings-icon time"></i> <b>${mmlist[0].sendDate}</b></div>
							
							<div class="menu"></div>
							
						</div>
						
						<div class="content" id="msgBody">
							<blockquote>
							${mmlist[0].mailContent}
							</blockquote>
						</div>
						<!-- 
						<div class="attachments">
							<ul>
								<li>
									<span class="label label-important">zip</span> <b>bootstrap.zip</b> <i>(2,5MB)</i>
									<span class="quickMenu">
										<a href="#" class="glyphicons search"><i></i></a>
										<a href="#" class="glyphicons share"><i></i></a>
										<a href="#" class="glyphicons cloud-download"><i></i></a>
									</span>
								</li>
								<li>
									<span class="label label-info">txt</span> <b>readme.txt</b> <i>(7KB)</i>
									<span class="quickMenu">
										<a href="#" class="glyphicons search"><i></i></a>
										<a href="#" class="glyphicons share"><i></i></a>
										<a href="#" class="glyphicons cloud-download"><i></i></a>
									</span>
								</li>
								<li>
									<span class="label label-success">xls</span> <b>spreadsheet.xls</b> <i>(984KB)</i>
									<span class="quickMenu">
										<a href="#" class="glyphicons search"><i></i></a>
										<a href="#" class="glyphicons share"><i></i></a>
										<a href="#" class="glyphicons cloud-download"><i></i></a>
									</span>
								</li>
							</ul>		
						</div>
						 -->
					<!-- 	<form class="replyForm"method="post" action=""> -->

							<fieldset>
							<!-- 	<textarea tabindex="3" class="input-xlarge span12" id="message" name="body" rows="12" placeholder="Click here to reply"></textarea> -->

								<div class="actions">
									
									<button tabindex="3" type="button" class="btn btn-success" onclick="checkMail()">Check message</button>
									
								</div>

							</fieldset>
<!-- 
						</form>	 -->
						
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
