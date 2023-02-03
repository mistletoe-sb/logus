<%@ include file="../header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <button type="button" class="btn btn-primary">Save changes</button>
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
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<!--오프캔버스(서재 정보 사이드 바)-->
<button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions">서재 정보 보기</button>

<div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">Backdrop with scrolling</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <p>Try scrolling the rest of the page to see this option in action.</p>
    <p>jstl c:if로 세션 감지해서 내서재면 팔로우버튼 아예 없음, 남서재면 팔로우하기&팔로우취소</p>
    <dl class="row">
	  <dt class="col-sm-3">닉네임</dt>
	  	<dd class="col-sm-9">한량한냥</dd>
	
	  <dt class="col-sm-3">직업</dt>
	  	<dd class="col-sm-9"><p>백숩니다</p></dd>
	
	  <dt class="col-sm-3">가입일</dt>
	  	<dd class="col-sm-9">오늘이니?</dd>
	
	  <dt class="col-sm-6">일주일 루틴 달성률</dt>
	    <dd class="col-sm-4">${weekAchieve}%</dd>
	   
	  <dt class="col-sm-6">오늘의 루틴 달성률</dt>
	    <dd class="col-sm-4">${todayAchieve}%</dd>
	</dl>
    <input type='button' value='팔로우하기' id='followbtn1'/>
	<input type='button' value='팔로우 취소' id='followbtn2' style="display : none"/>
  </div>
</div>

<div><ul class="list-inline">
  <li class="list-inline-item">메인</li>
  <li class="list-inline-item">평일 메인</li>
  <li class="list-inline-item">주말 메인</li>
</ul></div>
  <div>
   <div class="d-inline-block">
	 <div class="row row-cols-1 row-cols-md-2 g-4">
	  <div class="col">
	    <div class="card">
	      <div class="card-body">
	        <h5 class="card-title">${routine1.dailyroutineTitle}</h5>
	        <p class="card-text">This is a longer card with supporting text below </p>
	      	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal1">
	  			평일 확인
			</button>
	      </div>
	    </div>
	  </div>
	  
	  <div class="col">
	    <div class="card">
	      <div class="card-body">
	        <h5 class="card-title">${routine2.dailyroutineTitle}</h5>
	        <p class="card-text">This is a longer card with supporting text below</p>
	      	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal2">
	  			주말 확인
			</button>
	      </div>
	    </div>
	  </div>
	</div>  
  </div>
  
 </div>
</body>
</html>