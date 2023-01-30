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
        <title>리포트 목록</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <h1>리포트</h1>
        <h6>총 리포트 글 수 ${boardcount}개</h6>
        <h2>로그인 관리자 별명 : ${sessionScope.sessionManagerNickname}</h2>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <table class="table">
            <thead>
              <tr>
                <th scope="col">번호</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">작성일</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="board" items="${boardlist}">
              <tr>
                <th scope="row">${board.boardCode}</th>
                <td><a href="http://localhost:8080/logus/manager/boarddetail?boardcode=${board.boardCode}">${board.boardTitle}</a></td>
                <td>${board.managerNickname}</td>
                <td>${board.boardDate}</td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
          <div class="d-grid gap-2 col-2 mx-auto">
            <button type="button" class="btn btn-primary" onclick="location.href='http://localhost:8080/logus/manager/insertboardform?boardcategory=2'">리포트 작성하기</button>
        </div>
    </body>
</html>