<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../include.jsp" %>
	</head>
	<body>
		<%@ include file="../header_body.jsp" %>
		<p>일일 스토리 보기</p>
		<p>작성자 : ${dsVO.memberNickname}</p>
		<p><fmt:formatDate value="${dsVO.dailystoryUploaddate}" pattern="yyyy.MM.dd HH:mm"/></p>
		<br>
		<c:if test="${dsVO.memberNickname == sessionScope.memberNickname}">
			<button onclick='location.href="<c:url value='/${sessionScope.memberNickname}/library/story/${dsVO.dailystoryCode}/update'/>"'>수정</button>
			<button id="ds_del_btn" onclick="deleteStory('<c:url 
					value="/${sessionScope.memberNickname}/library/main"/>')">삭제</button>
		</c:if>
		<br>
		<p>${dsVO.dailystoryTitle}</p>
		<br>
		<p style="white-space: pre-line;">${dsVO.dailystoryContent}</p>
		<br>
		<img id="thumbnail_img" src="<c:url value='/resources/images/dailystory/${dsVO.dailystoryImage}'/>" alt="${dsVO.dailystoryImage}"
			 width="200" height="200">
		<div>
			<c:forEach var="tg" items="${tagList}">
				<button style="display: inline-block">${tg.tagName}</button>
			</c:forEach>
		</div>
		<br><br>
		<table>
		<c:choose>
			<c:when test="${fn:length(rpList) == 0}">
				<tr><td>댓글이 없습니다.</td></tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="rp" items="${rpList}">
					<tr class="reply_tr">
						<td>${rp.memberNickname}</td>
						<td class="reply_before_upd">
							${rp.replyContent}
						</td>
						<td>		
							<fmt:formatDate value="${rp.replyDate}" pattern="yyyy.MM.dd HH:mm"/>
						</td>
						<td class="reply_upd">
							<c:if test="${rp.memberNickname == sessionScope.memberNickname}">
								<div class="reply_div">
									<p class="reply_p" onclick="updateReply(this)">수정</p>
									<p class="reply_p" onclick="return deleteReply('<c:url 
									value="/${dsVO.memberNickname}/${dsVO.dailystoryCode}/reply/delete/${rp.replyCode}"/>')">삭제</p>
								</div>
								<div class="form_reply_upd" hidden="true">
									<form action="<c:url value='/${dsVO.memberNickname}/${dsVO.dailystoryCode}/reply/update/${rp.replyCode}'/>"
									  	  method="post">
								    	<textarea name="replyContent" cols="200" rows="5">${rp.replyContent}</textarea>
								    	<input type="hidden" name="memberNickname" value="${sessionScope.memberNickname}">
								    	<input type="submit" value="작성">
								    	<input type="reset" class="reply_upd_reset_btn" value="취소" onclick="updateReply(this)">
									</form>
								</div>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
		<button id="reply_ins_btn" onclick="insertReply(this)">댓글 작성</button>
		<div id="form_reply_ins" hidden="true">
			<form action="<c:url value='/${dsVO.memberNickname}/reply/insert'/>" method="post">
			    	<textarea name="replyContent" cols="200" rows="5"></textarea>
			    	<input type="hidden" name="memberNickname" value="${sessionScope.memberNickname}">
			    	<input type="hidden" id="dsCode_forD" name="dailystoryCode" value="${dsVO.dailystoryCode}">
			    	<input type="submit" value="작성">
			    	<input type="reset" id="reply_ins_reset_btn" value="취소" onclick="insertReply(this)">
			</form>
		</div>
		<br>
		<a href="<c:url value='/${dsVO.memberNickname}/library/main'/>">목록보기</a>
		<input type="hidden" id="tagCount" value="${fn:length(tagList)}">
		<input type="hidden" id="replyCount" value="${fn:length(rpList)}">
	</body>
</html>