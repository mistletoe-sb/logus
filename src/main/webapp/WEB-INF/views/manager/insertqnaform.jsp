<%@ include file="../header.jsp" %>
<%
	if(session.getAttribute("memberNickname") != null) {
		%>
		<%@ include file="memberside.jsp" %>
		<%
	}
%>
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
        <title>Q&A 질문 등록</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <h1>Q&A 질문 등록</h1>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <form action="<c:url value='/manager/insertqna'/>" method="post">
	        <fieldset>
	        <div class="mb-3">
	            <label for="exampleFormControlInput1" class="form-label">제목</label>
	            <input type="text" class="form-control" id="qnaTitle" name="qnaTitle" placeholder="제목을 입력하세요" required>
	        </div>
	        <div class="mb-3">
	            <label for="exampleFormControlTextarea1" class="form-label">본문</label>
	            <textarea class="form-control" id="qnaContent" name="qnaContent" rows="3" placeholder="본문을 입력하세요" required></textarea>
	        </div>
        	<input type="hidden" id="memberNickname" name="memberNickname" value='${sessionScope.memberNickname}'>
	        <div class="d-grid gap-2 col-1 mx-auto">
	            <input type="submit" class="btn btn-primary" value='등록하기'>
	        </div>
	        </fieldset>
        </form>
    </body>
</html>