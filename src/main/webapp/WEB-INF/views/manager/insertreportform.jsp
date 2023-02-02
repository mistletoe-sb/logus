<%@ include file="../header.jsp" %>
<%@ include file="managerside.jsp" %>
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
        <title>리포트 등록</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <h1>리포트</h1>
        <h2>로그인 관리자 별명 : ${sessionScope.sessionManagerNickname}</h2>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <form action="http://localhost:8080/logus/manager/insertboard" method="post" enctype="multipart/form-data">
	        <div class="mb-3">
	            <label for="exampleFormControlInput1" class="form-label">제목</label>
	            <input type="text" class="form-control" id="boardTitle" name="boardTitle" placeholder="제목을 입력하세요">
	        </div>
	        <div class="mb-3">
	            <label for="exampleFormControlTextarea1" class="form-label">본문</label>
	            <textarea class="form-control" id="boardContent" name="boardContent" rows="3" placeholder="본문을 입력하세요"></textarea>
	        </div>
        	<div class="mb-3">
			  <label for="formFile" class="form-label">이미지 파일 업로드</label>
			  <input class="form-control" type="file" id="boardFile" name="boardFile" accept="image/*">
			</div>

	        <input type="hidden" id="boardCategory" name="boardCategory" value='2'>
	        <input type="hidden" id="managerNickname" name="managerNickname" value='${sessionScope.sessionManagerNickname}'>
	        <div class="d-grid gap-2 col-1 mx-auto">
	            <input type="submit" class="btn btn-primary" value='등록하기'>
	        </div>
        </form>
    </body>
</html>