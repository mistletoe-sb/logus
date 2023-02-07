<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../include.jsp" %>
	</head>
	<body>
		<%@ include file="../header_body.jsp" %>
		<h1><span class="badge bg-primary">${weekopt}</span>&nbsp;&nbsp;&nbsp;${routine.dailyroutineTitle}</h1>
		<h3><span class="badge bg-primary">태그</span>&nbsp;&nbsp;&nbsp;
		<c:forEach items="${taglist}" var="taglist" varStatus="status">
		${taglist.tagName}</c:forEach></h3>
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