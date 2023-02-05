<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
    <head>
<!--         <meta charset="utf-8"> -->
<!--         <meta name="viewport" content="width=device-width, initial-scale=1"> -->
        <title>관리자 로그인</title>
<!--         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
		<%@ include file="../header.jsp" %>
    </head>
    <body>
        <h1>관리자 로그인</h1>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <form name="managerloginform" action="http://localhost:8080/logus/manager/managerlogin" method="post">
	        <fieldset>
	        <div class="mb-3">
	            <label for="exampleFormControlInput1" class="form-label">관리자 ID</label>
	            <input type="text" class="form-control" id="managerId" name="managerId" placeholder="ID를 입력하세요" required>
	        </div>
	        <div class="mb-3">
	            <label for="exampleFormControlInput1" class="form-label">관리자 password</label>
	            <input type="password" class="form-control" id="managerPassword" name="managerPassword" placeholder="password를 입력하세요" required>
	        </div>
	        <div class="d-grid gap-2 col-1 mx-auto">
	            <input type="submit" class="btn btn-primary" value='관리자 로그인하기'>
	        </div>
	        </fieldset>
        </form>
    </body>
</html>