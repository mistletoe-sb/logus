<%@ include file="../header.jsp" %>
<%
	if(session.getAttribute("sessionManagerNickname") != null) {
		%>
		<%@ include file="managerside.jsp" %>
		<%
	}
%>
<%
	if(session.getAttribute("memberNickname") != null) {
		%>
		<%@ include file="memberside.jsp" %>
		<%
	}
%>
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
        <title>Q&A 글보기</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
<%--         <h2>로그인 관리자 별명 : ${sessionScope.sessionManagerNickname}</h2> --%>

	    <div class="inner">
	        <div class="contents" id="bodyWrap">
	            <h3 class="title">Q&A</h3>
	            <div class="subContents" id="contentBody">
	                <div class="body" id="bodyCon">
	                    <!-- 여기서부터 콘텐츠 s -->
	                    <div class="bodyBox01">
	                        <div class="bottomListBox">
	                            <div class="tableWrap">
	                                <table>
	                                    <caption>자유게시판 뷰 페이지로 제목, 질문자, 등록일로 구성</caption>
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
	                                </table>
	                            </div><!--//tableWrap -->
	                                    <div class="listView">
	                                        <div class="viewTxt">${qnadetail.qnaContent}</div>
	                                    </div>
	                                    <div class="listView">
	                                        <div class="viewTxt">${qnadetail.answerContent}</div>
	                                    </div>
	                            <div class="btnListGo">
	                            	<button class="btn btn-primary" type="button" onclick="location.href='http://localhost:8080/logus/manager/qna'">목록으로</button>
	                            	
	                            	<c:set var="writer_nickname" value="${qnadetail.memberNickname}"></c:set>
	                            	<c:if test="${sessionScope.memberNickname == writer_nickname && empty qnadetail.answerContent}">
		                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
		                                    <button class="btn btn-primary me-md-2" type="button" onclick="location.href='http://localhost:8080/logus/manager/updateqnaform?qnaCode=${qnadetail.qnaCode}'">문의글 수정하기</button>
		                                    <button class="btn btn-primary" type="button" onclick="location.href='http://localhost:8080/logus/manager/deleteqna?qnaCode=${qnadetail.qnaCode}'">문의글 삭제하기</button>
		                                </div>
	                                </c:if>
	                                <c:if test="${not empty sessionScope.sessionManagerNickname}">
		                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
		                                	<c:choose>
			                                	<c:when test="${empty qnadetail.answerContent}">
			                                    	<button class="btn btn-primary me-md-2" type="button" onclick="location.href='http://localhost:8080/logus/manager/insertanswerform?qnaCode=${qnadetail.qnaCode}'">문의답변 등록하기</button>
			                                    </c:when>
			                                    <c:otherwise>
			                                    	<button class="btn btn-primary me-md-2" type="button" onclick="location.href='http://localhost:8080/logus/manager/updateanswerform?qnaCode=${qnadetail.qnaCode}'">문의답변 수정하기</button>
			                                    	<button class="btn btn-primary" type="button" onclick="location.href='http://localhost:8080/logus/manager/deleteanswer?qnaCode=${qnadetail.qnaCode}'">문의답변 삭제하기</button>
			                                    </c:otherwise>
		                                    </c:choose>
		                                </div>
	                                </c:if>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>

    </body>
</html>