<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../include.jsp" %>
	</head>
	<body>
		<%@ include file="../header_body.jsp" %>
		<!-- Modal1(평일) -->
		<div class="modal fade" id="modal1" tabindex="-1" aria-labelledby="modal1" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable">	<!-- Scrollable modal -->
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">${routine1.dailyroutineTitle}</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">시간</th>
									<th scope="col">일정 내용</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${checklist1}" var="checklist1" varStatus="status">
									<tr>
										<th scope="row">${status.count}</th>
										<td>${checklist1.dailycheckBegintime} ~ ${checklist1.dailycheckEndtime}</td>
										<td>${checklist1.dailycheckContent}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<form id="routineshare1" name="routineshare1form" action="<c:url value='/routineshare'/>" method="post">
							<input type="hidden" value="${routine1.dailyroutineCode}" name="dailyroutineCode">
							<input type="hidden" value="${routine1.memberNickname}" name="memberNickname">
							<c:if test="${memberVO.memberNickname ne sessionUser}">
								<button type="submit" class="btn btn-primary">공유 받기</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	
		<!-- Modal2(주말2) -->
		<div class="modal fade" id="modal2" tabindex="-1" aria-labelledby="modal2" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable">	<!-- Scrollable modal -->
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">${routine2.dailyroutineTitle}</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">시간</th>
									<th scope="col">일정 내용</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${checklist2}" var="checklist2" varStatus="status">
									<tr>
										<th scope="row">${status.count}</th>
										<td>${checklist2.dailycheckBegintime} ~ ${checklist2.dailycheckEndtime}</td>
										<td>${checklist2.dailycheckContent}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<form id="routineshare2" name="routineshare2form" action="<c:url value='/routineshare2'/>" method="post">
							<input type="hidden" value="${routine2.memberNickname}" name="memberNickname2">
							<input type="hidden" value="${routine2.dailyroutineCode}" name="dailyroutineCode2">
							<c:if test="${memberVO.memberNickname ne sessionUser}">
								<button type="submit" class="btn btn-primary" >공유 받기</button>
							 </c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	
		<!--오프캔버스(서재 정보 사이드 바)-->
		<div id="mylib_info_btn">
			<button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions">서재 정보 보기</button>
		</div>
		<div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
			<div class="offcanvas-header">
				<div class="d-grid gap-2 col-6 mx-auto">
					<h2 class="offcanvas-title" id="offcanvasWithBothOptionsLabel" style="text-align: center;"><span class="badge bg-success bg-opacity-50">서재 정보</span></h2>
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="offcanvas-body">
				<img alt="등록된 사진이 없습니다" id="preview-image" src="${root}/logus/resources/images/member/${memberVO.memberProfile}" style="height: 300px;width:350px;object-fit: cover;">
				<dl class="row">
					<dt class="col-sm-3">닉네임</dt>
					<dd class="col-sm-9">${memberVO.memberNickname}</dd>

					<dt class="col-sm-3">직업</dt>
					<dd class="col-sm-9"><p>${memberVO.memberJob}</p></dd>

					<dt class="col-sm-3">가입일</dt>
					<dd class="col-sm-9">${memberVO.memberIndate}</dd>
					
					<dt class="col-sm-6">일주일 루틴 달성률</dt>
					<dd class="col-sm-4">${weekAchieve}%</dd>

					<dt class="col-sm-6">오늘의 루틴 달성률</dt>
					<dd class="col-sm-4">${todayAchieve}%</dd>
				</dl>
				<c:choose>
					<c:when test="${memberVO.memberNickname eq sessionUser || not empty memberVO.memberOutdate}"></c:when>
					<c:otherwise>
					<div class="d-grid gap-2 col-6 mx-auto">
						<c:choose>
							<c:when test="${following eq 0}">
								<input type="hidden" value="${memberVO.memberId}" id="followinId" name="followingMemberId">
								<input type='button' value='팔로우하기' id='followbtn1' class="btn btn-danger"  onclick="followBtn2()"/>
								<input type='button' value='팔로우 취소' id='followbtn2' class="btn btn-danger" onclick="followBtn1()" style="display:none;"/>
							</c:when>
							<c:otherwise>
								<input type="hidden" value="${memberVO.memberId}" id="followinId" name="followingMemberId">
							    <input type='button' value='팔로우하기' id='followbtn1' class="btn btn-danger"  onclick="followBtn2()" style="display:none;"/>	      
								<input type='button' value='팔로우 취소' id='followbtn2' class="btn btn-danger" onclick="followBtn1()"/>
							</c:otherwise>
						</c:choose>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<div class="align_container">
			<div id="align_container_routine">
				<div id="dailyroutine_card_container_box" class="d-inline-block">
					<div class="row row-cols-1 row-cols-md-2 g-4">
						<c:choose>
							<c:when test="${empty routine1}">
								<div class="col">
									<div class="card">
										<div class="card-body">
											<h3 class="card-title">
												<span class="badge bg-secondary">평일</span>
											</h3>
											<h5 class="card-text">현재 등록된 루틴이 없습니다</h5>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col">
									<div class="card">
										<div class="card-header bg-transparent border-success text-truncate">
											<h3 class="card-title">
												<span class="badge bg-secondary">평일</span>
												<button type="button" class="btn btn-outline-primary btn-sm" disabled>공유된 횟수: ${routine1.dailyroutineShared}</button>
											</h3>
											${routine1.dailyroutineTitle}
										</div>
										<div class="card-body">
											<div class="card-text">
												<c:forEach var="tg" items="${tag1}" varStatus="i">
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
												<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal1">확인</button>
											</div>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${empty routine2}">
								<div class="col">
									<div class="card">
										<div class="card-body">
											<h3 class="card-title">
												<span class="badge bg-secondary">주말</span>
											</h3>
											<h5 class="card-text">현재 등록된 루틴이 없습니다</h5>
											<p class="card-text"></p>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col">
									<div class="card">
										<div class="card-header bg-transparent border-success text-truncate">
											<h3 class="card-title">
												<span class="badge bg-secondary">주말</span>
												<button type="button" class="btn btn-outline-primary btn-sm" disabled>공유된 횟수: ${routine2.dailyroutineShared }</button>
											</h3>
											${routine2.dailyroutineTitle}
										</div>
										<div class="card-body">
											<div class="card-text">
												<c:forEach var="tg" items="${tag2}" varStatus="i">
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
												<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal2" style="display:block">확인</button>
											</div>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>  
				</div>
				<div>
					<c:if test="${memberVO.memberNickname eq sessionUser}">
						<button type="button" class="btn btn-outline-secondary" onclick="location.href='<c:url value='/routinelist'/>'">루틴 리스트 더보기</button>
					</c:if>
				</div>
			</div>
		</div>
		<div class="align_container">
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
			<div>
				<c:choose>
					<c:when test="${not empty dsList[0]}">				
						<button type="button" class="btn btn-outline-secondary" onclick=
								"location.href='<c:url value="/${dsList[0].memberNickname}/library/dailystorylist"/>'">일일 스토리 더보기</button>
					</c:when>
					<c:otherwise>
						<h5>작성된 일일 스토리가 없습니다.</h5>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</body>
</html>