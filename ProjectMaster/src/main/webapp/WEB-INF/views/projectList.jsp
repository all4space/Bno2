<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
	
	<!-- start: Meta -->
	<meta charset="utf-8">
	<title>MEMBER</title>
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
	
	
		
		
		
<style>
#projectadd
{
	float: right;
	margin-right: 2%; 
}
</style>
<script src="/planbe/resources/bootstrap/js/jquery-1.9.1.min.js"></script>
<script>
	function favorite(chkbox)
	{
		if (chkbox.checked == true)
		{
				alert(chkbox.value);
			
				$.ajax
				({
					url: "/planbe/member/favoriteAdd",
					type: "post",
					data: {"projectNo":chkbox.value},
					dataType: "json",
					success: function(result)
					{
						alert("즐겨찾기 추가");
					},
					error : function()
					{
						alert("error");
					}
				})
			
		}
		else
		{
			$.ajax
			({
				url: "/planbe/member/favoriteDelete",
				type: "post",
				data: {"projectNo":chkbox.value},
				dataType: "json",
				success: function(result)
				{
					alert("즐겨찾기 해제");
				},
				error : function()
				{
					alert("error");
				}
			})
		}
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
						<a href="/planbe/">Main</a> 
					<i class="icon-angle-right"></i>
				</li>
				<i class="icon-edit"></i>
				<li><a href="#">Project</a></li>
				<c:if test = "${users.authority eq 'cto' || users.authority eq 'Manager'}">
				<a id = "projectadd" href = "projectForm"><button class="btn btn-small btn-primary">Project ADD</button></a>
				</c:if>
			</ul>



			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon white list-alt"></i><span class="break"></span>Project List</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
					
					<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
								  <th>ProjectName</th>
								  <th>Content</th>
								  <th>StartDate</th>
								  <th>DueDate</th>
								  <th>Status</th>
								  <th>Update/Delete</th>
							  	  <th>Favorite</th>
							  </tr>
						  </thead>   
						  <tbody>
						  <c:forEach items = "${projectList}" var = "vo" varStatus="status">
							<tr>
								<td style="font-weight: bold">${vo.projectName}</button></a></td> 
								<td>${vo.projectContent}</td>
								<td>${vo.startDate}</td>
								<td>${vo.dueDate}</td>
								<c:choose>
									<c:when test = "${vo.projectStatus eq 'PROGRESS'}">
										<td class="center">
											<span class="label label-success">${vo.projectStatus}</span>
										</td>		
									</c:when>
									<c:when test = "${vo.projectStatus eq 'NEW'}">
										<td class="center">
											<span class="label label-warning">${vo.projectStatus}</span>
										</td>
									</c:when>
									<c:when test = "${vo.projectStatus eq 'COMPLETE'}">
										<td class="center">
											<span class="label label-important">${vo.projectStatus}</span>
										</td>
									</c:when>
								</c:choose>
								<c:choose>
								<c:when test = "${users.authority eq 'cto'}">
								<td class="center">
										<a class="btn btn-info" href="/planbe/project/projectUpdateForm?projectNo=${vo.projectNo}">
											<i class="halflings-icon white edit"></i>  
										</a>
										<a class="btn btn-danger" href="/planbe/project/projectDelete?projectNo=${vo.projectNo}">
											<i class="halflings-icon white trash" ></i> 
										</a>
									</td>
								</c:when>
								<c:when test = "${users.authority ne 'cto'}">
									<c:choose>
									<c:when test = "${member[status.index].projectAuthority eq 'Manager'}">
									<td class="center">
										<a class="btn btn-info" href="/planbe/project/projectUpdateForm?projectNo=${vo.projectNo}">
											<i class="halflings-icon white edit"></i>  
										</a>
										<a class="btn btn-danger" href="/planbe/project/projectDelete?projectNo=${vo.projectNo}">
											<i class="halflings-icon white trash" ></i> 
										</a>
									</td>
									</c:when>
									<c:when test = "${member[status.index].projectAuthority eq 'Member'}">
									<td></td>
									</c:when>
									</c:choose>
								</c:when>
								</c:choose>
								
								<c:choose>
									<c:when test = "${member[status.index].favorite eq 'YES'}">
										<td><input type = "checkbox" name="aaaa" value="${vo.projectNo}" onclick = "favorite(this)" checked="checked"></td>
									</c:when>
									<c:when test = "${member[status.index].favorite eq 'NO'}">
										<td><input type = "checkbox" name="aaaa" value="${vo.projectNo}" onclick = "favorite(this)"></td>
									</c:when>
								</c:choose>
								</tr>
							</c:forEach>
						</tbody>
					  </table>         
					</div>
				</div>
			</div><!--/span-->
		</div><!--/row-->
</div><!--/.fluid-container-->
	
</div><!--/#content.span10-->
			<!-- end: Content -->
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
	<div class="common-modal modal fade" id="common-Modal1" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<ul class="list-inline item-details">
				<li><a href="http://themifycloud.com">Admin templates</a></li>
				<li><a href="http://themescloud.org">Bootstrap themes</a></li>
			</ul>
		</div>
	</div>
	
	
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
