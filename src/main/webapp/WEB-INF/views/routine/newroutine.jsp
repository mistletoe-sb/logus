<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../include.jsp" %>
		<script src="<c:url value='/resources/js/newroutine.js'/>"></script>
		<meta charset="UTF-8">
		<title>새 루틴</title>
	</head>
	<body>
		<%@ include file="../header_body.jsp" %>
		<form id="routinenew" name="routineform" action="<c:url value='/newroutine'/>" method="post">
		<div class="p-3 bg-info bg-opacity-10 border border-dark border-start-0 rounded-end">
			<label>태그 등록</label>
				<input type="text" id="tags" name="tagNames" size="100" onkeydown="splitTag(event)">
				<br>
			<select class="form-select" aria-label="Default select example" name="active">
				  <option selected >일반 일정으로 등록</option>
				  <option >메인 일정으로 등록</option>
			</select>
			<select class="form-select" aria-label="Default select example" name="week">
				  <option selected>평일</option>
				  <option >주말</option>
			</select>
				<div class="form-floating">
					  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea1" name="title" required></textarea>
					  <label for="floatingTextarea">일정 제목을 작성해주세요</label>
				</div>
		</div>
				<div id="routine">
					<div id="t0">
						<div class="p-3 bg-info bg-opacity-10 border border-info border-start-0 rounded-end">
							<p>시작 시간 : <input type="time" name="begin" required>&nbsp;&nbsp;&nbsp;종료 시간 : <input type="time" name="end" required></p>
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
		</body>
</html>