<%@ include file="../header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>새 루틴</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	var i =0;
	//i는 한 루틴에서 최대로 가능한 시간대별 일정 수
        const add_textbox = () => {
            const routine = document.getElementById("routine");
            const newE = document.createElement('div');
            if(i<=5){
            i += 1;
            newE.id="t"+i
            newE.innerHTML = "<div class='p-3 bg-info bg-opacity-10 border border-info border-start-0 rounded-end'><p>시작 시간 : <input type='time' name='begin' required>&nbsp;&nbsp;&nbsp;종료 시간 : <input type='time' name='end' required></p><div class='form-floating'><textarea class='form-control' placeholder='Leave a comment here' id='floatingTextarea' name='content' required></textarea><label for='floatingTextarea'>일정 내용을 작성해주세요</label></div></div>";
            routine.appendChild(newE);
            } else if (i >5){
            	alert("생성한도입니다");
            } return i;
        }
        const remove = (obj) => {
        	if(i==0){
        		alert("최소 일정은 삭제할 수 없습니다");
        	} else {
            document.getElementById("t"+i).remove();
            i -= 1;
        	}
            
        }
        
        function submit() {
  
            alert('새로운 일정이 등록되었습니다');
            return false;
          }
//        $('#submit').click(function(){
//        	 	$('form[name="routineform"]').serialize();
//        	    $('form[name="routineform"]').attr('method', 'POST');
//        	    $('form[name="routineform"]').attr('action', 'newroutine');
//        	    console.log('테스트 서븦밋');
//        	    $('form[name="routineform"]').submit();
//        	});
//         const $ul = document.querySelector('routine')

//         const liElems =[...document.querySelectorAll('.item')]

//         liElems.forEach($li=>$li.addEventListener('click',e=>{
//         	$ul.removeChild(e.target.parentNode)
//         }))    onsubmit="return submit();"
    </script>
	</head>
		<body>
		<form name="routineform" action="newroutine" method="post">
		<div class="p-3 bg-info bg-opacity-10 border border-dark border-start-0 rounded-end">
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