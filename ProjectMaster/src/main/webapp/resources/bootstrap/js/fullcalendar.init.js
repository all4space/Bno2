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
           function(start, end, timezone, callback) {
               $.ajax({
                   url: '/goal/calendar/getCalendarInfo',
                   type: "POST",
                   dataType: "json",
                   success: function(result) {
                       var events = [];
                       $(result).each(function() {
                           events.push({
                               title: $(this).attr('bgoalTitle'),
                               start: $(this).attr('startDate'), // will be parsed
                               end : $(this).attr('endDate'),
                               color :  $(this).attr('color'),
                               mGoalTitle: $(this).attr('mGoalTitle'),
                               BTMRecordNum: $(this).attr('bRecordNum')
                           });
                       });
                       callback(events);
                   }
               });
           },
        viewRender: function(view, element) {
            if (!("ontouchstart" in document.documentElement)) {
                $('.fc-scroller').jScrollPane({
                    autoReinitialise: true,
                    autoReinitialiseDelay: 100
                });
            }

            $('.fc-popover.click').remove();
        },
        eventClick: function(calEvent,jsEvent,view) {
            var eventEl = $(this);
            // Add and remove event border class
            if (!$(this).hasClass('event-clicked')) {
                $('.fc-event').removeClass('event-clicked');
                $(this).addClass('event-clicked');
            }
               
             var time = new Date() 
              
              var year = time.getYear()+1900 
              var month = time.getMonth() +1 
              if((month+"").length <2){
                 month = "0"+month;
              }
              var day = time.getDate() 
              if((day+"").length <2){
                 day = "0"+day;
              }
            /*  console.log(jsEvent); 
              console.log(view);*/
              var today = year+""+month+""+day
              
              //calEvaent.start._i 는  DayPlan 이벤트의 해당 날짜 입니다.
              var dateSplit = calEvent.start._i.split("-");
              date_year = dateSplit[0]; 
              date_month = dateSplit[1]; 
              date_day = dateSplit[2]; 
              var dateSplited = date_year + "" + date_month + "" + date_day
              
                 // Add popover
               $('body').append(
                   '<div class="fc-popover click">' +
                       '<div class="fc-header">' +
                         '<p id = "fc-header-title">'+calEvent.title +'</p>' +
                           '<button type="button" class="cl"><i class="font-icon-close-2"></i></button>' +
                       '</div>' +
   
                       '<div class="fc-body main-screen">' +
                         '<p>' +
                              "중간목표명 : " + calEvent.mGoalTitle + "" +
                          '</p>' + 
                           '<p>' +
                              "진행기간 : " + moment(calEvent.start).format('YYYY-MM-DD') + " ~ " + moment(calEvent.end).format('YYYY-MM-DD') +
                           '</p>' + '<br>' +'<p id = "dayChartTitle">' +  "<일별 달성률 차트>" + "</p>" +
                           '<div id="chart_div" style="width: 375px; height: 350px;">'+'</div>'+   
                       '<div class="fc-body remove-confirm">' +
                           '<p>Are you sure to remove event?</p>' +
                           '<div class="text-center">' +
                               '<button type="button" class="btn btn-rounded btn-sm">Yes</button>' +
                               '<button type="button" class="btn btn-rounded btn-sm btn-default remove-popover">No</button>' +
                           '</div>' +
                       '</div>' +
   
                       '<div class="fc-body edit-event">' +
                           '<p>Edit event</p>' +
                           '<div class="form-group">' +
                               '<div class="input-group date datetimepicker">' +
                                   '<input type="text" class="form-control" />' +
                                   '<span class="input-group-addon"><i class="font-icon font-icon-calend"></i></span>' +
                               '</div>' +
                           '</div>' +
                           '<div class="form-group">' +
                               '<div class="input-group date datetimepicker-2">' +
                                   '<input type="text" class="form-control" />' +
                                   '<span class="input-group-addon"><i class="font-icon font-icon-clock"></i></span>' +
                               '</div>' +
                           '</div>' +
                           '<div class="form-group">' +
                               '<textarea class="form-control" rows="2">Name Surname Patient Surgey ACL left knee</textarea>' +
                           '</div>' +
                           '<div class="text-center">' +
                               '<button type="button" class="btn btn-rounded btn-sm">Save</button>' +
                               '<button type="button" class="btn btn-rounded btn-sm btn-default remove-popover">Cancel</button>' +
                           '</div>' +
                       '</div>' +
                   '</div>'
               );
            $.ajax({
               url: '/goal/calendar/getChartRecord?BTMRecordNum='+calEvent.BTMRecordNum,
                type: "get",
                dataType: "json",
                success: function(result) {
                      google.charts.load('current', {'packages':['corechart']});
                      google.charts.setOnLoadCallback(drawVisualization);
                      
                      var DayRecord = [];
                      var achieve = [];
                       $(result).each(function(index, item) {
                          
                          DayRecord.push(
                              $(this).attr('startDate')
                           );
                          
                          achieve.push(
                                 $(this).attr('achieve')
                             );
                       });
                       
                       console.log(DayRecord);
                      function drawVisualization() {
                        // Some raw data (not necessarily accurate)
                      var data = new google.visualization.DataTable();
                      data.addColumn('string', '일별');
                      data.addColumn('number', '달성률');
                       
                       for(i = 0; i < DayRecord.length; i++){
                          data.addRow([DayRecord[i], achieve[i]]);
                       }
                        
                        
                    var options = {
                      vAxis: {title: '달성률',viewWindow:{
                          max:100,
                          min:0
                        }},
                      hAxis: {title: '일별'},
                      seriesType: 'bars',
                      series: {5: {type: 'line'}},
                      colors : ['#960018'],
                      axes: {
                          y: {
                              all: {
                                  range: {
                                      max: 100,
                                      min: 0
                                  }
                              }
                          }
                      }
                    };
   
                    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
                    chart.draw(data, options);
                  }   
                   
                  },
               error: function(){
                 alert("실패");
               }
              });

            // Datepicker init
            $('.fc-popover.click .datetimepicker').datetimepicker({
                widgetPositioning: {
                    horizontal: 'right'
                }
            });

            $('.fc-popover.click .datetimepicker-2').datetimepicker({
                widgetPositioning: {
                    horizontal: 'right'
                },
                format: 'LT',
                debug: true
            });


            // Position popover
            function posPopover(){
                $('.fc-popover.click').css({
                    left: eventEl.offset().left + eventEl.outerWidth()/2,
                    top: eventEl.offset().top + eventEl.outerHeight()
                });
            }

            posPopover();

            $('.fc-scroller, .calendar-page-content, body').scroll(function(){
                posPopover();
            });

            $(window).resize(function(){
               posPopover();
            });


            // Remove old popover
            if ($('.fc-popover.click').length > 1) {
                for (var i = 0; i < ($('.fc-popover.click').length - 1); i++) {
                    $('.fc-popover.click').eq(i).remove();
                }
            }

            // Close buttons
            $('.fc-popover.click .cl, .fc-popover.click .remove-popover').click(function(){
                $('.fc-popover.click').remove();
                $('.fc-event').removeClass('event-clicked');
            });

            // Actions link
            $('.fc-event-action-edit').click(function(e){
                e.preventDefault();

                $('.fc-popover.click .main-screen').hide();
                $('.fc-popover.click .edit-event').show();
            });

            $('.fc-event-action-remove').click(function(e){
                e.preventDefault();

                $('.fc-popover.click .main-screen').hide();
                $('.fc-popover.click .remove-confirm').show();
            });
        },
        
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
      
           var time=moment().format('LT').split(" ");
           var clock=time[0];
           var part=time[1];
        
           if (part=="AM") {
			part="오전";
		}else{
			part="오후";
		}
          
          
            
           $("#startTime").attr("value",clock);
           $("#startDate").attr("value",today);
           $("#schduleForm").modal("show");
           
           var dateSplit = date.format().split("-");
           date_year = dateSplit[0]; 
           date_month = dateSplit[1]; 
           date_day = dateSplit[2]; 
           var dateSplited = date_year + "" + date_month + "" + date_day
           
           if(parseInt(today) == parseInt(dateSplited) && view.name == "agendaWeek"){
                    
                    var date_time = date.format().split("T");
                    var clickedTime = date_time[1].split(":");
                    
                    var hour = clickedTime[0];
                    var minute = clickedTime[1];
                    
                alert('여긴 한 주의 현재 날짜');    
           }else if(parseInt(today) == parseInt(dateSplited) && view.name == "month"){
                alert('여긴 월의 현재 날짜');
           }//end if   
         
       
                 
       },
       
       eventDrop: function(event, delta, revertFunc) {

           alert(event.title + " was dropped on " + event.start.format());

           if (!confirm("Are you sure about this change?")) {
               revertFunc();
           }
           
       }

    });
    
    if(calendar) {
         $(window).resize(function() {
           var calHeight = $(window).height()*0.83;
           $('#calendar').fullCalendar('option', 'height', calHeight);
         });
       };


/* ==========================================================================
    Side datepicker
    ========================================================================== */

    $('#side-datetimepicker').datetimepicker({
        inline: true,
        format: 'DD/MM/YYYY'
    });

/* ========================================================================== */

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
    
 
    
    
})(jQuery, ResponsiveBootstrapToolkit);

