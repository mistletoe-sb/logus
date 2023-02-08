<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
    <head>
   	 <style type="text/css">
         .container{
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
		<%@ include file="../header.jsp" %>
		<%@ include file="managerside.jsp" %>
	    <div class="container">
	        <h1 class="title">Q&A 답변 등록</h1>
	        <h4 class="title2">${sessionScope.sessionManagerNickname}</h4>
		    <div class="inner">
		        <div class="contents" id="bodyWrap">
		            <div class="subContents" id="contentBody">
		                <div class="body" id="bodyCon">
		                    <!-- 여기서부터 콘텐츠 s -->
		                    <div class="bodyBox01">
		                        <div class="bottomListBox">
		                            <div class="tableWrap">
		                                <table>
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
		                            <br>
	                                <div class="listView">
	                                    <div class="viewTxt">${qnadetail.qnaContent}</div>
	                                </div>
	                                <br>
	                                <form action="<c:url value='/manager/insertanswer'/>" method="post">
								        <fieldset>
								        <div class="mb-3">
								            <label for="exampleFormControlTextarea1" class="form-label">문의글 답변</label>
								            <textarea class="form-control" id="answerContent" name="answerContent" rows="3" placeholder="답변을 입력하세요" required></textarea>
								        </div>
								        <input type="hidden" name="managerNickname" value="${sessionScope.sessionManagerNickname}">
								        <input type="hidden" name="qnaCode" value="${qnadetail.qnaCode}">
							        
			                            <div class="btnListGo">
			                            	<input class="btn btn-primary me-md-2" type="submit" value="문의답변 등록하기">
			                            </div>
			                            </fieldset>
		                            </form>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
    </body>
</html>