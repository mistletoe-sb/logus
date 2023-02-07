/**
 * library.jsp에서 사용하는 js파일
 */
/*const myModal = document.getElementById('myModal')
const myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', () => {
	myInput.focus()
})*/

//팔로우 취소
function followBtn1() {
	const btn1 = document.getElementById('followbtn1');
	const btn2 = document.getElementById('followbtn2');
	followId = $('#followinId').val();
	console.log(followId);
	
	$.ajax({
		url : './followdl', //Controller에서 요청 받을 주소
		type : 'post', //POST 방식으로 전달
		async : false,
		data : {followId : followId},
		success: function(result){ //데이터 주고받기 성공했을 경우 실행할 결과
			console.log(result + "-- 팔로우 취소 성공");
		}
	});

	// btn 숨기기 (display: none)
	if(btn1.style.display !== 'none') {
		btn1.style.display = 'none';
		btn2.style.display = 'block';
	}
	// btn 보이기 (display: block)
	else {
		btn1.style.display = 'block';
		btn2.style.display = 'none';
	}
}

//팔로우 하기
function followBtn2() {
	const btn1 = document.getElementById('followbtn1');
	const btn2 = document.getElementById('followbtn2');
	followId =$('#followinId').val();
	console.log(followId);

	$.ajax({
		url : './followin', //Controller에서 요청 받을 주소
		type : 'post', //POST 방식으로 전달
		async : false,
		data : {followId : followId},
		success: function(result){ //데이터 주고받기 성공했을 경우 실행할 결과
			console.log(result + "팔로우 하기 성공");
		}
	});
	  
	// btn 숨기기 (display: none)
	if(btn2.style.display !== 'none') {
		btn1.style.display = 'block';
		btn2.style.display = 'none';
	}
	// btn 보이기 (display: block)
	else {
		btn1.style.display = 'none';
		btn2.style.display = 'block';
	}
}