<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../include.jsp" %>
		<link rel="stylesheet" href="<c:url value='/resources/css/routine.css'/>">
		<style>
		</style>
	</head>
	<body>
<%--  --%>
		<%@ include file="../header_body.jsp" %>
		<div class="d-grid gap-2 col-6 mx-auto" style="margin-top: 20px;text-align : center;">
		<h1><span class="badge bg-success bg-opacity-25">루틴 상세 페이지</span></h1>
		<h1>${routine.dailyroutineTitle}</h1>
		</div>
		<div class="d-grid gap-2 col-6 mx-auto">
		<h3><span class="badge bg-primary">태그</span>&nbsp;&nbsp;&nbsp;
		<c:forEach items="${taglist}" var="taglist" varStatus="status">
			<button class="tag_block" style="display: inline-block">${taglist.tagName}</button>
		</c:forEach></h3>
		<div>
			<table class="table rwd-table">
		  <thead>
		    <tr>
		      <th scope="col" class="thwidth">시작 시간</th>
		      <th scope="col" class="thwidth">종료 시간</th>
		      <th scope="col" >일정 내용</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach items="${checklist}" var="checklist" varStatus="status">
		    <tr class="routinetrcolor">
		      <td>${checklist.dailycheckBegintime}</td>
		      <td>${checklist.dailycheckEndtime}</td>
		      <td>${checklist.dailycheckContent}</td>
		    </tr>
		      </c:forEach>
		 </tbody>
		</table>
		</div>
		</div>
	</body>
</html>