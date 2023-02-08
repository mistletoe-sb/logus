<%@page isELIgnored="false" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../include.jsp" %>
		<script src="<c:url value='/resources/js/routinefix.js'/>"></script>
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
		<form id="routineupdate" name="routineform" action="<c:url value='/routinefix'/>" method="post">
		<div class="p-3 bg-info bg-opacity-10 border border-dark rounded">
		<button type="button" class="btn btn-outline-primary btn-sm" disabled>태그를 등록해주세요</button>
				<input type="text" id="tags" name="tagNames" size="100" onkeydown="splitTag(event)"
				value="${tags}">
				<br>
			<select class="form-select" aria-label="Default select example" name="active">
				  <option <c:if test="${routine.dailyroutineActive eq '0'}">selected</c:if>>일반 일정</option>
				  <option <c:if test="${routine.dailyroutineActive eq '1'}">selected</c:if>>메인 일정</option>
			</select>
			<select class="form-select" aria-label="Default select example" name="week">
				  <option <c:if test="${routine.dailyroutineWeekopt eq '1'}">selected</c:if>>평일</option>
				  <option <c:if test="${routine.dailyroutineWeekopt eq '2'}">selected</c:if>>주말</option>
			</select>
				<div class="form-floating">
					  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea1" name="title" required>${routine.dailyroutineTitle}</textarea>
					  <label for="floatingTextarea">일정 제목을 작성해주세요</label>
				</div>
		</div>
				<div id="routine" style="margin-top: 20px;">
				<c:forEach items="${checklist}" var="checklist" varStatus="status">
					<div id="t${status.index}">
						<div class="p-3 bg-info bg-opacity-10 border border-info rounded">
							<p>시작 시간 : <input type="time" name="begin" required value="${checklist.dailycheckBegintime}"></p>
							<input type="hidden" name="dailycheckCode" value="${checklist.dailycheckCode}"/>
							<p>종료 시간 : <input type="time" name="end" required value="${checklist.dailycheckEndtime}"></p>
								<div class="form-floating">
									  <textarea class="form-control" placeholder="Leave a comment here" 
									  id="floatingTextarea2" name="content" required >${checklist.dailycheckContent}</textarea>
									  <label for="floatingTextarea">일정 내용을 작성해주세요</label>
								</div>
							</div>
						</div>				
						<input type="hidden" name="checkindex" value="${status.index}" <c:if test="${status.last}">id="index"</c:if>></input>	
				</c:forEach>
					</div>
				<div>	
					<button type="button" class="btn btn-primary"  onclick="add_textbox()">추가</button>
					<button type="button" class="btn btn-primary" onclick='remove()'>삭제</button>
				</div>
				<div class="d-grid gap-2 col-6 mx-auto">
	 				<button class="btn btn-primary" type="submit">수정 결과 저장하기</button>
				</div>
				<input  type="hidden" id="dailyroutineCode" name="dailyroutineCode" value="${dailyroutineCode}"></input>
					<c:forEach var="tg" items="${taglist}">
						<input type="hidden" name="tagCodes" value="${tg.tagCode}">
					</c:forEach>
				</form>
				</div>
	</body>
</html>