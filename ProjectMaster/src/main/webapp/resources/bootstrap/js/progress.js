$(function(){
	
	$('#searchProgressbtn').on('click',function(){
			
		var searchtype=$('#searchProgressType').val();
		var searchword=$('#searchProgressword').val();

		
		if (searchword == null) {
			alert("검색어를 입력하세요");
		}else{		
		location.href="/planbe/task/searchProgress?searchtype="+searchtype+"&searchword="+searchword;
		}
	});
	
	$('#searchAllBtn').on('click',function(){
		
				
	   /* $.ajax({
			
			url:"/planbe/task/getChart",
			type:"POST",
			dataType:"JSON",
			success:function(result){
				drawSeriesChart(result); 
			},
			error:function(){alert("에러발생")}
		});*/
					
	});
	
	
	});