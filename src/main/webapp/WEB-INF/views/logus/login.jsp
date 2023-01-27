<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Log Us</title>
	</head>
	<body>
		<form action="login" method="post">
			<label>ID</label><br>
			<input type="text" name="memberId">
			<label>Password</label><br>
			<input type="password" name="memberPassword">
			<input type="submit">
		</form>
		<br><br><br>계정이 없으면 <a href="<c:url value='/insertform'/>">회원가입</a>
		<p>${message}</p>
	</body>
</html>