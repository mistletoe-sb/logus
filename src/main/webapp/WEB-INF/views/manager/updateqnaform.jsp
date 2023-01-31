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
        <title>Q&A 질문 수정</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <h1>Q&A 질문 수정</h1>
        <h2>로그인 관리자 별명 : ${sessionScope.sessionManagerNickname}</h2>
        <form action="http://localhost:8080/logus/manager/updateqna" method="post">
	        <div class="mb-3">
	            <label for="exampleFormControlInput1" class="form-label">제목</label>
	            <input type="text" class="form-control" id="qnaTitle" name="qnaTitle" value="${qnadetail.qnaTitle}">
	        </div>
	        <div class="mb-3">
	            <label for="exampleFormControlTextarea1" class="form-label">본문</label>
	            <textarea class="form-control" id="qnaContent" name="qnaContent" rows="3">${qnadetail.qnaContent}</textarea>
	        </div>
        	<input type="hidden" id="memberNickname" name="memberNickname" value='${sessionScope.memberNickname}'>
        	<input type="hidden" id="qnaCode" name="qnaCode" value='${qnadetail.qnaCode}'>
	        <div class="d-grid gap-2 col-1 mx-auto">
	            <input type="submit" class="btn btn-primary" value='수정하기'>
	        </div>
        </form>
    </body>
</html>