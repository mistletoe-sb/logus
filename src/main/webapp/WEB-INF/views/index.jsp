<%@ include file="header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Log Us Home</title>
	</head>
	<body>
	<div>
		<h1>
			Log Us에 오신 것을 환영합니다!
		</h1>
		
		<P>  This is Test Page. </P>
		<a href="<c:url value='/login'/>">로그인</a>
		</div>
	</body>
</html>