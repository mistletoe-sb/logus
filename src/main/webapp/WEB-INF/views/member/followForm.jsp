<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<html lang="ko">
    <head>
    <script type="text/javascript">
    function on_submit_ck(){
  		followId =$('#followId').val();
  		console.log(followId)
  		var result2 =false;
				
  		 $.ajax({
 			url : './followinsert/check', //Controller에서 요청 받을 주소
 			type : 'post', //POST 방식으로 전달
 			async:false,
 			data : {followId : followId},
 			success: function(result){ //데이터 주고받기 성공했을 경우 실행할 결과
 				console.log(result);
 				if(result==0){
 			    		alert("없는 ID입니다.");
 			    		result2 =false;
 			    	} else {
	 			    		
	 			    		result2=true;
 			    		  }
 						}
 					});
  		 		console.log(result2);
 			return result2;
	 }
    
    var isMessage = true;

    <c:if test="${!empty message}">
     if(isMessage){
    	 alert("${message}");
    	 isMessage = false;
     }
    </c:if>
</script>
    </head>
<body>
	<p>팔로우 리스트</p>
		<div>
		<div class="row row-cols-1 row-cols-md-4 g-4">
			<c:forEach var="List" items="${followList}" varStatus="stat" >	
				  <div class="col">
				    <div class="card">
				    	 <img class="card-img-top" alt="..." id="preview-image" class="rounded-4" src="${root}/resources/images/member/${followImg[stat.index].memberProfile}">
				      <div class="card-body">
				        <h5 class="card-title">${memberNickname}(${List.followingMemberId})</h5>			       
				         <a href="<c:url value='/library/${followImg[stat.index].memberNickname}'/>" class="btn btn-success">서재 가기</a>
				      	 <a href="<c:url value="/deleteFollow/${List.followCode}"/>" class="btn btn-primary">팔로우취소</a>
				      </div>
				    </div>
				  </div>
			</c:forEach>
		</div>
		</div>
		
		<form action='<c:url value="/followinsert"/>' method="post" onsubmit="return on_submit_ck();">	
			<div class="mb-3 row">
    			<label for="staticEmail" class="col-sm-2 col-form-label">Id 입력</label>
    		<div class="col-sm-10">
     	 		<input type="text" class="form-control-plaintext" id="followId" name="followingMemberId">
  			</div>
    		</div>
			<div class="/followList" >
				<button type="submit">팔로우</button>
			</div>
  		</form>
	</body>
	

	
</html>

