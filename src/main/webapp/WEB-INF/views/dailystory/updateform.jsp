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
		<p>일일 스토리 수정 폼</p>
		<br>
		<form action="<c:url value='/회원닉네임테스트01/library/story/insert'/>" method="post" enctype="multipart/form-data">
			<label>제목 </label>
			<input type="text" name="dailystoryTitle">
			<br>
			<label>내용 </label>
			<textarea name="dailystoryContent" cols="50" rows="10"></textarea>
			<br>
			<label>썸네일 </label>
			<input type="text" name="dailystoryImage">
			<br><br>
			<input type="submit" value="작성하기">
			<input type="reset" value="취소">
		</form>
	</body>
</html>