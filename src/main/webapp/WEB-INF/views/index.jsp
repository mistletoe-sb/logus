<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="include.jsp" %>
		<style>
/* 		body {background-image: url(/logus/resources/images/snowmain.jpg); */
/* 		background-repeat: no-repeat;  */
/* 		background-size: auto; */
/* 		background-position: 100px 200px 200px 100px; */
		.card-group {
			margin: 30px 100px 30px 100px;
		}
		.card {
			margin: 20px 20px 20px 20px
		}

		</style>
	</head>
		<%@ include file="header_body.jsp" %>
		<body>
			<div>
				<div class="card-group">
				  <div class="card border border-info rounded">
				    <img src="/logus/resources/images/snowmain2.jpg" class="card-img-top border-info" alt="...">
				    <div class="card-body border-top border-info">
				      <h5 class="card-title text-center fw-semibold">기존 회원이신가요?</h5>
				      <button type="button" class="btn btn-primary btn-lg d-grid gap-2 col-4 mx-auto" onclick="location.href='<c:url value='/loginform'/>'">로그인하러 가기</button>
				    </div>
				  </div>
				  <div class="card border border-info rounded">
				    <img src="/logus/resources/images/snowmain.jpg" class="card-img-top" alt="...">
				    <div class="card-body border-top border-info">
				      <h5 class="card-title text-center fw-semibold">저희 사이트에 처음 방문하셨나요?</h5>
				      <button type="button" class="btn btn-primary btn-lg d-grid gap-2 col-4 mx-auto" onclick="location.href='<c:url value='/insertform'/>'">회원가입하러 가기</button>
				    </div>
				  </div>
				</div>
<%-- 				<a href="<c:url value='/loginform'/>">로그인</a> --%>
			</div>
		</body>
</html>