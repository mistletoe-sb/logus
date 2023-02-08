<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
    <head>
        <title>회원관리</title>
        <style type="text/css">
         .container{
            width : 1400px;
            margin : 20px auto;
            background-color: #ffffff;
         }
         .title{
            margin : 40px auto;
            text-align : center;
         }
         .title2{
            margin : 40px auto;
            text-align : right;
         }
      	</style>
    </head>
    <body>
   		<%@ include file="../header.jsp" %>
		<%@ include file="managerside.jsp" %>
	    <div class="container">
	        <h1 class="title">회원관리</h1>
	        <h4 class="title2">${sessionScope.sessionManagerNickname}</h4>
	        <h6>가입중 회원수 : ${inmembercount}, 탈퇴한 회원수: ${outmembercount}</h6>
	        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	        <fieldset>
	        <table class="table">
	            <thead>
	              <tr>
	                <th scope="col">이름</th>
	                <th scope="col">ID</th>
	                <th scope="col">닉네임</th>
	                <th scope="col">가입날짜</th>
	                <th scope="col">이메일</th>
	                <th scope="col">전화번호</th>
	                <th scope="col">생년월일</th>
	                <th scope="col">성별</th>
	                <th scope="col">직업</th>
	                <th scope="col">탈퇴날짜</th>
	              </tr>
	            </thead>
	            <tbody>
	              <c:forEach var="member" items="${memberlist}">
		              <tr>
		                <th scope="col">${member.memberName}</th>
		                <th scope="col">${member.memberId}</th>
		                <th scope="col">${member.memberNickname}</th>
		                <th scope="col">${member.memberIndate}</th>
		                <th scope="col">${member.memberEmail}</th>
		                <th scope="col">${member.memberPhone}</th>
		                <th scope="col">${member.memberBirth}</th>
		                <th scope="col">
		                	<c:choose>
		                		<c:when test="${member.memberSex == 1}">
		                			남
		                		</c:when>
		                		<c:otherwise>
		                			여
		                		</c:otherwise>
		                	</c:choose>
		                </th>
		                <th scope="col">${member.memberJob}</th>
		                <th scope="col">${member.memberOutdate}</th>
		              </tr>
	              </c:forEach>
	            </tbody>
	          </table>
	          </fieldset>
		</div>
    </body>
</html>