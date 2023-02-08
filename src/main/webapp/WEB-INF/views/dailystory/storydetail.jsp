<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../include.jsp" %>
	</head>
	<body>
		<%@ include file="../header_body.jsp" %>
		<div class="sub_title_dailystory">
			<p style="display: inline-block; margin: 0px 48% 12px 0px;">작성자 : ${dsVO.memberNickname}</p>
			<p style="display: inline-block; margin: 0px 2% 12px 0px;"><fmt:formatDate value="${dsVO.dailystoryUploaddate}" pattern="yyyy.MM.dd HH:mm"/></p>
			<c:if test="${dsVO.memberNickname == sessionScope.memberNickname}">
				<button class="btn btn-primary" onclick='location.href="<c:url 
						value='/${sessionScope.memberNickname}/library/story/${dsVO.dailystoryCode}/update'/>"'>수정</button>
				<button id="ds_del_btn" class="btn btn-primary" onclick="deleteStory('<c:url 
						value="/${sessionScope.memberNickname}/library/dailystorylist"/>')">삭제</button>
			</c:if>
		</div>
		<div class="border_dailystory_form_div">
			<div>
				<table class="tb_dailystory">
					<tr>
						<td>
							<div class="img_box_class">
								<c:choose>
									<c:when test='${(dsVO.dailystoryImage != null) && (dsVO.dailystoryImage != "")}'>
										<img id="thumbnail_img" src="<c:url 
											 value='/resources/images/dailystory/${dsVO.dailystoryImage}'/>" alt="${dsVO.dailystoryImage}">				  	
									</c:when>
									<c:otherwise>
										<img id="thumbnail_img" src="<c:url 
											 value='/resources/images/preview_image.png'/>" alt="preview_thumbnail_img">				  	
									</c:otherwise>
								</c:choose>
							</div>
						</td>
					</tr>
					<tr>
						<td><h2>${dsVO.dailystoryTitle}</h2></td>
					</tr>
					<tr>
						<td><p style="white-space: pre-line;">${dsVO.dailystoryContent}</p></td>
					</tr>
					<tr>
						<td>
							<c:forEach var="tg" items="${tagList}">
								<button class="tag_block" style="display: inline-block">${tg.tagName}</button>
							</c:forEach>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<br>
		<div id="rep_container_div">
			<h6>댓글 > </h6>
			<table id="rep_table">
			<c:choose>
				<c:when test="${fn:length(rpList) == 0}">
					<tr><td>댓글이 없습니다.</td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="rp" items="${rpList}">
						<tr class="reply_tr">
							<td width="300">
								${rp.memberNickname}
								<br>
								<fmt:formatDate value="${rp.replyDate}" pattern="yyyy.MM.dd HH:mm"/>
							</td>
							<td class="reply_before_upd" width="500">
								${rp.replyContent}
							</td>
							<td class="reply_upd" width="200">
								<c:if test="${rp.memberNickname == sessionScope.memberNickname}">
									<div class="reply_div">
										<p class="reply_p" onclick="updateReply(this)">수정</p>&nbsp;
										<p class="reply_p" onclick="return deleteReply('<c:url 
										value="/${dsVO.memberNickname}/${dsVO.dailystoryCode}/reply/delete/${rp.replyCode}"/>')">삭제</p>
									</div>
									<div class="form_reply_upd" hidden="true">
										<form action="<c:url value='/${dsVO.memberNickname}/${dsVO.dailystoryCode}/reply/update/${rp.replyCode}'/>"
										  	  method="post">
									    	<textarea name="replyContent" class="rep_textarea">${rp.replyContent}</textarea>
									    	<input type="hidden" name="memberNickname" value="${sessionScope.memberNickname}">
									    	<input type="submit" class="btn btn-primary" value="작성">
									    	<div class="reply_upd_reset_btn" onclick="updateReply(this)" style="display: inline-block;">
									    		<input type="reset" class="btn btn-primary" value="취소">
									    	</div>
										</form>
									</div>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</table>
			<button id="reply_ins_btn" class="btn btn-primary" onclick="insertReply(this)">댓글 작성</button>
			<div id="form_reply_ins" hidden="true">
				<form action="<c:url value='/${dsVO.memberNickname}/reply/insert'/>" method="post">
				    	<textarea name="replyContent" class="rep_textarea"></textarea>
				    	<input type="hidden" name="memberNickname" value="${sessionScope.memberNickname}">
				    	<input type="hidden" id="dsCode_forD" name="dailystoryCode" value="${dsVO.dailystoryCode}">
				    	<input type="submit" class="btn btn-primary" value="작성">
				    	<input type="reset" id="reply_ins_reset_btn" class="btn btn-primary" value="취소" onclick="insertReply(this)">
				</form>
			</div>
			<br>
			<input type="hidden" id="tagCount" value="${fn:length(tagList)}">
			<input type="hidden" id="replyCount" value="${fn:length(rpList)}">
		</div>
	</body>
</html>