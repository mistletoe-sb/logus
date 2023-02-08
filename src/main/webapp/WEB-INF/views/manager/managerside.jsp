<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>관리자 사이드바</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<style type="text/css">
			ul {
				float:left;
			}
		</style>
	</head>
	<body>
		<ul class="list-group">
		  <li class="list-group-item"><a href="<c:url value='/manager/statistics'/>">통계</a></li>
		  <li class="list-group-item"><a href="<c:url value='/manager/board?boardcategory=1'/>">공지사항</a></li>
		  <li class="list-group-item"><a href="<c:url value='/manager/board?boardcategory=2'/>">월간 리포트</a></li>
		  <li class="list-group-item"><a href="<c:url value='/manager/qna'/>">Q&A</a></li>
		  <li class="list-group-item"><a href="<c:url value='/manager/memberlist'/>">회원 관리</a></li>
		  <c:if test="${sessionScope.sessionManagerLevel == 0}">
		  	<li class="list-group-item"><a href="<c:url value='/manager/managerlist'/>">관리자 관리(마스터)</a></li>
		  </c:if>
		  <li class="list-group-item"><a href="<c:url value='/manager/managerlogout'/>">관리자 로그아웃</a></li>
		</ul>
		관리자 ${sessionScope.sessionManagerNickname}님 로그인 중
	</body>
</html>