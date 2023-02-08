<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../include.jsp" %>
		<script src="<c:url value='/resources/js/newroutine.js'/>"></script>
		<meta charset="UTF-8">
		<title>새 루틴</title>
		<style>
	.form-select{ 
	display: inline-block;
	}
	p {
	display: inline-block
	} 
	
		</style>
	</head>
	<body>
		<%@ include file="../header_body.jsp" %>
		<div class="d-grid gap-2 col-7 mx-auto border-info " style="margin-top: 20px;">
		<form id="routinenew" name="routineform" action="<c:url value='/newroutine'/>" method="post">
		<div class="p-3 bg-info bg-opacity-10 border border-dark rounded">
			<button type="button" class="btn btn-outline-primary btn-sm" disabled>태그를 등록해주세요</button>
				<input type="text" id="tags" name="tagNames" size="100" onkeydown="splitTag(event)">
				<br>
			<select class="form-select" aria-label="Default select example" name="active" style="width: 380px;">
				  <option selected >일반 일정으로 등록</option>
				  <option >메인 일정으로 등록</option>
			</select>
			<select class="form-select" aria-label="Default select example" name="week" style="width: 380px;margin-left: 13px;">
				  <option selected>평일</option>
				  <option >주말</option>
			</select>
				<div class="form-floating">
					  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea1" name="title" required></textarea>
					  <label for="floatingTextarea">일정 제목을 작성해주세요</label>
				</div>
		</div>
				<div id="routine" style="margin-top: 20px;">
					<div id="t0">
						<div class="p-3 bg-info bg-opacity-10 border border-info rounded">
							<p>시작 시간 : <input type="time" name="begin" required></p>
							<p>종료 시간 : <input type="time" name="end" required></p>
								<div class="form-floating">
									  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" name="content" required></textarea>
									  <label for="floatingTextarea">일정 내용을 작성해주세요</label>
								</div>
							</div>
						</div>
					</div>
				<div>	
					<button type="button" class="btn btn-primary"  onclick="add_textbox()">추가</button>
					<button type="button" class="btn btn-primary" onclick='remove()'>삭제</button>
				</div>
				<div class="d-grid gap-2 col-6 mx-auto">
	 				<button class="btn btn-primary" type="submit">일정 생성 완료하기</button>
				</div>
				</form>
				</div>
		</body>
</html>