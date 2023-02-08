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
    	<%@ include file="../header.jsp" %>
		<%@ include file="managerside.jsp" %>
	    <div class ="container">
	        <h1 class ="title">리포트</h1>
	        <h4 class = "title2"> ${sessionScope.sessionManagerNickname}</h4>
	        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	        <form action="<c:url value='/manager/updateboard'/>" method="post" enctype="multipart/form-data">
		        <fieldset>
		        <div class="mb-3">
		            <label for="exampleFormControlInput1" class="form-label">제목</label>
		            <input type="text" class="form-control" id="boardTitle" name="boardTitle" value="${boarddetail.boardTitle}" required>
		        </div>
		        <div class="mb-3">
		            <label for="exampleFormControlTextarea1" class="form-label">본문</label>
		            <textarea class="form-control" id="boardContent" name="boardContent" rows="3" required>${boarddetail.boardContent}</textarea>
		        </div>
	            <c:if test="${not empty boarddetail.boardImage}">
	                <div class="listView">
	                    <div class="viewImg">
							<img src="<c:url value='/resources/images/manager/${boarddetail.boardImage}'/>" width="200" height="200" class="img-fluid"/>
						</div>
	                </div>
	            </c:if>
	        	<div class="mb-3">
				  <label for="formFile" class="form-label">이미지 파일 교체</label>
				  <input class="form-control" type="file" id="boardFile" name="boardFile" accept="image/*">
				</div>
	
		        <input type="hidden" id="boardCategory" name="boardCategory" value='2'>
	        	<input type="hidden" id="boardCode" name="boardCode" value='${boarddetail.boardCode}'>
		        <div class="d-grid gap-2 col-1 mx-auto">
		            <input type="submit" class="btn btn-primary" value='등록하기'>
		        </div>
		        </fieldset>
	        </form>
	    </div>
    </body>
</html>