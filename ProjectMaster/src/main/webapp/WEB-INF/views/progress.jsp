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
	
<!-- select box 선택 값 가져오기 -->
<script>
function change(number){
	
	var value=number.value;
	
	if (number.value == "allTask") {
		
	
	location.href="/planbe/task/selectTask?value="+0+"&taskValue="+number.value;
	
	}else{
	
	location.href="/planbe/task/selectTask?value="+value;		
	}
	
}

</script>
	<!-- select box 선택 값 가져오기 -->
	
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

		<!-- member인 경우  시작-->
       
      <c:if test="${Authority =='member'}">
      <div class="userId">
      <h1>${Authority} ${loginId}님의 Progress</h1>
     </div>
      
      
      
       <!-- 검색 창 만들기 -->
      
   <div class="searchProgress">
                	<ul>                		
                		<li>	
                			<select id="searchProgressType"  style="width:100px"  onchange="javascipt:change(this)">
                				<option value="Task" selected="selected">Task이름</option>               			 
                					<c:forEach items="${allList}" var="allList">
                				<option value="${allList.taskNo}">${allList.taskName}</option>
                				    </c:forEach>
                				 <option value="allTask">--AllTask--</option>                   				                   			              				
   	            			</select>
  	                      	
   	                     </li> 	 	
                	</ul>
                	
        
         </div>
        
      
        
  		
         
        <!-- getChart 만들기 시작 -->
      
      
       <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
       
      
       
       	<c:if test="${searchProgress != null}">
  		 <div id="top_x_div" style="width: 1800px; height: 400px; margin:0px 0 0 260px;" ></div>
    	</c:if>
    	
    	
    		<c:if test="${totalList != null}">    		  
    	      <div id="series_chart_div" style="width: 1300px; height: 600px; margin:0px 0 0 50px"></div>
    		</c:if>
    		
    		
  		
         
      <script>
      
      google.charts.load('current', {packages: ['corechart', 'bar']});
      google.charts.load('current', {packages:['corechart', 'scatter']});
      google.charts.setOnLoadCallback(drawMultSeries);
      google.charts.setOnLoadCallback(drawStuff);
 
         
      function drawMultSeries() {
    
    	 
  	   	  
    	  var data = new google.visualization.arrayToDataTable([
              ['TaskName', 'Percentage'],
              ['${searchProgress.taskName}',${(searchProgress.doneTime/searchProgress.totalTime)*100}]
            ]);

            var options = {
              title: 'Chess opening moves',
              width: 900,
              legend: { position: 'none' },
             
              chart: { title: '${authority} ${loginId}님의 ${searchProgress.taskName} Progress',
                       subtitle: 'by percentage' },
              bars: 'horizontal', // Required for Material Bar Charts.
              axes: {
                x: {
                  
                	minValue: 0, maxValue: 100,
                	0: { side: 'top', label: 'Percentage'}, // Top x-axis.
                
                }
                
              },
              
            
              bar: { groupWidth: "100%" }
             
            };
			
            var chart = new google.charts.Bar(document.getElementById('top_x_div'));
            chart.draw(data, options);
             
      };     
      
      
      
      
      
      
    function drawStuff() {

    
  	
    		$.ajax({
         		  url:"/planbe/task/getChart",
         		  type:"post",
         		  dataType:"json",
         		  success:function(result){
         			  
                
                  var data = google.visualization.arrayToDataTable([                                                          
                    ]);
                  
                  data.addColumn('string','TaskName');
				  data.addColumn('number','Progress(%)');
				  data.addColumn('number','TotalTime(h)');
                  
                  
                  $(result).each(function(index,item){
    				  
       				
    				  data.addRow([item.taskName,parseInt((item.doneTime/item.totalTime)*100),item.totalTime]);
        					
         			  });
                  

                    var options = {
                      title: '${Authority} ${loginId}님의Total Task Progress',
                      hAxis: {title: 'Progress(%)'},
                      vAxis: {title: 'TotalTime(hours)'},
                      bubble: {textStyle: {fontSize: 11}}
                    };

                    var chart = new google.visualization.BubbleChart(document.getElementById('series_chart_div'));
                    chart.draw(data, options);
         			  
         			  
         			  
         		  },
         		  error:function(){alert("에러 발생")}
         	 		 });
                 
    		

          
                
      };
       

        </script>
    	 
    	 
    	 
    	 <!-- 전체 업무 차트 가져오기 끝 -->


	</c:if>

    
      
 
	 	
	
	
	 
		
 	

<!-- member인 경우  끝-->



		<!-- member가 아닌 경우  시작-->
       
      <c:if test="${Authority !='member'}">
      <div class="userId">
      <h1>${Authority} ${loginId}님의 Progress</h1>
    	</div>
      
      
      <!-- 검색 창 만들기 -->
      
   <div class="searchProgress">
                	<ul>                		
                		<li>	
                			<select id="searchProgressType"  style="width:100px"  onchange="javascipt:change(this)">
                				<option value="Task" selected="selected">Task이름</option>               			 
                					<c:forEach items="${allList}" var="allList">
                				<option value="${allList.taskNo}">${allList.taskName}</option>
                				    </c:forEach>
                				 <option value="allTask">--AllTask--</option>                   				                   			              				
   	            			</select>
  	                      	
   	                     </li> 	 	
                	</ul>
                	
        
         </div>
        
      
        
  		
         
         <!-- getChart 만들기 시작 -->
      
      
       <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
       
      
       
       	<c:if test="${searchProgress != null}">
  		 <div id="top_x_div" style="width: 1800px; height: 400px; margin:0px 0 0 260px;" ></div>
    	</c:if>
    	
    	
    		<c:if test="${totalList != null}">    		  
    	      <div id="series_chart_div" style="width: 1300px; height: 600px; margin:0px 0 0 50px"></div>
    		</c:if>
    		
    		
  		
         
      <script>
      
      google.charts.load('current', {packages: ['corechart', 'bar']});
      google.charts.load('current', {packages:['corechart', 'scatter']});
      google.charts.setOnLoadCallback(drawMultSeries);
      google.charts.setOnLoadCallback(drawStuff);
 
         
      function drawMultSeries() {
    
    	 
  	   	  
    	  var data = new google.visualization.arrayToDataTable([
              ['TaskName', 'Percentage'],
              ['${searchProgress.taskName}',${(searchProgress.doneTime/searchProgress.totalTime)*100}]
            ]);

            var options = {
              title: 'Chess opening moves',
              width: 900,
              legend: { position: 'none' },
             
              chart: { title: '${authority} ${loginId}님의 ${searchProgress.taskName} Progress',
                       subtitle: 'by percentage' },
              bars: 'horizontal', // Required for Material Bar Charts.
              axes: {
                x: {
                  
                	minValue: 0, maxValue: 100,
                	0: { side: 'top', label: 'Percentage'}, // Top x-axis.
                
                }
                
              },
              
            
              bar: { groupWidth: "100%" }
             
            };
			
            var chart = new google.charts.Bar(document.getElementById('top_x_div'));
            chart.draw(data, options);
             
      };     
      
      
      
      
      
      
    function drawStuff() {

    
  	
    		$.ajax({
         		  url:"/planbe/task/getChart",
         		  type:"post",
         		  dataType:"json",
         		  success:function(result){
         			  
                
                  var data = google.visualization.arrayToDataTable([                                                          
                    ]);
                  
                  data.addColumn('string','TaskName');
				  data.addColumn('number','Progress(%)');
				  data.addColumn('number','TotalTime(h)');
                  
                  
                  $(result).each(function(index,item){
    				  
       				
    				  data.addRow([item.taskName,parseInt((item.doneTime/item.totalTime)*100),item.totalTime]);
        					
         			  });
                  

                    var options = {
                      title: '${Authority} ${loginId}님의Total Task Progress',
                      hAxis: {title: 'Progress(%)'},
                      vAxis: {title: 'TotalTime(hours)'},
                      bubble: {textStyle: {fontSize: 11}}
                    };

                    var chart = new google.visualization.BubbleChart(document.getElementById('series_chart_div'));
                    chart.draw(data, options);
         			  
         			  
         			  
         		  },
         		  error:function(){alert("에러 발생")}
         	 		 });
                 
    		

          
                
      };
       

        </script>
    	 
    	 
    	 
    	 <!-- 전체 업무 차트 가져오기 끝 -->
    
    
    
  
      
 

<!-- member가 아닌 경우  끝-->

	</c:if>


		    

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
		
		<script src="/planbe/resources/bootstrap/js/progress.js"></script>
		
	<!-- end: JavaScript-->
	
</body>
</html>
