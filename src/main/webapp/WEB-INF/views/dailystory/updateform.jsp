<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../include.jsp" %>
	</head>
	<body>
		<%@ include file="../header_body.jsp" %>
		<p>일일 스토리 수정 폼</p>
		<br>
		<form action="<c:url value='/${sessionScope.memberNickname}/library/story/update'/>" method="post" enctype="multipart/form-data">
			<p>작성자 : ${dsVO.memberNickname}</p>
			<p><fmt:formatDate value="${dsVO.dailystoryUploaddate}" pattern="yyyy.MM.dd HH:mm"/></p>
			<label>제목 </label>
			<input type="text" name="dailystoryTitle" value="${dsVO.dailystoryTitle}">
			<br>
			<label>내용 </label>
			<textarea name="dailystoryContent" cols="50" rows="10">${dsVO.dailystoryContent}</textarea>
			<br>
			<label>썸네일 </label>
			<input type="file" name="thumbnail" onchange="setPreview(event)"><br>
			<c:choose>
				<c:when test='${(dsVO.dailystoryImage != null) && (dsVO.dailystoryImage != "")}'>
					<img id="preview_thumbnail_img" src="<c:url value='/resources/images/dailystory/${dsVO.dailystoryImage}'/>" alt="${dsVO.dailystoryImage}"
						 width="200" height="200">				  	
				</c:when>
				<c:otherwise>
					<img id="preview_thumbnail_img" src="<c:url value='/resources/images/preview_image.jpg'/>" alt="preview_thumbnail_img"
						 width="200" height="200">				  	
				</c:otherwise>
			</c:choose>
			<input type="hidden" name="dailystoryImage" value="${dsVO.dailystoryImage}">
			<br>
			<label>태그 </label>
			<input type="text" id="tags" name="tagNames" value="${tags}" size="100" onkeydown="splitTag(event)">
			<br><br>
			<input type="submit" value="저장">
			<input type="reset" value="취소" onclick="history.back()">
			
			<input type="hidden" name="dailystoryCode" value="${dsVO.dailystoryCode}">
			<c:forEach var="tg" items="${tagList}">
				<input type="hidden" name="tagCodes" value="${tg.tagCode}">
			</c:forEach>
		</form>
	</body>
</html>