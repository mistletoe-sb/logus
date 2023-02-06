<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../include.jsp" %>
	</head>
	<body>
		<%@ include file="../header_body.jsp" %>
		<p>일일 스토리 작성 폼</p>
		<br>
		<form action="<c:url value='/${sessionScope.memberNickname}/library/story/insert'/>" method="post" enctype="multipart/form-data">
			<label>제목 </label>
			<input type="text" name="dailystoryTitle">
			<br>
			<label>내용 </label>
			<textarea name="dailystoryContent" cols="50" rows="10"></textarea>
			<br>
			<label>썸네일 </label>
			<input type="file" name="thumbnail" onchange="setPreview(event)"><br>
			<img id="preview_thumbnail_img" src="<c:url value='/resources/images/preview_image.png'/>" alt="preview_thumbnail_img"
				 width="200" height="200">
			<br>
			<label>태그 </label>
			<input type="text" id="tags" name="tagNames" size="100" onkeydown="splitTag(event)">
			<br><br>
			<input type="submit" value="저장">
			<input type="reset" value="취소" onclick="history.back()">
			
			<input type="hidden" name="memberNickname" value="${sessionScope.memberNickname}">
		</form>
	</body>
</html>