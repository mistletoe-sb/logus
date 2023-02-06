<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<script type="text/javascript">
	
	var isMessage = true;

	<c:if test="${!empty message_ok}">
	 if(isMessage){
		 alert("${message_ok}");
		 isMessage = false;
	 }
	</c:if>
	
	var alert_message = $('#message_ok').val();
	if(alert_message != ""){
		alert(alert_message);
	}
	
	function memberDelete(){
		
		var pw_modal =  $('#memberPassword_modal').val();
		
		if (pw_modal == ""){
			alert("비밀번호를 입력하세요");
		}
	}

	</script>
	<head>
		<%-- <c:set var="root" value="${pageContext.request.contextPath}"/> --%>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="<c:url value='/resources/css/library.css'/>">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="<c:url value='/resources/js/jquery-3.6.3.min.js'/>"></script>
		<script src="<c:url value='/resources/js/dailystory.js'/>"></script>
		<meta charset="UTF-8">
		<title>Log Us</title>
	</head>
	<body>
		<div>
			<nav class="navbar bg-light">
				<div class="container-fluid">
					<a class="navbar-brand" href="#">
						<img src="<c:url value='/resources/images/logo.png'/>" 
							 alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
						Logus
				  </a>
				  <p>${message}</p>
				</div>
				<div>
					<c:choose>
					  	<c:when test="${empty sessionScope.memberNickname}">
							<button type="button" class="btn btn-outline-dark" onclick="location.href='<c:url value='/loginform'/>'">로그인</button>
							<button type="button" class="btn btn-outline-dark"onclick="location.href='<c:url value='/insertform'/>'">회원가입</button>
						</c:when>
						<c:otherwise>
							<li><a>${sessionScope.memberId}(${sessionScope.memberNickname})님 환영합니다.</a></li>
							<div class="d-grid gap-2 d-md-block">
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
									마이페이지 임시
								</button>
							</div>
							<button type="button" class="btn btn-secondary" onclick="location.href='<c:url value='/mypage'/>'">마이페이지</button>
							<button type="button" class="btn btn-secondary" onclick="location.href='<c:url value='/logout'/>'">로그아웃</button>

							<button type="button" class="btn btn-secondary" onclick="location.href='<c:url value='/followList'/>'">팔로우</button>

							<button type="button" class="btn btn-primary" onclick="location.href='<c:url value='/library'/>'">내서재<br>바로가기</button>
				  	 		<button type="button" class="btn btn-info" onclick="location.href='<c:url value='/achieve'/>'">오늘의 출석체크</button>

						</c:otherwise>
					</c:choose>
				</div>
<%-- 					<form id="search" name="searchform" class="d-flex" role="search" action="<c:url value='/search'/>" method="post"> --%>
				<div class="container-fluid">
					<form id="search" name="searchform" class="d-flex" role="search" action="<c:url value='/search'/>" method="post">
						<select class="form-select" aria-label="Default select example" name="option">
							<option value="0" selected>전체</option>
							<option value="1">태그</option>
							<option value="2">제목</option>
							<option value="3">내용</option>
							<option value="4">닉네임</option>
						</select>
				    	<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search">
				    	<button class="btn btn-outline-success" type="submit" value="Submit" id="submit">검색</button>
					</form>
				</div>
			</nav>
		</div>
		
		<form action="<c:url value='findPassword'/>" method="post" class="form-floating">
				<!-- Button trigger modal -->
				
				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
				    	<div class="modal-content">
					    	<div class="modal-header">
					        	<h1 class="modal-title fs-5" id="staticBackdropLabel">비밀번호 확인</h1>
					        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      	</div>
					    <div class="modal-body">
					   	<div>
				    		<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">비밀번호 확인</span>
								<input type="password" name="memberPassword" id="memberPassword_modal" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
							</div>
	    				</div>
					   	<div>
							<div>
								<input type="hidden" name="message" id="message" value="${message}">
							</div>
						</div>
					    </div>
					      	<div class="modal-footer">
					      		<button type="submit" class="btn btn-primary">확인</button>
					        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					      	</div>
					  	</div>
					</div>
				</div>
			</form>

