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
		<p>일일 스토리 보기</p>
		<br>
		<form action="<c:url value='/회원닉네임테스트01/library/story/insert'/>" method="post" enctype="multipart/form-data">
			<p>${vo.dailystoryTitle}</p>
			<br>
			<p>${vo.dailystoryContent}</p>
			<br>
			<img src="${pageContext.request.contextPath}/resources/images/${vo.dailystoryImage}" alt="${vo.dailystoryImage}">
			<input type="text" name="dailystoryImage">
			<br><br>
			<button type="submit" value="수정"></button>
			<button type="reset" value="삭제"></button>
		</form>
	</body>
</html>