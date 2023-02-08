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
    	<div class ="container">
	    <div class="inner">
	        <div class="contents" id="bodyWrap">
	            <h1 class="title">리포트</h1>
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
                                    ${boarddetail.boardTitle}
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">작성자</th>
                            <td>
                                <div class="box01">${boarddetail.managerNickname}</div>
                            </td>
                            <th scope="row">등록일</th>
                            <td>
                                <div class="box01">${boarddetail.boardDate}</div>
                            </td>
                        </tr>
                        <tr>
                        	<td colspan="4" height="300">
                        		<div class="listView">
		                            <div class="viewTxt">${boarddetail.boardContent}</div>
		                        </div>
		                        <c:if test="${not empty boarddetail.boardImage}">
		                            <div class="listView">
		                                <div class="viewImg">
											<img src="<c:url value='/resources/images/manager/${boarddetail.boardImage}'/>" width="200" height="200" class="img-fluid"/>
										</div>
                                    </div>
                                </c:if>
                            </td>
                        </tr>
                        </table>
                        <div class="btnListGo">
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            	<c:if test="${not empty sessionScope.sessionManagerNickname}">
                                    <button class="btn btn-primary me-md-2" type="button" onclick="location.href='<c:url value="/manager/updateboardform?boardCategory=${boarddetail.boardCategory}&boardCode=${boarddetail.boardCode}"/>'">수정하기</button>
                                    <button class="btn btn-primary" type="button" onclick="location.href='<c:url value="/manager/deleteboard?boardCategory=${boarddetail.boardCategory}&boardCode=${boarddetail.boardCode}"/>'">삭제하기</button>
								</c:if>
                                <button class="btn btn-primary" type="button" onclick="location.href='<c:url value="/manager/board?boardcategory=${boarddetail.boardCategory}"/>'">목록으로</button>
                              </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>