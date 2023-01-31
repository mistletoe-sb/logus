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
        <title>관리자 관리</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <h1>관리자 관리</h1>
        <h2>로그인 관리자 별명 : ${sessionScope.sessionManagerNickname}</h2>
        <h6>총 관리자 수 ${managercount}명</h6>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <table class="table">
            <thead>
              <tr>
                <th scope="col">관리자ID</th>
                <th scope="col">관리자닉네임</th>
                <th scope="col">삭제하기</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="manager" items="${managerlist}">
              <tr>
                <th scope="col">${manager.managerId}</th>
                <th scope="col">${manager.managerNickname}</th>
                <th scope="col"><button type="button" class="btn btn-primary" onclick="location.href='http://localhost:8080/logus/manager/deletemanager?managerId=${manager.managerId}'">
				삭제
                </button></th>
              </tr>
            </c:forEach>
            </tbody>
        </table>
    </body>
</html>