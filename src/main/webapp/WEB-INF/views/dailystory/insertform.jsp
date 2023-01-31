<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

		<p>일일 스토리 작성 폼</p>
		<br>
		<form action="<c:url value='/${sessionScope.user}/library/story/insert'/>" method="post" enctype="multipart/form-data">
			<label>제목 </label>
			<input type="text" name="dailystoryTitle">
			<br>
			<label>내용 </label>
			<textarea name="dailystoryContent" cols="50" rows="10"></textarea>
			<br>
			<label>썸네일 </label>
			<input type="text" name="dailystoryImage">
			<br><br>
			<input type="submit" value="저장">
			<input type="reset" value="취소" onclick="history.back()">
			
			<input type="hidden" name="memberNickname" value="${sessionScope.user}">
		</form>
	</body>
</html>