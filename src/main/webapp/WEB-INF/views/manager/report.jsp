<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
    <head>
        <style type="text/css">
         .container{
            width : 800px;
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
    	<%
			if(session.getAttribute("sessionManagerNickname") != null) {
				%>
				<%@ include file="../header.jsp" %>
				<%@ include file="managerside.jsp" %>
				<%
			}
		%>
		<%
			if(session.getAttribute("memberNickname") != null) {
				%>
				<%@ include file="../header_body.jsp" %>
				<%@ include file="memberside.jsp" %>
				<%
			}
		%>
	    <div class=	"container">
	        <h1 class ="title">리포트</h1>
	        <h4 class ="title2">${sessionScope.sessionManagerNickname}</h4>
	        <h6>총 리포트 글 수 ${boardcount}개</h6>
	        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	        <fieldset>
	        <table class="table">
	            <thead>
	              <tr>
	                <th scope="col">제목</th>
	                <th scope="col">작성자</th>
	                <th scope="col">작성일</th>
	              </tr>
	            </thead>
	            <tbody>
	            <c:forEach var="board" items="${boardlist}">
	              <tr>
	                <td><a href="<c:url value='/manager/boarddetail?boardcode=${board.boardCode}'/>">${board.boardTitle}</a></td>
	                <td>${board.managerNickname}</td>
	                <td>${board.boardDate}</td>
	              </tr>
	            </c:forEach>
	            </tbody>
	          </table>
	          <div class="d-grid gap-2 col-2 mx-auto">
		          <nav aria-label="Page navigation example">
					  <ul class="pagination">
					  	<c:if test="${nowPage!=1}">
							<li class="page-item"><a class="page-link" href="<c:url value='/manager/board?boardcategory=2&nowPage=1' /> ">처음</a></li>
							<li class="page-item"><a class="page-link" href="<c:url value='/manager/board?boardcategory=2&nowPage=${nowPage - 1}' /> ">이전</a></li>
						</c:if>
						<c:forEach var="i" begin="${nowPage > 5 ? nowPage - 4 : 1}" end="${(nowPage > 5 ? nowPage + 4 : 10) > totalPage ? totalPage : (nowPage > 5 ? nowPage + 4 : 10)}">
						<c:choose>
							<c:when test="${nowPage==i}">
								<li class="page-item active"><a class="page-link" href="<c:url value='/manager/board?boardcategory=2&nowPage=${i}' /> ">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="<c:url value='/manager/board?boardcategory=2&nowPage=${i}' /> ">${i}</a></li>
							</c:otherwise>
						</c:choose>
						</c:forEach>
						<c:if test="${nowPage!=totalPage}">
							<li class="page-item"><a class="page-link" href="<c:url value='/manager/board?boardcategory=2&nowPage=${nowPage + 1}' /> ">다음</a></li>
							<li class="page-item"><a class="page-link" href="<c:url value='/manager/board?boardcategory=2&nowPage=${totalPage}' /> ">마지막</a></li>
						</c:if>
					  </ul>
					</nav>
				</div>
		      <c:if test="${not empty sessionScope.sessionManagerNickname}">
		          <div class="d-grid gap-2 col-2 mx-auto">
		            <button type="button" class="btn btn-primary" onclick="location.href='<c:url value="/manager/insertboardform?boardcategory=2"/>'">리포트 작성하기</button>
		        </div>
	        </c:if>
	        </fieldset>
        </div>
    </body>
</html>