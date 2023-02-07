<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../include.jsp" %>
	</head>
	<body>
		<%@ include file="../header_body.jsp" %>
	<div class="row row-cols-1 row-cols-md-4 g-4">
	<c:forEach items="${searchroutine}" var="searchroutine" varStatus="status">
		  <div class="col">
		    <div class="card">
			    <div class="card-header bg-transparent border-success text-truncate">${searchroutine.dailyroutineTitle}</div>
			      <div class="card-body">
			        <div class="card-text">
			       		<c:forEach var="tg" items="${tagList[searchroutine.dailyroutineCode]}" varStatus="i">
							<c:choose>
								<c:when test="${not empty tg.tagName}">
									<c:choose>
										<c:when test="${i.index < 5}">
											<button style="display: inline-block">${tg.tagName}</button>
										</c:when>
										<c:when test="${i.index == 5}">...</c:when>
									</c:choose>
								</c:when>
								<c:otherwise>
								<h5>등록된 태그가 없습니다</h5>
								</c:otherwise>
							</c:choose>
						</c:forEach>
			        </div>
			    </div>
		      <div class="card-footer bg-transparent border-success">
			      <div class="d-grid gap-2 col-7 mx-auto">
			     	 <button class="btn btn-primary" type="button" onclick="location.href='<c:url value="/${searchroutine.memberNickname}/library"/>'">서재 방문하기</button>
			      </div>
		      </div>
		    </div>
		  </div>
  		</c:forEach>
  		</div>
	</body>
</html>