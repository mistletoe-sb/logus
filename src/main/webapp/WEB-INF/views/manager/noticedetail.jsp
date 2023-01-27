<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>공지사항 글보기</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>

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
                                                            공지사항 제목
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">작성자</th>
                                                    <td>
                                                        <div class="box01">관리자 닉네임</div>
                                                    </td>
                                                    <th scope="row">등록일</th>
                                                    <td>
                                                        <div class="box01">게시글 등록 날짜</div>
                                                    </td>
                                                </tr>
                                    </table>
                                </div><!--//tableWrap -->
                                        <div class="listView">
                                            <div class="viewTxt">공지사항 본문</div>
                                        </div>
                                <div class="btnListGo">
                                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                        <button class="btn btn-primary me-md-2" type="button">수정하기</button>
                                        <button class="btn btn-primary" type="button">삭제하기</button>
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