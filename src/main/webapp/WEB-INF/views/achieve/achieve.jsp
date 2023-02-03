<%@ include file="../header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>출석체크</title>
		<script type="text/javascript">
		var today;
		 $(function(){
		var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);
	    
	  	$('#today').val(year+month+day);
	  	//ajax로 해당 날짜에 이미 출석했는지 확인하고 버튼 비활성화
	});
		 
		  	function on_submit_check(){
		  		today =$('#today').val();
		  		console.log(today);
		  		var result2 = false;
		  		var i=parseInt($("#index").val());
		  		var j=0;
 					
		  		 $.ajax({
		 			url : './achieve/check', //Controller에서 요청 받을 주소
		 			type : 'post', //POST 방식으로 전달
		 			data : {today : today},
		 			success: function(result){ //데이터 주고받기 성공했을 경우 실행할 결과
		 				if(result==0){
		 			    		alert("출석체크가 완료되었습니다.");
								result2 = true
		 			    	} else {
		 			    		alert("오늘은 이미 출석체크를 하셨습니다.");
		 			    		result2 = false
		 			    		 	}
		 			    		}
		 					})
		 					console.log(result2);
		 					return result2
			 }
		</script>
		
	</head>
	<body>
	<h1>${routine.dailyroutineTitle}</h1>
<%--&nbsp; (table-sm 넣으면 테이블 패딩 줄어듬->작아짐) --%>
			<form id="achieve" name="achieveform" action="<c:url value='/achieve/save'/>" method="post" onsubmit="return on_submit_check();">
			<input type="hidden" name="today" id="today">
			<table class="table table-bordered table-group-divider">
		  <thead>
		    <tr>
		      <th scope="col">시간</th>
		      <th scope="col">일정 내용</th>
		      <th scope="col">달성율</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach items="${checklist}" var="checklist" varStatus="status">
		    <tr>
		      <td>${checklist.dailycheckBegintime} ~ ${checklist.dailycheckEndtime}</td>
		      <td>${checklist.dailycheckContent}</td>
		      <td id="rate${status.index}">
			      <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="achieverate">
					  <option value="0" selected>0%</option>
					  <option value="10">10%</option>
					  <option value="20">20%</option>
					  <option value="30">30%</option>
					  <option value="40">40%</option>
					  <option value="50">50%</option>
					  <option value="60">60%</option>
					  <option value="70">70%</option>
					  <option value="80">80%</option>
					  <option value="90">90%</option>
					  <option value="100">100%</option>
				  </select>
		      </td>
		    </tr>
		    <input type="hidden" name="checkindex" value="${status.index}" <c:if test="${status.last}">id="index"</c:if>></input>
		      </c:forEach>
		 </tbody>
		</table>
		<div class="d-grid gap-2 col-6 mx-auto">
		<input class="btn btn-primary" type="submit" value="Submit" id="submit">
		</div>
		 </form>
	</body>
</html>