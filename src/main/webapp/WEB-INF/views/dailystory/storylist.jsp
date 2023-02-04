<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

		<p>일일 스토리 리스트 출력 화면(서재 메인 페이지)</p>
		<div id="search_in_dailystory">
			<form method="get" action="<c:url value='/library/search'/>">
				<select name="option">
					<option value="0" selected>전체</option>
					<option value="1">태그</option>
					<option value="2">제목</option>
					<option value="3">내용</option>
					<option value="4">닉네임</option>
				</select>
				<input id="search_txt_in_dailystory" class="form-control me-2" name="search"
					   type="search" placeholder="내 스토리 검색하기" aria-label="Search">
				<input id="search_btn_in_dailystory" class="btn btn-outline-success" type="image"
					   src="<c:url value='/resources/images/search.png'/>" alt="검색" width="32" height="32">
				<input type="hidden" name="myNickname" value="${sessionScope.memberNickname}">
			</form>
		</div>
		<br>
		<c:if test="${memberNickname == sessionScope.memberNickname}">
			<a href="<c:url value='/${sessionScope.memberNickname}/library/story/insert'/>">일일 스토리 작성</a>
		</c:if>
		<div>
			<c:forEach var="ds" items="${dsList}" varStatus="stat">
				<div class="card" style="display: inline-block"
					 onclick="location.href='<c:url value="/${ds.memberNickname}/library/story/${ds.dailystoryCode}"/>'">
				  <c:if test='${(ds.dailystoryImage != null) && (ds.dailystoryImage != "")}'>
				  	<img src="default.jpg" class="card-img-top" alt="${ds.dailystoryImage}">
				  </c:if>
				  <div class="card-body">
				    <h5 class="card-title">${ds.dailystoryTitle}</h5>		<p>댓글 : ${rpCount[stat.index]}</p>
				    <p class="card-text" style="white-space: pre-line;">${ds.dailystoryContent}<br>
				    <fmt:formatDate value="${dsVO.dailystoryUploaddate}" pattern="yyyy.MM.dd HH:mm"/></p>
				    <%-- <div>
						<c:forEach var="tg" items="${tagList}" varStatus="i">
							<c:choose>
								<c:when test="${i < 5}">
									<button style="display: inline-block">${tg.tagName}</button>
								</c:when>
								<c:when test="${i == 5}">...</c:when>
							</c:choose>
						</c:forEach>
					</div> --%>
				  </div>
				</div>
			</c:forEach>
		</div>
	</body>
</html>