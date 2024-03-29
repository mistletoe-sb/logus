<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
    <head>
    <style type="text/css">
         #container{
            width : 1200px;
            margin : 20px auto;
            background-color: #f7f7f7;
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
    <div>
	    <div id="container" class="inner">
	        <div class="contents" id="bodyWrap">
	            <h1 class="title">Q&A</h1>
	            <h4 class="title2">${sessionScope.sessionManagerNickname}</h4>
                <table class="table table-bordered">
                    <colgroup>
                        <col style="width:16%;"/>
                        <col style="width:48%;"/>
                        <col style="width:16%;"/>
                        <col style="width:20%;"/>
                    </colgroup>
                    <tr>
                        <th scope="row">제목</th>
                        <td colspan="3">
                            <div class="box01">
                                ${qnadetail.qnaTitle}
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">작성자</th>
                        <td>
                            <div class="box01">${qnadetail.memberNickname}</div>
                        </td>
                        <th scope="row">등록일</th>
                        <td>
                            <div class="box01">${qnadetail.qnaDate}</div>
                        </td>
                    </tr>
                    <tr>
                    	<td colspan="4" height="300">
                    		<div class="listView">
		                        <div class="viewTxt">${qnadetail.qnaContent}</div>
		                    </div>
                    	</td>
                    </tr>
                    <c:if test="${not empty qnadetail.answerContent}">
                        <tr>
                        	<td colspan="4" height="300">
                            	<div class="listView">
			                        <div class="viewTxt">${qnadetail.answerContent}</div>
			                    </div>
		                    </td>
                        </tr>
                    </c:if>
                            
                </table>
            </div><!--//tableWrap -->
            <div class="btnListGo">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            	<button class="btn btn-primary" type="button" onclick="location.href='<c:url value="/manager/qna"/>'">목록으로</button>
            	
            	<c:set var="writer_nickname" value="${qnadetail.memberNickname}"></c:set>
            	<c:if test="${sessionScope.memberNickname == writer_nickname && empty qnadetail.answerContent}">
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <button class="btn btn-primary me-md-2" type="button" onclick="location.href='<c:url value="/manager/updateqnaform?qnaCode=${qnadetail.qnaCode}"/>'">문의글 수정하기</button>
                        <button class="btn btn-primary" type="button" onclick="location.href='<c:url value="/manager/deleteqna?qnaCode=${qnadetail.qnaCode}"/>'">문의글 삭제하기</button>
                    </div>
                </c:if>
                <c:if test="${not empty sessionScope.sessionManagerNickname}">
                    	<c:choose>
                        	<c:when test="${empty qnadetail.answerContent}">
                            	<button class="btn btn-primary me-md-2" type="button" onclick="location.href='<c:url value="/manager/insertanswerform?qnaCode=${qnadetail.qnaCode}"/>'">문의답변 등록하기</button>
                            </c:when>
                            <c:otherwise>
                            	<button class="btn btn-primary me-md-2" type="button" onclick="location.href='<c:url value="/manager/updateanswerform?qnaCode=${qnadetail.qnaCode}"/>'">문의답변 수정하기</button>
                            	<button class="btn btn-primary" type="button" onclick="location.href='<c:url value="/manager/deleteanswer?qnaCode=${qnadetail.qnaCode}"/>'">문의답변 삭제하기</button>
                            </c:otherwise>
                        </c:choose>
                </c:if>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>