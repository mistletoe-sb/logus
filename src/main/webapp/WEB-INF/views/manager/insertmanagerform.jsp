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
    </head>
    <body>
        <h1>관리자 등록</h1>
        <h2>로그인 관리자 별명 : ${sessionScope.sessionManagerNickname}</h2>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <form name="insertmanagerform" action="http://localhost:8080/logus/manager/insertmanager" method="post">
	        <div class="mb-3">
	            <label for="exampleFormControlInput1" class="form-label">관리자 ID</label>
	            <input type="text" class="form-control" id="managerId" name="managerId" placeholder="ID를 입력하세요" required>
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
        <script type="text/javascript">
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