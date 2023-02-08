<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../include.jsp" %>
	</head>
	<body>
		<%@ include file="../header_body.jsp" %>
		<div class="align_container">
			<div>
				<h5>루틴 검색 결과 : ${fn:length(searchroutine)} 건</h5>
			</div>
			<div id="dailyroutine_card_container_box">
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
														<button class="tag_block" style="display: inline-block">${tg.tagName}</button>
													</c:when>
													<c:when test="${i.index == 5}">...</c:when>
												</c:choose>
											</c:when>
											<c:otherwise>
											<h5 class="row justify-content-center">등록된 태그가 없습니다</h5>
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
			</div>
		</div>
		<div class="align_container">
			<div>
				<h5>일일 스토리 검색 결과 : ${fn:length(dsList)} 건</h5>
			</div>
		 	<div>
		 		<c:forEach var="ds" items="${dsList}" varStatus="stat">
					<div class="dailystory_card_container" style="display: inline-block">
						<div class="card">
							<div onclick="location.href='<c:url value="/${ds.memberNickname}/library/story/${ds.dailystoryCode}"/>'">
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
										<c:forEach var="tg" items="${storyTagList[ds.dailystoryCode]}" varStatus="i">
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
							<div class="card-footer bg-transparent border-success">
						    	<div class="d-grid gap-2 col-7 mx-auto">
						     		<button class="btn btn-primary" type="button" onclick="location.href='<c:url value="/${ds.memberNickname}/library"/>'">서재 방문하기</button>
						    	</div>
					    	</div>
						</div>
					</div>
				</c:forEach>
		 	</div>
		</div>
	</body>
</html>