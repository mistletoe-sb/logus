<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<html lang="ko">
    <head>
    </head>
<body>
	<p>팔로우 리스트</p>
		<div>
		<div class="row row-cols-1 row-cols-md-4 g-4">
			<c:forEach var="List" items="${followList}" varStatus="stat" >	
				  <div class="col">
				    <div class="card">
				    	 <img class="card-img-top" alt="..." id="preview-image" class="rounded-4" src="${root}/resources/images/member/${followImg[stat.index].memberProfile}">
				      <h4>${followImg[stat.index].memberPhone}</h4>
				      <div class="card-body">
				        <h5 class="card-title">${List.followingMemberId}${memberNickname}</h5>
				       
				         <a href="<c:url value='/library/${followImg[stat.index].memberNickname}'/>" class="btn btn-success">서재 가기</a>
				      	 <a href="<c:url value="/deleteFollow/${List.followCode}"/>" class="btn btn-primary">팔로우취소</a>
				      </div>
				    </div>
				  </div>
			</c:forEach>
		</div>
		</div>
		
		<form action='<c:url value="/followinsert"/>' method="post">	
			<div class="mb-3 row">
    			<label for="staticEmail" class="col-sm-2 col-form-label">Id 입력</label>
    		<div class="col-sm-10">
     	 		<input type="text" class="form-control-plaintext" id="staticEmail" name="followingMemberId">
  			</div>
    		</div>
			<div class="/followList" >
				<button type="submit">팔로우</button>
			</div>
  		</form>
	</body>
	

	
</html>

