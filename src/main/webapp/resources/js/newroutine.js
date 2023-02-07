var i =0;	//i는 한 루틴에서 최대로 가능한 시간대별 일정 수
        const add_textbox = () => {
            const routine = document.getElementById("routine");
            const newE = document.createElement('div');
            if(i<=5){	//0은 기본으로 존재해서 i+2개 일정이 생성한도(5개 기준 7개) 
            i += 1;
            newE.id="t"+i
            newE.innerHTML = "<div class='p-3 bg-info bg-opacity-10 border border-info border-start-0 rounded-end'><p>시작 시간 : <input type='time' name='begin' required>&nbsp;&nbsp;&nbsp;종료 시간 : <input type='time' name='end' required></p><div class='form-floating'><textarea class='form-control' placeholder='Leave a comment here' id='floatingTextarea' name='content' required></textarea><label for='floatingTextarea'>일정 내용을 작성해주세요</label></div></div>";
            routine.appendChild(newE);
            } else if (i >5){
            	alert("일정 생성 한도입니다");
            } return i;
        }
        const remove = (obj) => {
        	if(i==0){
        		alert("일정은 최소 1개 이상 필요합니다");
        	} else {
            document.getElementById("t"+i).remove();
            i -= 1;
        	}
            
        }
        
        $(function(){
        $(document).delegate("#routinenew","submit",function(){      		
        	var error =0;	//error 0 이상이면 에러 일정 있음
        		for (var j = 0; j <= i; j++) {	//t0도 있으므로 i는 0부터 시작->j는 -1부터 시작해야 함
    				var startDate = $('#t'+j).find('input').first().val(); //첫번째 <input> time을 찾을때 (자손 요소)
    				var endDate = $('#t'+j).find('input').last().val(); //첫번째 <input> time을 찾을때 (자손 요소)
    				
    				console.log(startDate+"<br>"+j);
    		  		console.log(endDate+"<br>"+j);
    				if (startDate.valueOf() > endDate.valueOf()){
    					error += 1;
    				} 
        		}	
    				if(error>0){
    					alert("종료 시간이 시작 시간보다 빠른 일정이 있습니다");
   					 event.preventDefault();
    				} else {
    					console.log("전부 맞습니다");
    				}
    });
});   