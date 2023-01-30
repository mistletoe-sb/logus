<%@ include file="../header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>루틴 리스트</title>
	</head>
	<body>
	<button type="button" class="btn btn-primary btn-lg" onclick="location.href='newroutine'">새 루틴 추가하기</button>
	<c:forEach items="${routinelist}" var="routinelist" varStatus="status">
	<ul class="list-group">
  <li class="list-group-item d-flex justify-content-between align-items-start">
    <div class="ms-2 me-auto">
      <div class="fw-bold">${routinelist.dailyroutineTitle }</div>
      여기는 태그 위치
    </div>
    <span class="badge bg-primary rounded-pill"></span>
    <a href="routine/${routinelist.dailyroutineCode}" class="btn btn-primary active" aria-current="page">확인</a>
  	<a href="routinefix" class="btn btn-primary">수정</a>
  	<a href="#" class="btn btn-primary">삭제수정에서할듯?</a>
  </li>
</ul>

</c:forEach>
	</body>
</html>