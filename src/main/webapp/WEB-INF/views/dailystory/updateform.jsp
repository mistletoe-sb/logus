<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="../include.jsp" %>
	</head>
	<body>
		<%@ include file="../header_body.jsp" %>
		<div class="sub_title_dailystory">
			<h2>일일 스토리 수정</h2>
		</div>
		<div class="border_dailystory_form_div">
			<form action="<c:url value='/${sessionScope.memberNickname}/library/story/update'/>" method="post" enctype="multipart/form-data">
				<table class="tb_dailystory">
					<tr>
						<th>
							<label>제목&nbsp;&nbsp;&nbsp;</label>
						</th>
						<td>
							<input type="text" name="dailystoryTitle" class="form-control" value="${dsVO.dailystoryTitle}" placeholder="제목을 입력하세요." required>
						</td>
					</tr>
					<tr>
						<th>
							<label>내용&nbsp;&nbsp;&nbsp;</label>
						</th>
						<td>
							<textarea name="dailystoryContent" class="form-control" cols="50" rows="10" placeholder="오늘의 스토리를 작성하세요." required>${dsVO.dailystoryContent}</textarea>
						</td>
					</tr>
					<tr>
						<th>
							<label>썸네일&nbsp;&nbsp;&nbsp;</label>
						</th>
						<td>
							<input type="file" name="thumbnail" class="form-control" onchange="setPreview(event)">
							<c:choose>
								<c:when test='${(dsVO.dailystoryImage != null) && (dsVO.dailystoryImage != "")}'>
									<img id="preview_thumbnail_img" src="<c:url value='/resources/images/dailystory/${dsVO.dailystoryImage}'/>" alt="${dsVO.dailystoryImage}"
										 width="240" height="160">				  	
								</c:when>
								<c:otherwise>
									<img id="preview_thumbnail_img" src="<c:url value='/resources/images/preview_image.png'/>" alt="preview_thumbnail_img"
										 width="240" height="160">				  	
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>
							<label>태그&nbsp;&nbsp;&nbsp;</label>
						</th>
						<td>
							<input type="text" id="tags" name="tagNames" value="${tags}" size="100" placeholder="태그를 작성한 후 스페이스 바를 누르면 자동으로 태그가 구분됩니다." onkeydown="splitTag(event)">
						</td>
					</tr>
				</table>
				<br><br>
				<div class="btn_form_dailystory_div">
					<input type="submit" class="btn btn-primary" value="저장">
					<input type="reset" class="btn btn-primary" value="취소" onclick="history.back()">
				</div>
				<input type="hidden" name="dailystoryImage" value="${dsVO.dailystoryImage}">
				<input type="hidden" name="dailystoryCode" value="${dsVO.dailystoryCode}">
				<c:forEach var="tg" items="${tagList}">
					<input type="hidden" name="tagCodes" value="${tg.tagCode}">
				</c:forEach>
			</form>
		</div>
	</body>
</html>