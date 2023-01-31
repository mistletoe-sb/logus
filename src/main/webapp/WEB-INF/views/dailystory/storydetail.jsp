<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

		<p>일일 스토리 보기</p>
		<p>작성자 : ${dsVO.memberNickname}</p>
		<p><fmt:formatDate value="${dsVO.dailystoryUploaddate}" pattern="yyyy.MM.dd HH:mm"/></p>
		<br>
		<c:if test="${dsVO.memberNickname == sessionScope.user}">
			<a href="<c:url value='/${sessionScope.user}/library/story/${dsVO.dailystoryCode}/update'/>">수정</a>
			<a href="<c:url value='/${sessionScope.user}/library/story/${dsVO.dailystoryCode}/delete'/>">삭제</a>
		</c:if>
		<br>
		<p>${dsVO.dailystoryTitle}</p>
		<br>
		<p>${dsVO.dailystoryContent}</p>
		<br>
		<img src="${root}/resources/images/${dsVO.dailystoryImage}" alt="${dsVO.dailystoryImage}">
		<input type="text" name="dailystoryImage">
		<br><br>
		<table>
		<c:choose>
			<c:when test="${fn:length(rpList) == 0}">
				<tr><td>댓글이 없습니다.</td></tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="rp" items="${rpList}">
					<tr>
						<td>${rp.memberNickname}</td>
						<td>${rp.replyContent}</td>
						<td>		
							<fmt:formatDate value="${rp.replyDate}" pattern="yyyy.MM.dd HH:mm"/>
						</td>
						<td>
							<c:if test="${rp.memberNickname == sessionScope.user}">
								<a href="<c:url value='/reply/update/${rp.replyCode}'/>">수정</a>
								<a href="<c:url value='/reply/delete/${rp.replyCode}'/>">삭제</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
		<details>
		    <summary>댓글 작성</summary>
		    <form action="<c:url value='/reply/insert'/>" method="post">
		    	<textarea name="replyContent" cols="200" rows="5"></textarea>
		    	<input type="hidden" name="memberNickname" value="${sessionScope.user}">
		    	<input type="hidden" name="dailystoryCode" value="${dsVO.dailystoryCode}">
		    </form>
		</details>
		<br>
		<a href="<c:url value='/${dsVO.memberNickname}/library/main'/>">목록보기</a>
	</body>
</html>