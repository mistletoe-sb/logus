<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../include.jsp" %>
	</head>
	<body>
		<%@ include file="../header_body.jsp" %>
		<div class="container_box_custom">
			<div class="top_btn_container_box_custom">
				<div style="display: inline-block;">
					<c:if test="${memberNickname == sessionScope.memberNickname}">
						<button type="button" class="btn btn-outline-primary" onclick=
								"location.href='<c:url value="/${sessionScope.memberNickname}/library/story/insert"/>'">일일 스토리 작성</button>
					</c:if>
				</div>
				<div id="search_in_dailystory" class="container-fluid">
					<form id="search" name="searchform" class="d-flex" role="search" method="get" action="<c:url value='/library/search'/>">
						<select class="form-select" aria-label="Default select example" name="option">
							<option value="0" selected>전체</option>
							<option value="1">태그</option>
							<option value="2">제목</option>
							<option value="3">내용</option>
							<option value="4">닉네임</option>
						</select>
						<input id="search_txt_in_dailystory" class="form-control me-2" name="search"
							   type="search" placeholder="내 스토리 검색하기" aria-label="Search">
						<button id="search_btn_in_dailystory" class="btn btn-outline-success" type="submit">검색</button>
						<input type="hidden" name="myNickname" value="${sessionScope.memberNickname}">
					</form>
				</div>
			</div>
			<div>
				<c:forEach var="ds" items="${dsList}" varStatus="stat">
					<div class="dailystory_card_container" style="display: inline-block"
						 onclick="location.href='<c:url value="/${ds.memberNickname}/library/story/${ds.dailystoryCode}"/>'">
						<div class="card">
							<div class="ratio ratio-16x9">
								<c:choose>
									<c:when test='${(ds.dailystoryImage != null) && (ds.dailystoryImage != "")}'>
										<img src="<c:url value='/resources/images/dailystory/${ds.dailystoryImage}'/>" class="card-img-top" alt="${ds.dailystoryImage}">				  	
									</c:when>
									<c:otherwise>
										<img src="<c:url value='/resources/images/default_thumbnail.jpg'/>" class="card-img-top" alt="기본 썸네일">				  	
									</c:otherwise>
								</c:choose>
							</div>
							<div class="card-body">
								<h5 class="card-title">${ds.dailystoryTitle}</h5>
								<button type="button" class="btn btn-outline-primary btn-sm" style="display: inline-block" disabled>댓글 : ${rpCount[stat.index]}</button>
								<p class="card-text" style="white-space: pre-line;">
									<span class="d-inline-block text-truncate" style="max-width: 90%;">
										${ds.dailystoryContent}<br>
									</span>
									<%-- <fmt:formatDate value="${ds.dailystoryUploaddate}" pattern="yyyy.MM.dd HH:mm"/> --%>
								</p>
							    <div>
									<c:forEach var="tg" items="${tagList[ds.dailystoryCode]}" varStatus="i">
										<c:choose>
											<c:when test="${i.index < 5}">
												<button class="tag_block" style="display: inline-block">${tg.tagName}</button>
											</c:when>
											<c:when test="${i.index == 5}">...</c:when>
										</c:choose>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>		
	</body>
</html>