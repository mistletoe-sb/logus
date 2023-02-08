<%@ include file="../header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<%@ include file="../include.jsp" %>
	<link rel="stylesheet" href="<c:url value='/resources/css/achieve.css'/>">
		<meta charset="UTF-8">
		<title>출석체크</title>
	</head>
	<body>
	<h2><span class="badge bg-secondary bg-lg" id="todayachieve"></span></h2>
	<h1 class="d-flex flex-wrap justify-content-center"><span class="badge bg-primary bg-lg">${today}요일</span></h1>
<%-- 	<h2 class="d-flex flex-wrap justify-content-center">${routine.dailyroutineTitle}</h2> --%>
<%--&nbsp; (table-sm 넣으면 테이블 패딩 줄어듬->작아짐) --%>
		<div class="d-grid gap-2 col-7 mx-auto">
			<form id="achieve" name="achieveform" action="<c:url value='/achieve/save'/>" method="post" onsubmit="return on_submit_check();">
			<c:choose>
			<c:when test="${not empty routine}">
			<input type="hidden" name="today" id="today">
			<table class="table table-bordered table-group-divider bg-success bg-opacity-10 rwd-table">
		  <thead>
		    <tr class="">
		      <th scope="col">시간</th>
		      <th scope="col">일정 내용</th>
		      <th scope="col">달성율</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach items="${checklist}" var="checklist" varStatus="status">
		    <tr>
		      <td class="text-danger bg-opacity-10 bg-info ">${checklist.dailycheckBegintime} ~ ${checklist.dailycheckEndtime}</td>
		      <td class="bg-opacity-10 bg-info">${checklist.dailycheckContent}</td>
		      <td class="bg-opacity-10 bg-info" id="rate${status.index}">
			      <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="achieverate">
					  <option value="0" selected>0%</option>
					  <option value="10">10%</option>
					  <option value="20">20%</option>
					  <option value="30">30%</option>
					  <option value="40">40%</option>
					  <option value="50">50%</option>
					  <option value="60">60%</option>
					  <option value="70">70%</option>
					  <option value="80">80%</option>
					  <option value="90">90%</option>
					  <option value="100">100%</option>
				  </select>
		      </td>
		    </tr>
		    <input type="hidden" name="checkindex" value="${status.index}" <c:if test="${status.last}">id="index"</c:if>></input>
		      </c:forEach>
		 </tbody>
		</table>
				<div class="d-grid gap-2 col-6 mx-auto">
					<input class="btn btn-primary" type="submit" value="출석 완료하기" id="submitachieve">
				</div>
			</c:when>
			<c:otherwise>
				<h2>현재 등록된 루틴이 없습니다</h2>
		 	</c:otherwise>
		</c:choose>
		 </form>
		 </div>
	</body>
</html>