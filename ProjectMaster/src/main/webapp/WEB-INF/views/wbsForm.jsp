<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
	
	<!-- start: Meta -->
	<meta charset="utf-8">
	<title>WBS</title>
	<meta name="description" content="Bootstrap Metro Dashboard">
	<meta name="author" content="Dennis Ji">
	<meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
	<!-- end: Meta -->
	
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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>		
<script src="/planbe/resources/js/xepOnline.jqPlugin.js"></script>

<style type="text/css">@import url(// fonts.googleapis.com/earlyaccess/nanumgothic.css);</style>

</head>

<script>

/* Gantt와 연동 */
 
 var fromGantt = "<c:out value='${fromGantt}'/>"; 

 $(function(){
   if(fromGantt != null){
	   getWbs(fromGantt);
   } 
 });

/*=======================================================================================================================================*/ 

/* start : WBS 트리 생성 */

google.charts.load('current', {packages:['wordtree']});
google.charts.setOnLoadCallback(drawSimpleNodeChart);

function AddNamespace(){
  var svg = jQuery('#wordtree_explicit svg');
  svg.attr("xmlns", "http://www.w3.org/2000/svg");
  svg.css('overflow','visible');
}

 var tree_div; 
 var wordtree;
 var nodeListData;
 var taskList;
 var memberList;
 var options;
 var proname;
 
 // var jj; 
 // var array2;
 
function drawSimpleNodeChart(p_name, t_list, m_list) {
    
	proname = p_name;
	taskList = t_list; 
	memberList = m_list;
	
	nodeListData = new google.visualization.arrayToDataTable([
    ['id', 'childLabel', 'parent', 'size', { role: 'style' }],

/* [1] Project 이름 : 최상위 parent 노드 */    
    
    [0, p_name, -1, 1, '#119455']
    
    ]);
	
/* [2] Task 이름 : 1단계 child 노드  */
	

    $(t_list).each(function(index, item) {  
    	nodeListData.addRow([index+1, item.taskName, 0, 1, '#3c43a7']);
    });// for each 


/* [3] Task 키워드 : 2단계 child 노드 */    

	var x = t_list.length; 
    var keyword = ['Member', 'Content', 'Priority', 'Status', 'Start Date', 'Due Date', 'Total Time', 'Done Time'];
	var y = keyword.length; // 8
    /* 3단계 child 노드의 parent id를 담을 배열 선언 */
	var xx = [];
    /* 3단계 child 노드의 id 선언 및 초기화 */
    var j = x+(x*y); 
     
    var init = x;
    
  //   jj = j;
    
    $(t_list).each(function(index, item) {  
          var z = 0;
          for(var i = init+1; i < init+y+1; i++){
	   		     nodeListData.addRow([i, keyword[z], index+1, 3, 'DarkSlateGray']);
	   		     xx.push(i);
	             z += 1;
	      }
	   	  init += y;
     });// for each
          
	
/* [4] Task 키워드의 각 컨텐츠 : 3단계 child 노드 */         

    /* 3단계 child 노드의 value를 담을 배열 선언 */
    var array = [];

//    array2 = array;

    $(t_list).each(function(index, item) {  
    	 array.push(m_list[index]);
    	 array.push(item.taskContent);
         array.push(item.taskPriority);
         array.push(item.taskStatus);
         array.push(item.startDate);
         array.push(item.dueDate);
         array.push(item.totalTime.toString());
         array.push(item.doneTime.toString());
         
    });// for each
    

  	for(var i = 0, q = j+1; i < array.length; i++, q++){
  		 nodeListData.addRow([q, array[i], xx[i], 3, 'black']);
	  	  
  		   if(nodeListData.getValue(q, 1) == 'HIGH'){
	  	     	nodeListData.setValue(q, 4, '#000080');
	  	   }
  		   if(nodeListData.getValue(q, 1) == 'NORMAL'){
	  	     	nodeListData.setValue(q, 4, '#0000ff');
	  	   }
  		   if(nodeListData.getValue(q, 1) == 'LOW'){
	  	     	nodeListData.setValue(q, 4, '#6666ff');
	  	   }
  		   if(nodeListData.getValue(q, 1) == 'COMPLETE'){
	  	     	nodeListData.setValue(q, 4, 'red');
	  	   }
  		   if(nodeListData.getValue(q, 1) == 'PROGRESS'){
	  	     	nodeListData.setValue(q, 4, 'green');
	  	   }
  		   if(nodeListData.getValue(q, 1) == 'NEW'){
	  	     	nodeListData.setValue(q, 4, 'orange');
	  	   }
  	}
	  	   
    options = {
	    colors: ['black', 'black', 'black'],
	    wordtree: {
	      format: 'explicit',
	      type: 'suffix'
	    },
	      fontName: 'nanumgothic'
	      // backgroundColor: 'MintCream'
    };
    
 
    tree_div = document.getElementById('wordtree_explicit');
    wordtree = new google.visualization.WordTree(tree_div);

    google.visualization.events.addListener(wordtree, 'ready', AddNamespace);
    
    
	wordtree.draw(nodeListData, options);  // draw 
    
	google.visualization.events.addListener(wordtree, 'select', getWbsInfo);
	google.visualization.events.addListener(wordtree, 'ready', deleteWbs);
} 
/* end : WBS 트리 생성 */

/*=======================================================================================================================================*/


/* WBS 트리 삭제하기 */	
   function deleteWbs(){
	 var reply = confirm("Delete Current WBS?");
	 if(reply) drawSimpleNodeChart(null, 0, 0); 
   } 
	 

/* WBS 트리 정보 불러오기 */	
    
var mlist_key = "";
var p_no = ""; // Task 수정, 삭제시 projectNo 공유하기 위해 멤버 변수 선언.  

	function getWbs(projectNo){
	
		p_no = projectNo;
		
		$.ajax({
		  		url: "/planbe/wbs/getWbs",
		  		type: "post",
		  		data: {"projectNo" : projectNo},
		  		datatype: "json",
		  		success: function(result) {
                    alert("Draw WBS");	
                    
                    $("#wbsBox").removeAttr("style");
                    
                    var p_name = result.projectName;
                    var t_list = result.taskList; 	
		  			var m_list = result.memberList;
		  			
                    drawSimpleNodeChart(p_name, t_list, m_list);
                    memberForKey(p_name, t_list, m_list); 
				} // success
		});
	}
                    
      
/* 랭킹 테스트 */
/*    
  function whoIsBest(t_list){
	   
	   var NoArray = []; 

       for(var i=0; i<t_list.length; i++){
    	   if(!NoArray.contains(t_list[i].memberNo)){
              NoArray.push(t_list[i].memberNo);
           }
       }
       // alert(NoArray); // 3,5,2 	    
       
       var objArray = [];
       for(var i=0; i < NoArray.length; i++){
	        var obj = {
		         m_no : NoArray[i], 	   
		         rate : 0,
		         count : 0
	        }
          //  alert(obj.m_no); 
            objArray.push(obj);
	   }

    //   alert(objArray[0].m_no); // 3
       
       for(var i=0; i<t_list.length; i++){
    	   var doneTime = t_list[i].doneTime.toFixed(2);
      	   var totalTime = t_list[i].totalTime.toFixed(2); 
      	   var rate = (doneTime/totalTime).toFixed(2)*100; 
           
      	   for(var j=0; j<objArray.length; j++){
      		   if(t_list[i].memberNo == objArray[j].m_no){
      			   objArray[j].rate += rate;
      			   objArray[j].count += 1;
      		   }
      	   }
       }
       
       var avgArray = [];
       for(var i=0; i<objArray.length; i++){
    	   avgArray.push(objArray[i].rate/objArray[i].count);
       }
     //  alert(avgArray[0]); // 60
    }//function 
 */

 
/* contains 메소드 추가 */
	Array.prototype.contains = function(element) {
		for (var i = 0; i < this.length; i++) {
			if (this[i] == element) {
				return true;
			}
		}
		return false;
	}
	 
/* 키워드 리스트 불러오기 */
    function memberForKey(p_name, t_list, m_list){
	     /* 멤버리스트 중복 제거  */
		 var array = [];
         array.push(m_list[0]);	

         for(var i=0; i<m_list.length; i++){
            if(array.contains(m_list[i])){
               continue;	
            }        	
            array.push(m_list[i]);
         }
         
		 var data = "<option value='origin'>-Select Keyword-</option>"
		          + "<optgroup label='Priority'>"
                  +	"<option value='HIGH' style='background: #0000e6'>High</option>"
                  + "<option value='NORMAL' style='background: #6666ff'>Normal</option>" 
		          + "<option value='LOW' style='background: #ccccff'>Low</option></optgroup>"
		          + "<optgroup label='Status'>"
		          + "<option value='NEW' style='background: #fff4b3'>New</option>"
		          + "<option value='PROGRESS' style='background: #b3ffb3'>Progress</option>"
		          + "<option value='COMPLETE' style='background: #ffb3b3'>Complete</option></optgroup>"
		          + "<optgroup label='%DONE'>"
		          + "<option value=0>0%</option>"
		          + "<option value=20>20%</option>"
		          + "<option value=40>40%</option>"
		          + "<option value=60>60%</option>"
		          + "<option value=80>80%</option>"
		          + "<option value=100>100%</option></optgroup>"
		          + "<optgroup label='Member'>";
		          
         $(array).each(function(index, item) {
             data += "<option value=" + item + ">" + item + "</option>";
		 }); // for each 
        
		 data += "</optgroup>"
		 
	     $('#selectError').empty();
		 $('#selectError').append(data);
		 $("#selectError").trigger("liszt:updated");
		 
		 keyAction(p_name, t_list, m_list);
    }
		 
		
/* Key 이벤트 : key 에 해당하는 Task로만 트리 시각화  */
    function keyAction(p_name, t_list, m_list){
    
    	$("#selectError").on('change', function() {
    		 
    		 var key = this.value;
	         var keyTask = []; 
	         var keyMember = [];
             
	         // alert(key);
             
             /* 전체 Task 보기(original) */
             if("origin" == key){
            	// alert("오리진"); 
            	 drawSimpleNodeChart(p_name, t_list, m_list); 
            	 
             } else {
            	 
	             /* 키워드별 Task 보기 */
	             for(var i=0; i<t_list.length; i++){
	                 
	            	 var doneTime = t_list[i].doneTime.toFixed(2);
	            	 var totalTime = t_list[i].totalTime.toFixed(2); 
	            	 var rate = (doneTime/totalTime).toFixed(2); 
	            	 
	            	 if(t_list[i].taskPriority == key){
	            		 keyTask.push(t_list[i]); 
	            		 keyMember.push(m_list[i]);
	            	 } else if(t_list[i].taskStatus == key){
	            		 keyTask.push(t_list[i]);
	            		 keyMember.push(m_list[i]);
	            	 } else if(m_list[i] == key){
	            		 keyMember.push(m_list[i]);
	            		 keyTask.push(t_list[i]);
	            	 } else if((key*1 <= rate*100) && (rate*100 < (key*1+20))){
	            		 keyTask.push(t_list[i]);
	            		 keyMember.push(m_list[i]);
	            	 }
	             }//for
            		 
                 drawSimpleNodeChart(p_name, keyTask, keyMember);
             }
    	});
     }	   
            	 
	
/* WBS 노드 정보 불러오기 */ 
  
	function getWbsInfo() {

		var selectedNode = wordtree.getSelection();
	    var item = selectedNode.word;
    	
        if(proname == item){
	        	  // alert("proname 클릭");
	        	  getAllTaskInfo(taskList, memberList); // all
	    }
    	
      	var selectTask = "";
      	var selectMember = "";

      	for(var i=0; i<taskList.length; i++){
        	   if(taskList[i].taskName == item){
            	 selectTask = taskList[i];
            	 selectMember = memberList[i];
			       getTaskInfo(selectTask, selectMember); 
			       break;
        	   }
        }
	}
	
		    	
/* projectName 클릭시, 프로젝트의 전체 taskList 가져오기 */	
	function getAllTaskInfo(taskList, memberList){
        
	    // alert("getALLLLL");
	    
	    $("#taskBox").removeAttr("style");
	    
		var mList = [];
		
		$(memberList).each(function(index, item) {
		     mList.push(item);	
		});
		
		$(".T_INFO").empty();
		
		$(taskList).each(function(index, item) {
		     $(".T_INFO").append("<tr><td class='center' id='member'><button class='btn btn-small btn-inverse' onclick='memberForm()'>" + mList[index] + "</button>"
		    		          + "</td><td class='center' id='taskName'>" + item.taskName 
		     		          + "</td><td class='center' id='taskContent'>" + item.taskContent 
		     		          + "</td><td class='center' id='taskPriority'>" + item.taskPriority 
		     		          + "</td><td class='center' id='taskStatus'>" + item.taskStatus
		     		          + "</td><td class='center' id='startDate'>" + item.startDate
		     		          + "</td><td class='center' id='dueDate'>" + item.dueDate
		     		          + "</td><td class='center' id='totalTime'>" + item.totalTime
		     		          + "</td><td class='center' id='doneTime'>" + item.doneTime 
		     		          + "</td><td><a class='btn btn-success' href='/planbe/task/taskForm'>"
		     		          + "<i class='halflings-icon white zoom-in'></i></a>"
		     		          + "<a class='btn btn-info' onclick='editTask()'>"
		     		          + "<i class='halflings-icon white edit'></i></a>"
		     		          + "<a class='btn btn-primary' onclick='updateTask()'>"
		     		          + "<i class='icon-save'></i></a>"
		     		          + "<a class='btn btn-danger' onclick='deleteTask()'>"
		     		          + "<i class='halflings-icon white trash'></i></a>"
		     		          + "</td></tr>"
		     		          + "<input type='hidden' id ='taskNo' value=" + item.taskNo + ">");
		}); 
			
	}

/*=======================================================================================================================================*/
    	
/* 개별 TaskInfo 가져오기 */
	function getTaskInfo(selectTask, selectMember){
	   	
		 $("#taskBox").removeAttr("style");
	     
	     $(".T_INFO").empty();
	     $(".T_INFO").append("<tr><td class='center' id='member'><button class='btn btn-small btn-inverse' onclick='memberForm()'>" + selectMember + "</button>"
	    		          + "</td><td class='center' id='taskName'>" + selectTask.taskName 
	     		          + "</td><td class='center' id='taskContent'>" + selectTask.taskContent 
	     		          + "</td><td class='center' id='taskPriority'>" + selectTask.taskPriority 
	     		          + "</td><td class='center' id='taskStatus'>" + selectTask.taskStatus
	     		          + "</td><td class='center' id='startDate'>" + selectTask.startDate
	     		          + "</td><td class='center' id='dueDate'>" + selectTask.dueDate
	     		          + "</td><td class='center' id='totalTime'>" + selectTask.totalTime
	     		          + "</td><td class='center' id='doneTime'>" + selectTask.doneTime 
	     		          + "</td><td><a class='btn btn-success' href='/planbe/task/taskForm'>"
	     		          + "<i class='halflings-icon white zoom-in'></i></a>"
	     		          + "<a class='btn btn-info' onclick='editTask()'>"
	     		          + "<i class='halflings-icon white edit'></i></a>"
	     		          + "<a class='btn btn-primary' onclick='updateTask()'>"
	     		          + "<i class='icon-save'></i></a>"
	     		          + "<a class='btn btn-danger' onclick='deleteTask()'>"
	     		          + "<i class='halflings-icon white trash' ></i></a>"
	     		          + "</td></tr>"
	     		          + "<input type='hidden' id ='taskNo' value=" + selectTask.taskNo + ">");
	     
	     
	}       

/* TaskInfo 수정하기 */
	function editTask(){
		alert("You Can Edit Task Info");
		$(".center").prop("contenteditable", true);
	}
	
/* TaskInfo 수정사항 저장하기 */
	function updateTask(){
		 var taskNo = $("#taskNo").val();
		 var taskName = $("#taskName").text(); 
		 var taskContent = $("#taskContent").text();
		 var taskPriority = $("#taskPriority").text(); 
		 var taskStatus = $("#taskStatus").text();
		 var startDate = $("#startDate").text();
		 var dueDate = $("#dueDate").text();
		 var totalTime = $("#totalTime").text();
		 var doneTime = $("#doneTime").text();
	 
		$.ajax({
	  		url: "/planbe/wbs/updateTask",
	  		type: "post",
	  		data: {"projectNo" : p_no, 
	  			   "taskNo": taskNo, 
	  			   "taskName": taskName, 
	  			   "taskContent": taskContent,
	  			   "taskPriority": taskPriority,
	  			   "taskStatus": taskStatus, 
	  			   "startDate": startDate, 
	  			   "dueDate": dueDate, 
	  			   "totalTime": totalTime, 
	  			   "doneTime": doneTime},
	  			 
	  		success: function(result) {
                // alert("success에 들어옴");	
                if(result) alert("UPDATE Complete");
                else("UPDATE Error");
               
                $(".center").prop("contenteditable", false);
                getWbs(p_no);
			} // succes
	   });
   }
                
	  			
/* Task 삭제하기 */
	function deleteTask(){
		var reply = confirm("Delete Task?");
		if(reply){
			$.ajax({
		  		url: "/planbe/wbs/deleteTask",
		  		type: "post",
		  		data: {"taskNo": $("#taskNo").val()}, 
		  			 
		  		success: function(result) {
	                // alert("success에 들어옴");	
	                if(result) alert("DELETE Complete");
	                else("DELETE Error");
	                
	                $(".T_INFO").empty();
	                getWbs(p_no);
				} // succes
		   });		
		}
	}
		
/*=======================================================================================================================================*/		

/* UserInfo 페이지로 이동	 */	
	function memberForm(){
		location.href="/planbe/member/memberForm"; 	
	}
  
/* Task 페이지로 이동 */
    function taskForm(){
	  // alert("Task Page");
	    location.href="/planbe/task/taskForm"; 
    }
	
/* Gantt : gantt 페이지로 이동 */	
	function showGantt(){
		location.href="/planbe/gantt/ganttForm?projectNo=" + p_no; 
	}

/*=======================================================================================================================================*/    

/* Send Mail 테스트 */
 /* 
   function sendMail(){
	   location.href="/planbe/mail/mailList";  
   }
 */
 
</script>

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
					<i class="icon-list-alt"></i>
					<a href="#">WBS</a>
				</li>
			</ul>
			
	
<!-- ========================================================================================================================== -->
								
<!-- start : 프로젝트 리스트  -->			
	<div class="row-fluid sortable">	
				<div class="box span12">
					<div class="box-header">
						<h2><i class="halflings-icon white align-justify"></i><span class="break"></span>Project List</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
					
						<table class="table table-striped table-bordered bootstrap-datatable datatable">
							  <thead>
								  <tr>
									  <th>Project Name</th>
									  <th>Project Content</th>
									  <th>Project Status</th>
									  <th>Start Date</th>
									  <th>Due Date</th>
									  <th>Authority</th>                                          
								  </tr>
							  </thead>   
							  <tbody>
							  <c:forEach items="${p_list}" var="vo" varStatus="status">
								<tr>
									<td class="center">
								    <button class="btn btn-success" onclick="getWbs(${vo.projectNo})">${vo.projectName}</button> 
									</td>                                       
									<td class="center">${vo.projectContent}</td>
								    <td class="center">
									     <c:choose>
							  			 <c:when test="${vo.projectStatus == 'NEW'}">
											 <span class="label label-warning">${vo.projectStatus}</span>
							  			 </c:when>
							  			 <c:when test="${vo.projectStatus == 'PROGRESS'}">
							  				 <span class="label label-success">${vo.projectStatus}</span>
							  			 </c:when>
							  			 <c:otherwise>
							  				<span class="label label-important">${vo.projectStatus}</span>
							  			 </c:otherwise>
									     </c:choose>						  		
									</td>
									<td class="center">${vo.startDate}</td>
									<td class="center">${vo.dueDate}</td>
									<td class="center">${m_list[status.index].projectAuthority}</td>
								</tr>
							  </c:forEach>
							  </tbody>
						 </table>  
					</div>
				</div><!--/span-->
			</div><!--/row-->
<!-- end : 프로젝트 리스트  -->		    			
				
							
								
<!-- start: WBS 트리 박스 -->	
             <div class="row-fluid sortable">			   
	             <div class="box span12">
							
							<div class="box-header" />
								  <h2><i class="halflings-icon white list"></i><span class="break"></span>WBS</h2>
								  <div class="box-icon">
								<!-- 	<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a> -->
									<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
								<!-- 	<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a> -->
								  </div>
							</div> <!-- header -->
							
	                        <div class="box-content"  id="wbsBox" style = "display: none" />

<!-- start : 키워드 드롭다운 -->
							<div class="control-group" style="float: right;"/>
									<div class="controls">
									  <select id="selectError" data-rel="chosen">
									  </select>
									</div>
							</div>
<!-- end : 키워드 드롭다운 -->		





<!-- WBS 삭제 / Gantt 링크 버튼   -->                                  
             
               <div id="JSFiddle">
                          <div id="wordtree_explicit" style="width: 940px; height: 600px;"></div>	
               </div>
                                <div style="text-align: center;">
							    <button class="btn btn-large btn-warning" onclick="deleteWbs()">Delete WBS</button>
							    <button class="btn btn-large btn-danger" onclick="showGantt()">Show Gantt</button>
							    <button class="btn btn-large btn-info" onclick="return xepOnline.Formatter.Format('JSFiddle', {render:'download', srctype:'svg', filename:'WBS'})">Download</button>
                                </div> 							   
					         
						  </div> <!-- content -->
			      </div>
			  </div>
							
<!-- end: WBS 트리 박스 -->

<!-- start: Task List 박스 -->	
		<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon white user"></i><span class="break"></span>Task List</h2>
						<div class="box-icon">
							<!-- <a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a> -->
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content" id="taskBox" style = "display: none" >
					<table id="ttt" class="table table-bordered table-striped table-condensed">
						  <thead>
							  <tr>
							      <th>Member</th>
								  <th>Task Name</th>
								  <th>Task Content</th>
								  <th>Task Priority</th>
								  <th>Task Status</th>
								  <th>Start Date</th>
								  <th>Due Date</th>
								  <th>Total Time</th>
								  <th>Done Time</th>
								  <th>Action</th>
							  </tr>
						  </thead>   
<!-- TaskInfo 테이블 바디 -->		
						  <tbody class="T_INFO">
						  </tbody>
			
					  </table>     

					</div>
				</div><!--/span-->
			</div><!--/row-->
<!-- end: Task List 박스 -->		

<!--=================================================================================================================================  -->
	
				<!-- 키워드 리스트 : 라벨 필요할까봐 남겨둠 -->			
				<div class="box span2">
					<div class="box-header">
						<h2><i class="halflings-icon white eye-open"></i><span class="break"></span>Labels</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
						</div>
					</div>
					<div class="box-content">
			
					
						<table class="table table-bordered table-striped">
							<tbody>
							  <tr>
								<td>
								  <span class="label">Default</span>
								</td>
							  </tr>
							  <tr>
								<td>
								  <span class="label label-success">Success</span>
								</td>
							  </tr>
							  <tr>
								<td>
								  <span class="label label-warning">Warning</span>
								</td>
							  </tr>
							  <tr>
								<td>
								  <span class="label label-important">Important</span>
								</td>
							  </tr>
							  <tr>
								<td>
								  <span class="label label-info">Info</span>
								</td>
							  </tr>
							  <tr>
								<td>
								  <span class="label label-inverse">Inverse</span>
								</td>
							  </tr>
							</tbody>
						  </table>
					</div>
				</div><!--/span-->
<!-- 키워드 리스트 -->						
							
<!-- 필요한 버튼 쓰려고 남겨둠 -->					
				<div class="box span6">
					<div class="box-header">
						<h2><i class="halflings-icon white list"></i><span class="break"></span>Buttons</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
						</div>
					</div>
					<div class="box-content buttons">
						<p>
							<button class="btn btn-large">Large button</button>
							<button class="btn btn-large btn-primary">Large button</button>
							<button class="btn btn-large btn-danger">Large button</button>
							<button class="btn btn-large btn-warning">Large button</button>
						</p>
						<p>
							<button class="btn btn-large btn-success">Large button</button>
							<button class="btn btn-large btn-info">Large button</button>
							<button class="btn btn-large btn-inverse">Large button</button>
						</p>
						<p>
							
						</p>
						<div class="btn-group">
							<button class="btn btn-large">Large Dropdown</button>
							<button class="btn btn-large dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="halflings-icon white star"></i> Action</a></li>
								<li><a href="#"><i class="halflings-icon white tag"></i> Another action</a></li>
								<li><a href="#"><i class="halflings-icon white download-alt"></i> Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#"><i class="halflings-icon white tint"></i> Separated link</a></li>
							</ul>
						</div>
						
						<hr>
						
						<p class="btn-group">
							  <button class="btn">Left</button>
							  <button class="btn">Middle</button>
							  <button class="btn">Right</button>
						</p>
						<p>
							<button class="btn btn-small"><i class="halflings-icon white white star"></i> Icon button</button>
							<button class="btn btn-small btn-primary">Small button</button>
							<button class="btn btn-small btn-danger">Small button</button>
							<button class="btn btn-small btn-warning">Small button</button>
							<button class="btn btn-small btn-success">Small button</button>
							
						</p>
						<p>
							<button class="btn btn-small btn-info">Small button</button>
							<button class="btn btn-small btn-inverse">Small button</button>
							<button class="btn btn-large btn-primary btn-round">Round button</button>
							<button class="btn btn-large btn-round"><i class="halflings-icon white white ok"></i></button>
							<button class="btn btn-primary"><i class="halflings-icon white white edit"></i></button>
						</p>
						<p>
							<button class="btn btn-mini">Mini button</button>
							<button class="btn btn-mini btn-primary">Mini button</button>
							<button class="btn btn-mini btn-danger">Mini button</button>
							<button class="btn btn-mini btn-warning">Mini button</button>
							<button class="btn btn-mini btn-info">Mini button</button>
							<button class="btn btn-mini btn-success">Mini button</button>
							<button class="btn btn-mini btn-inverse">Mini button</button>
						</p>
						
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
	
	

	