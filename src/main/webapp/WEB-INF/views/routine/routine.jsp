<%@ include file="../header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>루틴</title>
	</head>
	<body>
		<h1><span class="badge bg-primary">${weekopt}</span>&nbsp;&nbsp;&nbsp;${routine.dailyroutineTitle}</h1>
			<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">시작 시간</th>
		      <th scope="col">종료 시간</th>
		      <th scope="col">일정 내용</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach items="${checklist}" var="checklist" varStatus="status">
		    <tr>
		      <td>${checklist.dailycheckBegintime}</td>
		      <td>${checklist.dailycheckEndtime}</td>
		      <td>${checklist.dailycheckContent}</td>
		    </tr>
		      </c:forEach>
		 </tbody>
		</table>
	</body>
</html>