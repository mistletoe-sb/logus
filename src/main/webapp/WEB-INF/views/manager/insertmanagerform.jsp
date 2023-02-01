<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>관리자 등록</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

		<style>
		.id_ok{
		color:#008000;
		display: none;
		}
		
		.id_already{
		color:#6A82FB; 
		display: none;
		}
		</style>

    </head>
    <body>
        <h1>관리자 등록</h1>
        <h2>로그인 관리자 별명 : ${sessionScope.sessionManagerNickname}</h2>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <form name="insertmanagerform" action="http://localhost:8080/logus/manager/insertmanager" method="post">
	        <div class="mb-3">
	            <label for="exampleFormControlInput1" class="form-label">관리자 ID</label>
	            <input type="text" class="form-control" id="managerId" name="managerId" oninput="checkManagerId()" placeholder="ID를 입력하세요" required>
	        	<!-- id ajax 중복체크 -->
				<span class="id_ok">사용 가능한 아이디입니다.</span>
				<span class="id_already">누군가 이 아이디를 사용하고 있어요.</span>
	        </div>
	        <div class="mb-3">
	            <label for="exampleFormControlInput1" class="form-label">관리자 password</label>
	            <input type="password" class="form-control" id="managerPassword" name="managerPassword" placeholder="password를 입력하세요" required>
	        </div>
	        <div class="mb-3">
	            <label for="exampleFormControlInput1" class="form-label">관리자 password 확인</label>
	            <input type="password" class="form-control" id="confirmManagerPassword" placeholder="확인 password를 입력하세요" required>
	        </div>
	        <div class="mb-3">
	            <label for="exampleFormControlInput1" class="form-label">관리자 nickname</label>
	            <input type="text" class="form-control" id="managerNickname" name="managerNickname" placeholder="별명을 입력하세요" required>
	        </div>
	        <div class="d-grid gap-2 col-1 mx-auto">
	            <input type="submit" class="btn btn-primary" value='관리자 등록하기'>
	        </div>
        </form>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://cdn.jsdelivr.net/npm/vue@2.7.14"></script>
        
        <script type="text/javascript">
        
	        function checkManagerId(){
	            var managerId = $('#managerId').val(); //id값이 "id"인 입력란의 값을 저장
	            $.ajax({
	                url:'http://localhost:8080/logus/managerIdCheck', //Controller에서 요청 받을 주소
	                type:'post', //POST 방식으로 전달
	                data:{managerId:managerId},
	                success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
	                    if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
	                        $('.id_ok').css("display","inline-block"); 
	                        $('.id_already').css("display", "none");
	                    } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
	                        $('.id_already').css("display","inline-block");
	                        $('.id_ok').css("display", "none");
	                        alert("아이디를 다시 입력해주세요");
	                        $('#managerId').val('');
	                    }
	                },
	                error:function(){
	                    alert("에러입니다");
	                }
	            });
	            };
        
        	var password = document.getElementById("managerPassword")
	        , confirm_password = document.getElementById("confirmManagerPassword");
	
        	function validatePassword(){
				if(password.value != confirm_password.value) {
					confirm_password.setCustomValidity("암호가 일치하지 않습니다.");
				} else {
					confirm_password.setCustomValidity(''); // 오류가 없으면 메시지를 빈 문자열로 설정해야한다. 오류 메시지가 비어 있지 않은 한 양식은 유효성 검사를 통과하지 않고 제출되지 않는다.
				}
			}
	
			password.onchange = validatePassword;
			confirm_password.onkeyup = validatePassword;
        </script>
    </body>
</html>