<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
    <head>
 		<style type="text/css">
         .container{
            width : 800px !important;
            margin : 20px auto;
            background-color: #f7f7f7;
         }
         .title{
            margin : 40px auto;
            text-align : center;
         }
         .title2{
            margin : 40px auto;
         }
      </style>
    </head>
    <body>
    	<%@ include file="../header.jsp" %>
    	<div class="container">
	        <h1 class = "title">Manager Login</h1>
	        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	        <form name="managerloginform" action="<c:url value='/manager/managerlogin'/>" method="post">
		        <fieldset>
		        <div class="mb-3">
		            <label for="exampleFormControlInput1" class="form-label">관리자 ID</label>
		            <input type="text" class="form-control" id="managerId" name="managerId" placeholder="ID를 입력하세요" required>
		        </div>
		        <div class="mb-3">
		            <label for="exampleFormControlInput1" class="form-label">관리자 password</label>
		            <input type="password" class="form-control" id="managerPassword" name="managerPassword" placeholder="password를 입력하세요" required>
		        </div>
		        <div class="d-grid gap-2 col-2 mx-auto">
		            <input type="submit"  class="btn btn-primary" value='로그인하기'>
		        </div>
		       
		        </fieldset>
	        </form>
        </div>
    </body>
</html>