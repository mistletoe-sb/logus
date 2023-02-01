<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

		<p>일일 스토리 보기</p>
		<p>작성자 : ${dsVO.memberNickname}</p>
		<p><fmt:formatDate value="${dsVO.dailystoryUploaddate}" pattern="yyyy.MM.dd HH:mm"/></p>
		<br>
		<c:if test="${dsVO.memberNickname == sessionScope.memberNickname}">
			<button onclick='location.href="<c:url value='/${sessionScope.memberNickname}/library/story/${dsVO.dailystoryCode}/update'/>"'>수정</button>
			<button onclick='location.href="<c:url value='/${sessionScope.memberNickname}/library/story/${dsVO.dailystoryCode}/delete'/>"'>삭제</button>
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
			    	<input type="hidden" name="dailystoryCode" value="${dsVO.dailystoryCode}">
			    	<input type="submit" value="작성">
			    	<input type="reset" id="reply_ins_reset_btn" value="취소" onclick="insertReply(this)">
			</form>
		</div>
		<br>
		<a href="<c:url value='/${dsVO.memberNickname}/library/main'/>">목록보기</a>
		
		<script>
			// 댓글 작성 버튼 & 취소 function
			function insertReply(btn){
				// 현재 요소가 '댓글 작성' 버튼인 경우
				if(btn.id == 'reply_ins_btn'){
					$('#form_reply_ins').attr("hidden", false);	// 폼 표시
					$(btn).attr("hidden", true);				// 버튼 숨기기
				} else if(btn.id == 'reply_ins_reset_btn'){		// 현재 요소가 '취소' 버튼인 경우
					$('#reply_ins_btn').attr("hidden", false);	// '댓글 작성' 버튼 표시
					$('#form_reply_ins').attr("hidden", true);	// 폼 숨기기
				}
			}
		
			// 댓글 수정 & 취소 function
			function updateReply(btn){
				// 현재 요소가 '수정' 버튼인 경우
				if(btn.className == 'reply_p'){
					$(btn).parents('.reply_div').nextAll('.form_reply_upd').attr("hidden", false);	// 폼 표시
					$(btn).parents('.reply_upd').prevAll('.reply_before_upd').attr("hidden", true);	// 텍스트(기존 댓글) 숨기기
					$(btn).parents('.reply_div').attr("hidden", true);								// 버튼 숨기기
					//$('.form_reply_upd').attr("hidden", false);		// 폼 표시
					//$('.reply_before_upd').attr("hidden", true);	// 텍스트(기존 댓글) 숨기기
					//$('.reply_div').attr("hidden", true);			// 버튼 숨기기
				} else if(btn.className == 'reply_upd_reset_btn'){	// 현재 요소가 '취소' 버튼인 경우
					$(btn).parents('.form_reply_upd').prevAll('.reply_div').attr("hidden", false);	// 버튼 표시
					$(btn).parents('.reply_upd').prevAll('.reply_before_upd').attr("hidden", false);// 텍스트(기존 댓글) 표시
					$(btn).parents('.form_reply_upd').attr("hidden", true);							// 폼 숨기기
					//$('.reply_div').attr("hidden", false);			// 버튼 표시
					//$('.reply_before_upd').attr("hidden", false);	// 텍스트(기존 댓글) 표시
					//$('.form_reply_upd').attr("hidden", true);		// 폼 숨기기
				}
			}
			
			// 댓글 삭제 function
			function deleteReply(url){
				var del_check = confirm('댓글을 삭제하시겠습니까?');	// 확인 창 팝업
				if(del_check){
					return location.href=url;	// 확인 버튼 누를 시 해당 url로 이동(댓글 삭제 진행)
				} else {}
			}
		</script>
	</body>
</html>