<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ko">
    <head>
	<%@ include file="../include.jsp" %>
    <style>
    .container{
				width : 1200px;
				margin : 20px auto;
				background-color: #f7f7f7;
				
			}
	.title{
            margin : 40px auto;
            text-align : center;
         }
    #preview-image {
		  height: 400px;
		  object-fit: cover;
		}
	#btn_follow_custom {
		padding: 3px 12px 3px 12px;
		margin-bottom: 4px;
	}
    </style>
    
    <script type="text/javascript">
    function on_submit_ck(){
  		followId =$('#followId').val();
  		console.log(followId)
  		var result2 =false;
				
  		 $.ajax({
 			url : './followinsert/check', 		//Controller에서 요청 받을 주소
 			type : 'post', 		//POST 방식으로 전달
 			async:false,
 			data : {followId : followId},
 			success: function(result){ 		//데이터 주고받기 성공했을 경우 실행할 결과
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
<%@ include file="../header_body.jsp" %>
<div class="container">
	<h1 class="title">팔로우 리스트</h1>
		<form action='<c:url value="/followinsert"/>' method="post" onsubmit="return on_submit_ck();">	
			<div class="mb-3 row">
    			
    		<div class="col-sm-10">
     	 		<label for="staticEmail">팔로우 추가</label>
    			<input type="text" id="followId" name="followingMemberId">
     	 		<button type="submit" id="btn_follow_custom" class="btn btn-primary">팔로우</button> <!-- 버튼 타입은 submit이어야함 -->
  			</div>
    		</div>
			<div class="/followList" >
				
			</div>
  		</form>
		<div>
		<div class="row row-cols-1 row-cols-md-4 g-4">
			<c:forEach var="List" items="${followList}" varStatus="stat" >	
				  <div class="col">
				    <div class="card">
				    	 <img class="card-img-top" alt="no image" id="preview-image" class="rounded-4" src="<c:url value='/resources/images/member/${followImg[stat.index].memberProfile}'/>">
				      <div class="card-body">
				        <h5 class="card-title">${followImg[stat.index].memberNickname}(${List.followingMemberId})</h5>			       
				         <a href="<c:url value='/${followImg[stat.index].memberNickname}/library'/>" class="btn btn-success">서재 가기</a>
				      	 <a href="<c:url value='/deleteFollow/${List.followCode}'/>" class="btn btn-primary">팔로우취소</a>
				      </div>
				    </div>
				  </div>
			</c:forEach>
		</div>
		</div>
  		</div>
	</body>
</html>

