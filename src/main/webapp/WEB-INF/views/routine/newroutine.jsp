<%@ include file="../header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>새 루틴</title>
	<script>
	var i =0;
        const add_textbox = () => {
            const routine = document.getElementById("routine");
            const newE = document.createElement('div');
            if(i<=5){
            i += 1;
            newE.id="t"+i
            newE.innerHTML = "<div class='p-3 bg-info bg-opacity-10 border border-info border-start-0 rounded-end'><p>시작 시간 : <input type='time'>&nbsp;&nbsp;&nbsp;종료 시간 : <input type='time'></p><div class='form-floating'><textarea class='form-control' placeholder='Leave a comment here' id='floatingTextarea'></textarea><label for='floatingTextarea'>일정 내용을 작성해주세요</label></div><button type='button' class='btn btn-primary' onclick='remove(this)'>삭제</button></div>";
            routine.appendChild(newE);
            } else if (i >5){
            	alert("생성한도");
            } return i;
        }
        const remove = (obj) => {
            document.getElementById("t"+i).remove();
            i -= 1;
        }
//         const $ul = document.querySelector('routine')

//         const liElems =[...document.querySelectorAll('.item')]

//         liElems.forEach($li=>$li.addEventListener('click',e=>{
//         	$ul.removeChild(e.target.parentNode)
//         }))
    </script>
	</head>
		<body>
		<div class="p-3 bg-info bg-opacity-10 border border-info border-start-0 rounded-end">
			<select class="form-select" aria-label="Default select example">
			  <option selected>평일/주말을 선택해주세요</option>
			  <option value="1">평일</option>
			  <option value="2">주말</option>
			</select>
			<div>
			<div id="routine">
			<div class="p-3 bg-info bg-opacity-10 border border-info border-start-0 rounded-end">
			<p>시작 시간 : <input type="time">&nbsp;&nbsp;&nbsp;종료 시간 : <input type="time"></p>
				<div class="form-floating">
					  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea"></textarea>
					  <label for="floatingTextarea">일정 내용을 작성해주세요</label>
				</div>
					<button type="button" class="btn btn-primary" onclick='remove(this)'>삭제</button>
				</div>
				</div>	
				</div>
				</div>
				<div>
					<button type="button" class="btn btn-primary"  onclick="add_textbox()">추가</button>
				</div>
		</body>
</html>