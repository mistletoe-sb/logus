<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>검색</title>
	</head>
	<body>
	<div class="row row-cols-1 row-cols-md-4 g-4">
	<c:forEach items="${searchroutine}" var="searchroutine" varStatus="status">
		  <div class="col">
		    <div class="card">
			    <div class="card-header bg-transparent border-success">${searchroutine.dailyroutineTitle}</div>
			      <div class="card-body">
<!-- 			        <h5 class="card-title"></h5> -->
			        <p class="card-text"></p>
			    </div>
		      <div class="card-footer bg-transparent border-success">Footer</div>
		    </div>
		  </div>
  		</c:forEach>
  		</div>
	</body>
</html>