var today;
		 $(function(){
		var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);
	    
	  	$('#today').val(year+month+day);
	  	$('#todayachieve').html(year+'년&nbsp;'+month+'월&nbsp;'+day+'일&nbsp;출석체크입니다');
	  	//ajax로 해당 날짜에 이미 출석했는지 확인하고 버튼 비활성화
	});
		 
		  	function on_submit_check(){
		  		today =$('#today').val();
		  		var result2 =false;
 					
		  		 $.ajax({
		 			url : './achieve/check', //Controller에서 요청 받을 주소
		 			type : 'post', //POST 방식으로 전달
		 			async:false,
		 			data : {today : today},
		 			success: function(result){ //데이터 주고받기 성공했을 경우 실행할 결과
		 				console.log(result);
		 				if(result==0){
		 			    		alert("출석체크가 완료되었습니다.");
		 			    		result2 =true;
		 			    	} else {
			 			    		alert("오늘은 이미 출석체크를 하셨습니다.");
			 			    		result2=false;
		 			    		  }
		 						}
		 					});
		  		 		console.log(result2);
		 			return result2;
			 }