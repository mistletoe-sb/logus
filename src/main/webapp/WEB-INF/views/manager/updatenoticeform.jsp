<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>공지사항 글수정</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <h1>공지사항</h1>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">제목</label>
            <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력하세요">
        </div>
        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">본문</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="본문을 입력하세요"></textarea>
        </div>
        <div class="d-grid gap-2 col-1 mx-auto">
            <button class="btn btn-primary" type="button">수정하기</button>
        </div>
    </body>
</html>