<%@ include file="../header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Log Us</title>
 		<style type="text/css">
			#container{
				width : 800px;
				margin : 20px auto;
				background-color: #f7f7f7;
			}
			.title{
				margin : 40px auto;
				text-align : center;
			}
			.title2{
				margin : 40px auto;
			}
		</style>
	</head>
	<body>
		<div class="border border-success p-2 mb-2" id="container" >
			<form action="<c:url value='/memberLogin'/>" method="post" class="form-floating">
				<div class="title">
					<h1>Longin</h1>
				</div>
				<div class="title2">
					<div>
						<div class="form-floating mb-3">
							<input type="text" name="memberId" id="memberId" class="form-control" id="floatingInput" placeholder="name@example.com" required>
							<label for="floatingInput">ID</label>
						</div>
						<div class="form-floating">
							<input type="password" name="memberPassword" id="memberPassword" class="form-control" id="floatingPassword" placeholder="Password" required>
							<label for="floatingPassword">Password</label>
						</div>
					</div>
					<div>
						<div>
							<input type="hidden" name="message" id="message" value="${message}">
						</div>
					</div>
				</div>
				<div>
					<div class="d-grid gap-2 d-md-block">
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary"  onclick="location.href='<c:url value='idModal'/>'" data-bs-toggle="modal" data-bs-target="#exampleModal">
						 	아이디 찾기
						</button>
						<button type="button" class="btn btn-primary"   onclick="location.href='<c:url value='idModal'/>'"data-bs-toggle="modal" data-bs-target="#exampleModal">
						 	비밀번호 찾기
						</button>
						<button class="btn btn-primary" type="submit" onclick="memberLogin()">Longin</button>
						<button class="btn btn-primary" type="reset" onclick="location.href='<c:url value='index'/>'">Home</button>
						<button class="btn btn-primary" type="reset" onclick="location.href='<c:url value='/insertform'/>'">Sign Up</button>
					</div>
				</div>
			</form>
			
			<form action="<c:url value='/memberLogin'/>" method="post" class="form-floating">
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				Launch static backdrop modal
				</button>
					
				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
				    	<div class="modal-content">
					    	<div class="modal-header">
					        	<h1 class="modal-title fs-5" id="staticBackdropLabel">아이디 찾기</h1>
					        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      	</div>
					    <div class="modal-body">
					    	<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">이름</span>
								<input type="text" name="memberName" id="memberName" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" pattern="[A-Za-z0-9가-힣]+" required>
							</div>
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">생년월일</span>
								<input type="date" name=memberBirth id="memberBirth" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
							</div>
							<div class="input-group mb-3">
								<input type="hidden" name = hiddenPhone id=hiddenPhone value="false">
								<span class="input-group-text" id="inputGroup-sizing-default">전화번호</span>
								<input type="text" name="memberPhone" id="memberPhone" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"  pattern="\d{3}-\d{3,4}-\d{4}" required>
						 	</div>	
						</div>
					      	<div class="modal-footer">
					      		<button type="button" class="btn btn-primary">확인</button>
					        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					      	</div>
					  	</div>
					</div>
				</div>
			</form>
		</div>
	</body>
	<script type="text/javascript">
	var alert_message = $('#message').val();
	if(alert_message != ""){
		alert(alert_message);
	}
	
	function memberLogin(){
		
		var id =  $('#memberId').val();
		var pw =  $('#memberPassword').val();
		var message = $('#message').val();
		
		if (id == "" || pw == ""){
			alert("아이디와 비밀번호를 입력하세요");
		} else{
			//alert(message);
		}

	}
	
	const myModal = document.getElementById('myModal')
	const myInput = document.getElementById('myInput')

	myModal.addEventListener('shown.bs.modal', () => {
	  myInput.focus()
	})
	

			
		
				
		
	</script>
</html>