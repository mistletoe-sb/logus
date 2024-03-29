<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
    <head>
    </head>
    <body>
		<%
			if(session.getAttribute("memberNickname") != null) {
				%>
				<%@ include file="../header_body.jsp" %>
				<%@ include file="memberside.jsp" %>
				<%
			}
		%>
        <h1>Q&A 질문 수정</h1>
        <form action="<c:url value='/manager/updateqna'/>" method="post">
        	<fieldset>
	        <div class="mb-3">
	            <label for="exampleFormControlInput1" class="form-label">제목</label>
	            <input type="text" class="form-control" id="qnaTitle" name="qnaTitle" value="${qnadetail.qnaTitle}" required>
	        </div>
	        <div class="mb-3">
	            <label for="exampleFormControlTextarea1" class="form-label">본문</label>
	            <textarea class="form-control" id="qnaContent" name="qnaContent" rows="3" required>${qnadetail.qnaContent}</textarea>
	        </div>
        	<input type="hidden" id="memberNickname" name="memberNickname" value='${sessionScope.memberNickname}'>
        	<input type="hidden" id="qnaCode" name="qnaCode" value='${qnadetail.qnaCode}'>
	        <div class="d-grid gap-2 col-1 mx-auto">
	            <input type="submit" class="btn btn-primary" value='수정하기'>
	        </div>
	        </fieldset>
        </form>
    </body>
</html>