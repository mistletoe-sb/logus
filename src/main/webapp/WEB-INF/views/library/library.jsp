<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>서재</title>
		<script type="text/javascript">
			const myModal = document.getElementById('myModal')
			const myInput = document.getElementById('myInput')
		
			myModal.addEventListener('shown.bs.modal', () => {
		  		myInput.focus()
			})
		</script>
		<script type="text/javascript">
		
		</script>
	</head>
<body>

<!-- Modal1(평일) -->
<div class="modal fade" id="modal1" tabindex="-1" aria-labelledby="modal1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">	<!-- Scrollable modal -->
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">${routine1.dailyroutineTitle}</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
     	<c:forEach items="${checklist1}" var="checklist1" varStatus="status">
     	${checklist1.dailycheckBegintime}
     	</c:forEach>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <form id="routineshare1" name="routineshare1form" action="<c:url value='/routineshare'/>" method="post">
        <input type="hidden" value="${routine1.dailyroutineCode}" name="dailyroutineCode">
        <input type="hidden" value="${routine1.memberNickname}" name="memberNickname">
        <button type="submit" class="btn btn-primary">공유 받기</button>
      	</form>
      </div>
    </div>
  </div>
</div>

<!-- Modal2(주말2) -->
<div class="modal fade" id="modal2" tabindex="-1" aria-labelledby="modal2" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">	<!-- Scrollable modal -->
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">${routine2.dailyroutineTitle}</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      주말입니당
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <form id="routineshare2" name="routineshare2form" action="<c:url value='/routineshare2'/>" method="post">
        <input type="hidden" value="${routine2.memberNickname}" name="memberNickname2">
        <input type="hidden" value="${routine2.dailyroutineCode}" name="dailyroutineCode2">
        <button type="submit" class="btn btn-primary" >공유 받기</button>
      	</form>
      </div>
    </div>
  </div>
</div>

<!--오프캔버스(서재 정보 사이드 바)-->
<button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions">서재 정보 보기</button>
	<c:if test="${memberVO.memberNickname eq sessionUser}">
		<button type="button" class="btn btn-outline-secondary" onclick="location.href='<c:url value='/routinelist'/>'">루틴 리스트 더보기</button>
	</c:if>
<div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
  <div class="offcanvas-header">
    <h3 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">서재 정보</h3>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
<!--     <img src="..." class="card-img-top" alt="..."> -->
    <p>jstl c:if로 세션 감지해서 내서재면 팔로우버튼 아예 없음, 남서재면 팔로우하기&팔로우취소</p>
    <dl class="row">
	  <dt class="col-sm-3">닉네임</dt>
	  	<dd class="col-sm-9">${memberVO.memberNickname}</dd>
	
	  <dt class="col-sm-3">직업</dt>
	  	<dd class="col-sm-9"><p>${memberVO.memberJob}</p></dd>
	
	  <dt class="col-sm-3">가입일</dt>
	  	<dd class="col-sm-9">${memberVO.memberIndate}</dd>
	
	  <dt class="col-sm-6">일주일 루틴 달성률</dt>
	    <dd class="col-sm-4">${weekAchieve}%</dd>
	   
	  <dt class="col-sm-6">오늘의 루틴 달성률</dt>
	    <dd class="col-sm-4">${todayAchieve}%</dd>
	</dl>
    <input type='button' value='팔로우하기' id='followbtn1'/>
	<input type='button' value='팔로우 취소' id='followbtn2' style="display : none"/>
  </div>
</div>

  <div>
   <div class="d-inline-block">
	 <div class="row row-cols-1 row-cols-md-2 g-4">
	  
	  <c:choose>
	  <c:when test="${empty routine1}"><div class="col">
	    <div class="card">
	      <div class="card-body">
	      <h3 class="card-title">평일 루틴</h3>
	        <h5 class="card-text">현재 등록된 루틴이 없습니다</h5>
	      </div>
	    </div>
	   </div></c:when>
	  <c:otherwise>
		  <div class="col">
		    <div class="card">
		      <div class="card-body">
		      <h3 class="card-title">평일 루틴</h3>
		        <h5 class="card-text">${routine1.dailyroutineTitle}</h5>
		        <p class="card-text">태그 위치입니다</p>
		      	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal1">
		  			평일 확인
				</button>
		      </div>
		    </div>
		  </div>
	   </c:otherwise>
	</c:choose>
	
	  <c:choose>
	  <c:when test="${empty routine2}"><div class="col">
	    <div class="card">
	      <div class="card-body">
	      <h3 class="card-title">주말 루틴</h3>
	        <h5 class="card-text">현재 등록된 루틴이 없습니다</h5>
	        <p class="card-text"></p>
	      </div>
	    </div>
	  </div></c:when>
	  <c:otherwise>
	  <div class="col">
	    <div class="card">
	      <div class="card-body">
	      <h3 class="card-title">주말 루틴</h3>
	        <h5 class="card-text">${routine2.dailyroutineTitle}</h5>
	        <p class="card-text">태그 위치 입니다</p>
	      	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal2">
	  			주말 확인
			</button>
	      </div>
	    </div>
	  </div>
	  </c:otherwise>
	</c:choose>
	
	</div>  
  </div>
  
 </div>
 <div>
 	<a href="<c:url value='/${sessionScope.memberNickname}/library/main'/>">일일 스토리 보기</a>
 </div>
</body>
</html>