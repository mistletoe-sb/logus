<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

		<p>일일 스토리 수정 폼</p>
		<br>
		<form action="<c:url value='/${sessionScope.user}/library/story/update'/>" method="post" enctype="multipart/form-data">
			<p>작성자 : ${dsVO.memberNickname}</p>
			<p><fmt:formatDate value="${dsVO.dailystoryUploaddate}" pattern="yyyy.MM.dd HH:mm"/></p>
			<label>제목 </label>
			<input type="text" name="dailystoryTitle" value="${dsVO.dailystoryTitle}">
			<br>
			<label>내용 </label>
			<textarea name="dailystoryContent" cols="50" rows="10">${dsVO.dailystoryContent}</textarea>
			<br>
			<label>썸네일 </label>
			<input type="text" name="dailystoryImage" value="${dsVO.dailystoryImage}">
			<br><br>
			<input type="submit" value="저장">
			<input type="reset" value="취소" onclick="history.back()">
			
			<input type="hidden" name="dailystoryCode" value="${dsVO.dailystoryCode}">
		</form>
	</body>
</html>