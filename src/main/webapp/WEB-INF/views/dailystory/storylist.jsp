<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>LogUs</title>
	</head>
	<body>
		<p>일일 스토리 리스트 출력 화면(서재 메인 페이지)</p>
		<br>
		<a href="<c:url value='/회원닉네임테스트01/library/story/insert'/>">일일 스토리 작성</a>
		<div>
			<c:forEach var="dailystory" items="${dsList}">
				<div class="card" style="width: 18rem;" 
					 onclick="location.href='<c:url value='/회원닉네임테스트01/library/story/${dailystory.dailystoryCode}'/>'">
				  <img src="..." class="card-img-top" alt="${dailystory.dailystoryImage}">
				  <div class="card-body">
				    <h5 class="card-title">${dailystory.dailystoryTitle}</h5>
				    <p class="card-text">${dailystory.dailystoryContent}</p>
				  </div>
				</div>
			</c:forEach>
		</div>
	</body>
</html>