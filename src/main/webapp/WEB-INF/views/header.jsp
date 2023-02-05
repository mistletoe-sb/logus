<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<c:set var="root" value="${pageContext.request.contextPath}"/>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="${root}/resources/js/jquery-3.6.3.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
		<meta charset="UTF-8">
		<title>Log Us</title>
	</head>
	<body>
		<div>
			<nav class="navbar bg-light">
				<div class="container-fluid">
					<a class="navbar-brand" href="#">
						<img src="${root}/resources/images/logo.png" 
							 alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
						Logus
				    </a>
				    <button type="button" class="btn btn-primary">내서재<br>바로가기</button>
				  	<button type="button" class="btn btn-info">오늘의 출석체크</button>
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
							<button type="button" class="btn btn-secondary">마이페이지</button>
							<button type="button" class="btn btn-secondary" onclick="location.href='<c:url value='/logout'/>'">로그아웃</button>
							<button type="button" class="btn btn-secondary" onclick="location.href='<c:url value='/followList'/>'">팔로우</button>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="container-fluid">
					<form class="d-flex" role="search">
						<div class="dropdown">
				  			<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
				    		Dropdown button
				  			</button>
				  			<ul class="dropdown-menu">
				    			<li><a class="dropdown-item" href="#">Action</a></li>
							    <li><a class="dropdown-item" href="#">Another action</a></li>
							    <li><a class="dropdown-item" href="#">Something else here</a></li>
				  			</ul>
						</div>
				      	<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
				      	<button class="btn btn-outline-success" type="submit">검색</button>
					</form>
				</div>
			</nav>
			im header
		</div>

