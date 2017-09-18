$(document).ready(function () {
	
	
		$('#btnGood').on("click",function(){
				var target = $('#btnGood').val();
				location.href="/planbe/task/taskForm?target="+target;
		});
		
		$('#btnUrgent').on("click",function(){
			var target = $('#btnUrgent').val();
			location.href="/planbe/task/taskForm?target="+target;
		});
		
		$('#btnDisaster').on("click",function(){
			var target = $('#btnDisaster').val();
			location.href="/planbe/task/taskForm?target="+target;
		});
		$('#btnAll').on("click",function(){
			var target = $('#btnGood').val();
			location.href="/planbe/task/taskForm"
		});
		
    
 });