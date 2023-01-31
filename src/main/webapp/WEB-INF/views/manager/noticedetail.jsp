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
        <title>공지사항 글보기</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <h2>로그인 관리자 별명 : ${sessionScope.sessionManagerNickname}</h2>

	    <div class="inner">
	        <div class="contents" id="bodyWrap">
	            <h3 class="title">공지사항</h3>
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
	                                </table>
	                            </div><!--//tableWrap -->
	                                    <div class="listView">
	                                        <div class="viewTxt">${boarddetail.boardContent}</div>
	                                    </div>
	                            <div class="btnListGo">
	                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
	                                    <button class="btn btn-primary me-md-2" type="button" onclick="location.href='http://localhost:8080/logus/manager/updateboardform?boardCategory=${boarddetail.boardCategory}&boardCode=${boarddetail.boardCode}'">수정하기</button>
	                                    <button class="btn btn-primary" type="button" onclick="location.href='http://localhost:8080/logus/manager/deleteboard?boardCategory=${boarddetail.boardCategory}&boardCode=${boarddetail.boardCode}'">삭제하기</button>
	                                  </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>

    </body>
</html>