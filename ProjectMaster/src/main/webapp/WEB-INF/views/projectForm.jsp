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
	
/* 
	function groupSelect(obj) //그룹이름에 따른 멤버 리스트 select ver
	{
 
	//그룹 매니저 리스트
	alert("groupManagerList function In" + obj.value);
	$.ajax
	({
		url: "/planbe/project/groupManagerList",
		type: "post",
		data: {"groupName":obj.value},
		dataType: "json",
		success: function(result)
		{
			
			$("#groupManagerList").empty();
			var addRow = '<option>Manager Select</option>';
			
			$(result).each(function(index, item){
			addRow += '<option>'
						+ item.userId
						+ '</option>';
						
			
			
			})
			$("#groupManagerList").append(addRow);
			$("#groupManagerList").trigger("liszt:updated");
			
		},
		error : function()
		{
			alert("에러뭐든");
		}
	})
} */

/* $(function(){
    var $form = $(this),
        $submit = $form.find('#submit');

    $submit.on('click', function () {
        noty({
            text: 'asdf',
            buttons: [{
                addClass: 'btn btn-primary noty',
                text: 'Ok',
                onClick: function ($noty) {

                    // this = button element
                    // $noty = $noty element

                    $noty.close();
                    $form.submit();
                }
            }, {
                addClass: 'btn btn-primary noty',
                text: 'Cancel',
                onClick: function ($noty) {
                    $noty.close();
                    noty({
                        text: 'You clicked "Cancel" button',
                        type: 'error'
                    });
                }
            }]
        });
        
        return false;
    });
 */

/* //그룹 멤버리스트
 */
 function managerSelect(manager)
 {
	/* alert(manager.value); */
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
		
	/* 	error : function()
		{
			alert("응 안되");
		}
		 */
		
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
				<li>
					<i class="icon-edit"></i>
					<a href="#">Project Add</a>
				</li>
			</ul>
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon white edit"></i><span class="break"></span>Project Add</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
						<form action = "/planbe/project/projectAdd" method = "post" class="form-horizontal">
						
						
						  <fieldset>
							<div class="control-group">
							  <label class="control-label" for="typeahead">Project Name </label>
							  <div class="controls">
								<input type="text" class="span6 typeahead" id="projectName" name ="projectName"  data-provide="typeahead" data-items="4" data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
								<!-- 자동완성 데이터 넣을거 있는지. 추후 사용가능 -->
								
							  </div>
						  </div>
							<div class="control-group">
							  <label class="control-label" for="date01">Start Date</label>
							  <div class="controls">
								<input type="text" class="input-xlarge datepicker" id="startDate" name = "startDate" value="">
							  </div>
							</div> <!-- START DATE 년/월/일 설정하는법 -->
							
							<div class="control-group">
							  <label class="control-label" for="date01">Start Date</label>
							  <div class="controls">	
								<input type="text" class="input-xlarge datepicker" id="dueDate" name = "dueDate" value="">
							  </div>
							</div> <!-- START DATE 년/월/일 설정하는법 -->
							
							 <div class="control-group hidden-phone">
							  <label class="control-label" for="textarea1">Project Content</label>
							  <div class="controls">
								<textarea class="cleditor" id="textarea1" name = "projectContent" rows="3"></textarea>
							  </div>
							</div> <!-- 컨텐츠 - > 글꼴 설정 필요한지 -->
							
							<div class="control-group">
								<label class="control-label" for="selectError3">Project State</label>
								<div class="controls">
								  <select id="projectState" name = "projectStatus">
									<option>NEW</option>
									<option>PROGRESS</option>
									<option>COMPLETE</option>
								  </select>
								</div>
							  </div>	
							  
							  
							<%-- <div class="control-group">
								<label class="control-label" for="groupNameList">Group Select</label>
								<div class="controls">
<!--리스트  -->								  
								  <select id="groupNameList" name = "groupName" class="groupNameList" data-rel="chosen" onchange="javascript:groupSelect(this);">
								  <c:forEach items="${groupNameList}" var="groupNameList" >
									<option>${groupNameList.groupName}</option>
								  </c:forEach>
								  </select>
								</div>
							  </div> --%>
							  
							  <div class="control-group">
								<label class="control-label">Manager Select</label>
								<div class="controls">
<!--리스트  -->								  
								  <select id="groupManagerList" name = "managerId" data-rel="chosen" onchange="javascrpipt:managerSelect(this)">
								  	<option>Manager Select</option>
								  	<c:forEach items="${groupManagerList}" var="groupManagerList" >
									<option>${groupManagerList.userId}</option>
								  </c:forEach>
								  </select>
								</div>
							  </div>
							  
							   <div class="control-group">
								<label class="control-label">Member Select</label>
								<div class="controls">
<!--리스트  -->								  
								  <select id="groupMemberList" name = "memberList" multiple data-rel="chosen">
								  </select>
								</div>
							  </div>
<!--멤버  -->						  
								<div class="form-actions">
							  <button id = submit type="submit" class="btn btn-primary">CONFIRM</button>
							  <input type = "button" onclick = "location.href = '/planbe/project/projectList'" class = "btn" value = "Cancel"></input>
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
			<span style="text-align:left;float:left">&copy; 2013 <a href="http://themifycloud.com/downloads/janux-free-responsive-admin-dashboard-template/" alt="Bootstrap_Metro_Dashboard">JANUX Responsive Dashboard</a></span>
			
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
