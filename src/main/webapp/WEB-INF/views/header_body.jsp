<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
		<header>
			<nav class="navbar bg-light">
			
			<a class="navbar-brand" 
						<c:choose>
						<c:when test="${empty sessionScope.memberNickname}">
							href="<c:url value='/'/>"
						</c:when>
						<c:otherwise>
							href="<c:url value='/${sessionScope.memberNickname}/library'/>"
						</c:otherwise>
						</c:choose>
					>
						<img src="<c:url value='/resources/images/logo.png'/>" 
							 alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
						Logus
					</a>

					<form id="search" name="searchform" class="d-flex" role="search" action="<c:url value='/search'/>" method="get">
						<select class="form-select" aria-label="Default select example" name="option">
							<option value="0" selected>전체</option>
							<option value="1">태그</option>
							<option value="2">제목</option>
							<option value="3">내용</option>
							<option value="4">닉네임</option>
						</select>
				    	<input id="searchtext" class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search">
				    	<button id="searchbutton" class="btn btn-outline-success" type="submit" value="Submit" id="submit">search</button>
					</form>

				<div>
					<c:choose>
					  	<c:when test="${empty sessionScope.memberNickname}">
							<button type="button" class="btn btn-outline-dark" onclick="location.href='<c:url value='/loginform'/>'">로그인</button>
							<button type="button" class="btn btn-outline-dark"onclick="location.href='<c:url value='/insertform'/>'">회원가입</button>
						</c:when>
						<c:otherwise>
							<c:if test="${not empty message}">
								<li>${sessionScope.memberId}(${sessionScope.memberNickname})님 환영합니다.</li>
							</c:if>
							<button type="button" class="btn btn-secondary" onclick="location.href='<c:url value='/mypage'/>'">마이페이지</button>
							<button type="button" class="btn btn-secondary" onclick="location.href='<c:url value='/logout'/>'">로그아웃</button>
							<button type="button" class="btn btn-secondary" onclick="location.href='<c:url value='/followList'/>'">팔로우</button>
							<button type="button" class="btn btn-secondary" onclick="location.href='<c:url value='/manager/board?boardcategory=1'/>'">고객센터</button>
							<button type="button" class="btn btn-info" onclick="location.href='<c:url value='/achieve'/>'">오늘의 출석체크</button>
							<button type="button" class="btn btn-primary" onclick="location.href='<c:url value='/${sessionScope.memberNickname}/library'/>'">내서재<br>바로가기</button>
						</c:otherwise>
					</c:choose>
				</div>
			</nav>
		</header>
