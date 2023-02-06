<%@ include file="../header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>새 루틴</title>
	<script>
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
    </script>   
	</head>
		<body>
		<form id="routinenew" name="routineform" action="<c:url value='/newroutine'/>" method="post">
		<div class="p-3 bg-info bg-opacity-10 border border-dark border-start-0 rounded-end">
			<label>태그 등록</label>
				<input type="text" id="tags" name="tagNames" size="100" onkeydown="splitTag(event)">
				<br>
			<select class="form-select" aria-label="Default select example" name="active">
				  <option selected >일반 일정으로 등록</option>
				  <option >메인 일정으로 등록</option>
			</select>
			<select class="form-select" aria-label="Default select example" name="week">
				  <option selected>평일</option>
				  <option >주말</option>
			</select>
				<div class="form-floating">
					  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea1" name="title" required></textarea>
					  <label for="floatingTextarea">일정 제목을 작성해주세요</label>
				</div>
		</div>
				<div id="routine">
					<div id="t0">
						<div class="p-3 bg-info bg-opacity-10 border border-info border-start-0 rounded-end">
							<p>시작 시간 : <input type="time" name="begin" required>&nbsp;&nbsp;&nbsp;종료 시간 : <input type="time" name="end" required></p>
								<div class="form-floating">
									  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" name="content" required></textarea>
									  <label for="floatingTextarea">일정 내용을 작성해주세요</label>
								</div>
							</div>
						</div>
					</div>
				<div>	
					<button type="button" class="btn btn-primary"  onclick="add_textbox()">추가</button>
					<button type="button" class="btn btn-primary" onclick='remove()'>삭제</button>
				</div>
				<div class="d-grid gap-2 col-6 mx-auto">
	 				<button class="btn btn-primary" type="submit">일정 생성 완료하기</button>
				</div>
				</form>
		</body>
</html>