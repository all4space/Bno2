$(document).ready(function(){

/* ==========================================================================
    Fullcalendar
    ========================================================================== */

	
   $('#calendar').fullCalendar('today');
   $('.fc-event').css('font-size', '.6em');
    $('#calendar').fullCalendar({
       aspectRatio: .1,
       height: 1000,
      
     
        header: {
            left: '',
            center: 'prev title next',
            right: 'today,month,agendaWeek,agendaDay'
        },
        buttonIcons: {
            prev: 'font-icon font-icon-arrow-left',
            next: 'font-icon font-icon-arrow-right',
            prevYear: 'font-icon font-icon-arrow-left',
            nextYear: 'font-icon font-icon-arrow-right'
        },
        lang:"ko",
        editable: true,
        selectable: true,
        eventLimit: true, // allow "more" link when too many events
        events:  
        			/*[{  title: 'asdf',
                            start: '2017-09-20', // will be parsed
                            end :  '2017-09-21'}],*/
   
        function(start, end,callback) {
        	
      
        	// 개인 plan List 가져오기
           $.ajax({
                url: '/planbe/plan/getList',
                type: "POST",
                dataType: "json",
                success: function(result) {
             	
                    var events = [];
                 // Calendar DB에서 Plan 데이터 가져오기
                    $.each(result.planList, function(index,value){
                  
                    	 events.push({
                             
                     	    title: $(this).attr('title'),
                             startTime: $(this).attr('startTime'),
                             start: $(this).attr('startDate'), // will be parsed
                             endTime: $(this).attr('endTime'),
                             end: $(this).attr('endDate'),
                             content: $(this).attr('content'),
                             calno: $(this).attr('calNo'),
                             backgroundColor: '#B22222',
                             number:'0'
                            	 
                           
                                                
                         });
                    	 
                    	  
                         
                    });
                    
                    // Task DB에서  데이터 가져오기
                    $.each(result.TaskList, function(index,value){
                    	
                    	 events.push({
                             
                     	     title: $(this).attr('taskName'),                       
                             start: $(this).attr('startDate'), // will be parsed                             
                             end: $(this).attr('dueDate'),
                             content: $(this).attr('taskContent'),
                             projectNo:$(this).attr('projectNo'),
                             memberNo:$(this).attr('memberNo'),
                             taskNo:$(this).attr('taskNo'),
                             taskPriority:$(this).attr('taskPriority'),
                             totalTime:$(this).attr('totalTime'),
                             doneTime:$(this).attr('doneTime'),
                             backgroundColor: '#228B22',
                             number:'1'
                                             
                         });
                  	 
                    });
                    
                  console.log(events)
                   callback(events);
                   
                	
                } // success function()
          
           
            });// ajax
            
        
        },
        eventColor: '#FFFFFF',
        	
        dayClick: function(date, jsEvent, view) {
        	       	
           var time = new Date() 
           
           var year = date.getYear()+1900 
           var month = date.getMonth() +1 
           if((month+"").length <2){
              month = "0"+month;
           }
           var day = date.getDate()          
           if((day+"").length <2){
              day = "0"+day;
           }
           
           var today = year+"-"+month+"-"+day
           
           var clock= moment().format().split("T");
           var clock2=clock[1].split("+");
           var clock3=clock2[0].split(":");
           var clock4=clock3[0]+":"+clock3[1];   
           
           //var date=clock[0];
          
           	$("#calNo").attr("value","");
           	$("#summary").attr("value","");
			$("#endDate").attr("value",""); 	      		
    		$("#endTime").attr("value",""); 	     
    		$("#description").attr("value","");
          
     
           $("#startTime").attr("value",clock4);
           $("#startDate").attr("value",today);
           $("#schduleForm").modal("show");
      
               
       },
       
       eventClick:function(event){
    	   
    	  if (event.number == '0') {
			
    		  
			
    			 $("#summary").attr("value",event.title);
      		   
    			
    			 
      		   var clock=(event.startTime).toString().split(" ")
      		   var realClock=clock[1].split(":")
      		   var time=realClock[0]+":"+realClock[1]
      		   
      		   
      		   
      		   var endtime=null;
      		   var endDate =null;    
      	
      			   
      			   var endclock=(event.endTime).toString().split(" ")
          		   var realendClock=endclock[1].split(":")
          		   var endtime=realendClock[0]+":"+realendClock[1]
      			   
  			
  				
  				 var endDate = moment(event.end).format("YYYY-MM-DD");
      			 var startDate = moment(event.start).format("YYYY-MM-DD");
      		
      		  
      		 
      		   $("#calNo").attr("value",event.calno);
      		   $("#endDate").attr("value",endDate); 
      		   $("#startDate").attr("value",startDate); 
      		   $("#endTime").attr("value",endtime); 
      		   $("#startTime").attr("value",time);
      		   $("#description").attr("value",event.content);
      		   $("#schduleForm").modal("show");
    			
			
    	  }else if (event.number == '1') {
    		  
    		  var projectNo = event.projectNo;
    		  var memberNo = event.memberNo;
    		  var taskNo = event.taskNo;
    		  var taskName = event.title;
    		  var taskContent = event.taskContent;
    		  var taskPriority = event.taskPriority;
    		  var taskStatus = event.taskStatus;
    		  var startDate = event.start;
    		  var dueDate = event.end;
    		  var totalTime = event.totalTime;
    		  var doneTime = event.doneTime;
    		  
    		  location.href="/planbe/task/updateTaskForm?projectNo="+projectNo+"&memberNo="+memberNo+"&taskNo="+taskNo+"&taskName="+taskName
    		  														+"&taskContent="+taskContent+"&taskPriority="+taskPriority
    		  														+"&taskStatus="+taskStatus+"&startDate="+startDate+"&dueDate="+dueDate
    		  														+"&totalTime="+totalTime+"&doneTime"+doneTime;
    		  
    		
    		  
		}
    		
    	   	
		}
       
       
      

    });
    
    if(calendar) {
         $(window).resize(function() {
           var calHeight = $(window).height()*0.83;          
           $('#calendar').fullCalendar('option', 'height', calHeight);
         });
       };



});


/* ==========================================================================
    Calendar page grid
    ========================================================================== */

(function($, viewport){
    $(document).ready(function() {
    		
	
        if(viewport.is('>=lg')) {
            $('.calendar-page-content, .calendar-page-side').matchHeight();
      
        }

        // Execute code each time window size changes
        $(window).resize(
            viewport.changed(function() {
                if(viewport.is('<lg')) {
                    $('.calendar-page-content, .calendar-page-side').matchHeight({ remove: true });
                   
                }
            })
        );
    });
 
    
})(jQuery);

