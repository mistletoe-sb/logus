<%@ include file="../header.jsp" %>
<%
	if(session.getAttribute("sessionManagerNickname") != null) {
		%>
		<%@ include file="managerside.jsp" %>
		<%
	}
%>
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
        <title>Q&A 목록</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <h1>Q&A</h1>
        <h6>총 Q&A 글 수 ${qnacount}개</h6>
        <h2>로그인 관리자 별명 : ${sessionScope.sessionManagerNickname}</h2>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        
        <table class="table">
            <thead>
              <tr>
                <th scope="col">번호</th>
                <th scope="col">제목</th>
                <th scope="col">작성일</th>
                <th scope="col">처리상황</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="qna" items="${qnalist}">
              <tr>
                <th scope="row">${qna.qnaCode}</th>
                <td><a href="http://localhost:8080/logus/manager/qnadetail?qnaCode=${qna.qnaCode}">${qna.qnaTitle}</a></td>
                <td>${qna.qnaDate}</td>
                <td>
                <c:choose>
                	<c:when test="${empty qna.answerContent}">
                		미답변
                	</c:when>
                	<c:otherwise>
                		답변완료
                	</c:otherwise>
                </c:choose>
                </td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
	      <c:if test="${not empty sessionScope.memberNickname}">
	          <div class="d-grid gap-2 col-2 mx-auto">
	            <button type="button" class="btn btn-primary" onclick="location.href='http://localhost:8080/logus/manager/insertqnaform'">Q&A 작성하기</button>
	        </div>
        </c:if>

    </body>
</html>