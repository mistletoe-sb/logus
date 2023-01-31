<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

		<p>일일 스토리 리스트 출력 화면(서재 메인 페이지)</p>
		<br>
		<c:if test="${dsList[0].memberNickname == sessionScope.user}">
			<a href="<c:url value='/${sessionScope.user}/library/story/insert'/>">일일 스토리 작성</a>
		</c:if>
		<div>
			<c:forEach var="ds" items="${dsList}" varStatus="stat">
				<div class="card" style="width: 18rem;" 
					 onclick="location.href='<c:url value="/${ds.memberNickname}/library/story/${ds.dailystoryCode}"/>'">
				  <img src="..." class="card-img-top" alt="${ds.dailystoryImage}">
				  <div class="card-body">
				    <h5 class="card-title">${ds.dailystoryTitle}</h5>		<p>댓글 : ${rpCount[stat.index]}</p>
				    <p class="card-text">${ds.dailystoryContent}<br>
				    <fmt:formatDate value="${dsVO.dailystoryUploaddate}" pattern="yyyy.MM.dd HH:mm"/></p>
				  </div>
				</div>
			</c:forEach>
		</div>
	</body>
</html>