<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
	
	<!-- start: Meta -->
	<meta charset="utf-8">
	<title>TASK</title>
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
	<link href="/planbe/resources/bootstrap/css/EasyTable.css" rel="stylesheet">
	<link href="/planbe/resources/bootstrap/css/search.css" rel="stylesheet">
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
				<li><a href="#">Task</a></li>
			</ul>

			
			
			
		<!-- admin인 경우 -->
			
			<c:if test="${Authority == member}">
			
 <form  action="/planbe/task/updateTask" method="POST" name="form">	     
     <div class="container">
	<div class="row">
        <div class="col-sm-12">
            <legend><h1>${Authority} ${loginId}님의 UpdateTask</h1></legend>  
        </div>
        <!-- panel preview -->
      
        <div class="col-sm-5">
            <h4>Update Task:</h4>
            <div class="panel panel-default">
                <div class="panel-body form-horizontal payment-form">
                	
                	<c:if test="${updateTask !=null}">
                	
                  <table>                
                    <tr>
                  
                     <td>                                                              
                         <input type="hidden" id="projectNo" name="projectNo" readonly="readonly" value="${updateTask.projectNo}" style="width:20px"> 
                         <input type="hidden" id="memberNo" name="memberNo" readonly="readonly" value=" ${updateTask.memberNo}">  
                         <input type="hidden" id="taskNo" name="taskNo" readonly="readonly" value="${updateTask.taskNo}">    

                      </td>                         
                    </tr>
                                  
                  	<tr>
                    	<th>TaskName</th>
                     <td>
                         <input type="text" class="name" id="taskName" name="taskName" value="${updateTask.taskName}">
                     </td> 
                    </tr>
                    
                    <tr>
                       <th>Content</th>
                     	<td>                                             
                       		<textarea class="form-control" id="taskContent" name="taskContent">${updateTask.taskContent}</textarea>
                      </td> 
                    </tr> 
                                    
                    <tr>
                     <th>Priority</th>
                     <td>
                         <select  id="taskPriority" name="taskPriority">
                         	<c:choose>
                         	  <c:when test="${updateTask.taskPriority eq 'HIGH'}">
                         	  		<option>--선택--</option>
                         	  		<option selected>HIGH</option>
                         	  		<option>NORMAL</option>
                         	  		<option>LOW</option>
                         	  </c:when>
                         	  <c:when test="${updateTask.taskPriority eq 'NORMAL'}">
                         	  		<option>--선택--</option>
                         	  		<option >HIGH</option>
                         	  		<option selected>NORMAL</option>
                         	  		<option>LOW</option>
                         	  </c:when>
                         	  <c:when test="${updateTask.taskPriority eq 'LOW'}">
                         	  		<option>--선택--</option>
                         	  		<option>HIGH</option>
                         	  		<option>NORMAL</option>
                         	  		<option selected>LOW</option>
                         	  </c:when>
                         	  <c:otherwise>
                         	  		<option selected>--선택--</option>
                         	  		<option>HIGH</option>
                         	  		<option>NORMAL</option>
                         	  		<option>LOW</option>
                         	  </c:otherwise>
                         	</c:choose>
                            </select>   
                       </td>                     
                    </tr>
                    
                     <tr>
                     <th>Status</th>
                     <td>
                         <select  id="taskStatus" name="taskStatus">
                         	<c:choose>
                         	  <c:when test="${updateTask.taskStatus eq 'NEW'}">
                         	  		<option>--선택--</option>
                         	  		<option selected>NEW</option>
                         	  		<option>PROGRESS</option>
                         	  		<option>COMPLETE</option>
                         	  </c:when>
                         	  <c:when test="${updateTask.taskStatus eq 'PROGRESS'}">
                         	  		<option>--선택--</option>
                         	  		<option >NEW</option>
                         	  		<option selected>PROGRESS</option>
                         	  		<option>COMPLETE</option>
                         	  </c:when>
                         	  <c:when test="${updateTask.taskStatus eq 'COMPLETE'}">
                         	  		<option>--선택--</option>
                         	  		<option>NEW</option>
                         	  		<option>PROGRESS</option>
                         	  		<option selected>COMPLETE</option>
                         	  </c:when>
                         	  <c:otherwise>
                         	  		<option selected>--선택--</option>
                         	  		<option>NEW</option>
                         	  		<option>PROGRESS</option>
                         	  		<option>COMPLETE</option>
                         	  </c:otherwise>
                         	</c:choose>
                            </select>   
                       </td>                     
                    </tr>
                                                                    
                    <tr>
                     <th>StarDate</th>
                      <td>                    
                         <input type="date" class="form-control" id="startDate" name="startDate" value="${updateTask.startDate}">
                        
                      </td>                        
                    </tr> 
                    
                    <tr>
                     <th>DueDate</th>
                     <td>
                        <input type="date" class="form-control" id="dueDate" name="dueDate" value="${updateTask.dueDate}">
                      <td>      
                    </tr>
                    
                     <tr>
                     <th>TotalTime</th>
                      <td>                    
                         <input type="text" class="form-control" id="totaltime" name="totalTime" style="width:20px" value="${updateTask.totalTime}">시간
                      </td>      
                    </tr>
                    
                     <tr>
                     <th>DoneTime</th>
                      <td>                    
                         <input type="text" class="form-control" id="donetime" name="doneTime" style="width:20px" value="${updateTask.doneTime}" >시간
                      </td>      
                    </tr>
                    
                    
                  </table> 
                  
                  </c:if>
                  
               
                    <div class="form-group">                   
                        <div class="col-sm-12 text-right">
                            <input type="submit" class="btn btn-default preview-add-button" value="Update" id="updateTask">
                                <span class="glyphicon glyphicon-plus"></span> 
                             <input type="button" class="btn btn-default preview-add-button" value="Delete" id="delete" >
                              <span class="glyphicon glyphicon-plus"></span> 
                                                                               
                            <a href="/planbe/task/taskForm/"><button type="button" class="btn btn-default preview-cancel-button">
                                <span class="glyphicon glyphicon-plus"></span> cancel
                            </button></a>
                            
                        </div>
                    </div>
                                          
                                 
                </div>
            </div>            
        </div> <!-- / panel preview -->
  
      </div>
   </div>
    </form>      
			
 </c:if>

		
	<!-- 프로젝트 리스트 가져오기 끝 -->	
			
	  <!-- admin인 경우 끝 -->
	  
	  <!-- admin이 아닌 경우 시작 -->
       
    
    
       
      <div class="container">
	<div class="row">
		
	<!-- admin이 아닌 경우 -->
       
      <c:if test="${Authority != member}">
      
   <form  action="/planbe/task/updateTask" method="POST" name="form">	     
     <div class="container">
	<div class="row">
        <div class="col-sm-12">
            <legend><h1>${Authority} ${loginId}님의 UpdateTask</h1></legend>  
        </div>
        <!-- panel preview -->
      
        <div class="col-sm-5">
            <h4>Update Task:</h4>
            <div class="panel panel-default">
                <div class="panel-body form-horizontal payment-form">
                	
                	<c:if test="${updateTask !=null}">
                	
                  <table>                
                    <tr>
               
                     <td>                                                              
                         <input type="hidden" id="projectNo" name="projectNo" readonly="readonly" value="${updateTask.projectNo}" style="width:20px"> 
                         <input type="hidden" id="memberNo" name="memberNo" readonly="readonly" value=" ${updateTask.memberNo}">  
                         <input type="hidden" id="taskNo" name="taskNo" readonly="readonly" value="${updateTask.taskNo}">    

                      </td>                         
                    </tr>
                                  
                  	<tr>
                    	<th>TaskName</th>
                     <td>
                         <input type="text" class="name" id="taskName" name="taskName" value="${updateTask.taskName}">
                     </td> 
                    </tr>
                    
                    <tr>
                       <th>Content</th>
                     	<td>                                             
                       		<textarea class="form-control" id="taskContent" name="taskContent">${updateTask.taskContent}</textarea>
                      </td> 
                    </tr> 
                                    
                    <tr>
                     <th>Priority</th>
                     <td>
                         <select  id="taskPriority" name="taskPriority">
                         	<c:choose>
                         	  <c:when test="${updateTask.taskPriority eq 'HIGH'}">
                         	  		<option>--선택--</option>
                         	  		<option selected>HIGH</option>
                         	  		<option>NORMAL</option>
                         	  		<option>LOW</option>
                         	  </c:when>
                         	  <c:when test="${updateTask.taskPriority eq 'NORMAL'}">
                         	  		<option>--선택--</option>
                         	  		<option >HIGH</option>
                         	  		<option selected>NORMAL</option>
                         	  		<option>LOW</option>
                         	  </c:when>
                         	  <c:when test="${updateTask.taskPriority eq 'LOW'}">
                         	  		<option>--선택--</option>
                         	  		<option>HIGH</option>
                         	  		<option>NORMAL</option>
                         	  		<option selected>LOW</option>
                         	  </c:when>
                         	  <c:otherwise>
                         	  		<option selected>--선택--</option>
                         	  		<option>HIGH</option>
                         	  		<option>NORMAL</option>
                         	  		<option>LOW</option>
                         	  </c:otherwise>
                         	</c:choose>
                            </select>   
                       </td>                     
                    </tr>
                    
                     <tr>
                     <th>Status</th>
                     <td>
                         <select  id="taskStatus" name="taskStatus">
                         	<c:choose>
                         	  <c:when test="${updateTask.taskStatus eq 'NEW'}">
                         	  		<option>--선택--</option>
                         	  		<option selected>NEW</option>
                         	  		<option>PROGRESS</option>
                         	  		<option>COMPLETE</option>
                         	  </c:when>
                         	  <c:when test="${updateTask.taskStatus eq 'PROGRESS'}">
                         	  		<option>--선택--</option>
                         	  		<option >NEW</option>
                         	  		<option selected>PROGRESS</option>
                         	  		<option>COMPLETE</option>
                         	  </c:when>
                         	  <c:when test="${updateTask.taskStatus eq 'COMPLETE'}">
                         	  		<option>--선택--</option>
                         	  		<option>NEW</option>
                         	  		<option>PROGRESS</option>
                         	  		<option selected>COMPLETE</option>
                         	  </c:when>
                         	  <c:otherwise>
                         	  		<option selected>--선택--</option>
                         	  		<option>NEW</option>
                         	  		<option>PROGRESS</option>
                         	  		<option>COMPLETE</option>
                         	  </c:otherwise>
                         	</c:choose>
                            </select>   
                       </td>                     
                    </tr>
                                                                    
                    <tr>
                     <th>StarDate</th>
                      <td>                    
                         <input type="date" class="form-control" id="startDate" name="startDate" value="${updateTask.startDate}">
                        
                      </td>                        
                    </tr> 
                    
                    <tr>
                     <th>DueDate</th>
                     <td>
                        <input type="date" class="form-control" id="dueDate" name="dueDate" value="${updateTask.dueDate}">
                      <td>      
                    </tr>
                    
                     <tr>
                     <th>TotalTime</th>
                      <td>                    
                         <input type="text" class="form-control" id="totaltime" name="totalTime" style="width:20px" value="${updateTask.totalTime}">시간
                      </td>      
                    </tr>
                    
                     <tr>
                     <th>DoneTime</th>
                      <td>                    
                         <input type="text" class="form-control" id="donetime" name="doneTime" style="width:20px" value="${updateTask.doneTime}" >시간
                      </td>      
                    </tr>
                    
                    
                  </table> 
                  
                  </c:if>
                  
               
                    <div class="form-group">                   
                        <div class="col-sm-12 text-right">
                            <input type="submit" class="btn btn-default preview-add-button" value="Update" id="updateTask">
                                <span class="glyphicon glyphicon-plus"></span> 
                             <input type="button" class="btn btn-default preview-add-button" value="Delete" id="delete" >
                              <span class="glyphicon glyphicon-plus"></span> 
                                                                               
                            <a href="/planbe/task/taskForm/"><button type="button" class="btn btn-default preview-cancel-button">
                                <span class="glyphicon glyphicon-plus"></span> cancel
                            </button></a>
                            
                        </div>
                    </div>
                                          
                                 
                </div>
            </div>            
        </div> <!-- / panel preview -->
  
      </div>
   </div>
    </form>      
  </c:if>
<!-- admin이 아닌 경우 끝 -->
																
	
	</div>
		 
		
</div>

<!-- admin이 아닌 경우 끝 --> 		
			
       

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
		
		<script src="/planbe/resources/bootstrap/js/updateTask.js"></script> <!-- updateTask jquery 링크 -->
		
		<script src="/planbe/resources/bootstrap/js/deleteTask.js"></script>
		
	<!-- end: JavaScript-->
	
</body>
</html>
