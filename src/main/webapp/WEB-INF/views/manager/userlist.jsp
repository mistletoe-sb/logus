<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>회원관리</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <h1>회원관리</h1>
        <h6>가입중 회원수 : ${inmembercount}, 탈퇴한 회원수: ${outmembercount}</h6>
        <h2>로그인 관리자 별명 : ${sessionScope.sessionManagerNickname}</h2>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
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
	                <th scope="col">${member.memberSex}</th>
	                <th scope="col">${member.memberJob}</th>
	                <th scope="col">${member.memberOutdate}</th>
	              </tr>
              </c:forEach>
            </tbody>
          </table>
<!--           <div class="d-grid gap-2 col-2 mx-auto"> -->
<!--             <button type="button" class="btn btn-primary">버튼</button> -->
<!--         </div> -->
    </body>
</html>