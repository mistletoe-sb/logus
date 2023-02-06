<%@ include file="../header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>루틴 리스트</title>
	</head>
	<body>
		<div class="d-grid gap-2 col-6 mx-auto">
			<button type="button" class="btn btn-primary btn-lg" onclick="location.href='newroutine'">+새 루틴 추가하기</button>
			</div>
			<h3><span class="badge bg-dark">평일</span></h3>
			<c:forEach items="${routinelist1}" var="routinelist1" varStatus="status">
			<ul class="list-group">
		  <li class="list-group-item d-flex justify-content-between align-items-start">
		    <div class="ms-2 me-auto">
		    <c:if test="${routinelist1.dailyroutineActive eq 1}"><span class="badge text-bg-success">메인</span></c:if>
		      <div class="fw-bold">${routinelist1.dailyroutineTitle }</div>
		      <div><button type="button" class="btn btn-outline-primary btn-sm" disabled>공유된 횟수: ${routinelist1.dailyroutineShared }</button></div>
		    </div>
		    <span class="badge bg-primary rounded-pill"></span>
		    <a href="routine/${routinelist1.dailyroutineCode}" class="btn btn-primary active" aria-current="page">확인</a>
		  	<a href="routinefix/${routinelist1.dailyroutineCode}" class="btn btn-primary">수정</a>
		  	<a href="routinedelete/${routinelist1.dailyroutineCode}" class="btn btn-primary">삭제</a>
		  </li>
		</ul>
		</c:forEach>
		<h3><span class="badge bg-dark">주말</span></h3>
		<c:forEach items="${routinelist2}" var="routinelist2" varStatus="status">
			<ul class="list-group">
		  <li class="list-group-item d-flex justify-content-between align-items-start">
		    <div class="ms-2 me-auto">
		    <c:if test="${routinelist2.dailyroutineActive eq 1}"><span class="badge text-bg-success">메인</span></c:if>
		      <div class="fw-bold">${routinelist2.dailyroutineTitle }</div>
		      <div><button type="button" class="btn btn-outline-primary btn-sm" disabled>공유된 횟수: ${routinelist2.dailyroutineShared }</button></div>
		    </div>
		    <span class="badge bg-primary rounded-pill"></span>
		    <a href="routine/${routinelist2.dailyroutineCode}" class="btn btn-primary active" aria-current="page">확인</a>
		  	<a href="routinefix/${routinelist2.dailyroutineCode}" class="btn btn-primary">수정</a>
		  	<a href="routinedelete/${routinelist2.dailyroutineCode}" class="btn btn-primary">삭제</a>
		  </li>
		</ul>
		</c:forEach>
	</body>
</html>