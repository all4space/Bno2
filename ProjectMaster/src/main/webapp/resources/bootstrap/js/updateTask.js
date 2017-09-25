$(function(){
	
	$("#updateTask").on("click",function(){
			
		var projectName=$('input[name=projectNo]').val();
		var taskName=$('input[name=taskName]').val();		
		var taskContent=$('textarea[name=taskContent]').val();	
		var startDate=$('input[name=startDate]').val();		
		var dueDate=$('input[name=dueDate]').val();	
		var totalTime = $('input[name=totalTime]').val();
		var doneTime = $('input[name=doneTime]').val();
		
		alert(totalTime);
		alert(doneTime);
		
		
		var startDate1 = startDate.split("-");
		var dueDate1 = dueDate.split("-");
		
		var startDate2=startDate1[0]+startDate1[1]+startDate1[2];
		var dueDate2=dueDate1[0]+dueDate1[1]+dueDate1[2];
		
		var intStartDate =parseInt(startDate2);
		var intDueDate = parseInt(dueDate2);
		
		
		if (projectName == "") {
			alert("프로젝트 이름을 선택해 주세요")
			return false;
		}else if (taskName.length <=0) {
			alert("업무이름을 입력하세요");
			return false;
		}else if(taskContent.length <=0){
			alert("업무 내용을 입력하세요");
			return false;
		}else if(!$('#taskPriority > option:selected').val()) {
		    alert("업무 중요도를 선택하세요");
		    return false;
		}else if(!$('#taskStatus> option:selected').val()) {
		    alert("업무 상태를 선택하세요");
		    return false;
		}else if(startDate.length <=0){
			alert("업무 시작 시간을 입력하세요");
			return false;
		}else if (dueDate.length <=0) {
			alert("업무 종료 시간을 설정해 주세요");
			return false;
		}else if (intStartDate > intDueDate) {
			alert("업무 종료 시간을 다시 설정해 주세요");
			return false;
		}else if (totalTime == "") {
			alert("totalTime을  설정해 주세요");
			return false;
		}else if (doneTime == "") {
			alert("doneTime을 설정해 주세요");
			return false;
		}else if (totalTime < doneTime) {
			alert("doneTime을 다시 설정해 주세요");
			return false;
		}

	});
	

});