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
				<div>
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
				</div>
				<div>
					<div>
						<div class="d-grid gap-2 d-md-block">
							<button class="btn btn-primary" type="submit" onclick="memberLogin()">Longin</button>
							<button class="btn btn-primary" type="reset" onclick="location.href='<c:url value='index'/>'">Home</button>
							<button class="btn btn-primary" type="reset" onclick="location.href='<c:url value='/insertform'/>'">Sign Up</button>
							
						</div>
						<br>
						<div class="d-grid gap-2 d-md-block">
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
								아이디 찾기
							</button>
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">
								비밀번호 변경
							</button>
						</div>
					</div>
				</div>
			</form>
			
			<form action="<c:url value='findId'/>" method="post" class="form-floating">
				<!-- Button trigger modal -->
				
				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
				    	<div class="modal-content">
					    	<div class="modal-header">
					        	<h1 class="modal-title fs-5" id="staticBackdropLabel">아이디 찾기</h1>
					        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      	</div>
					    <div class="modal-body">
					    	<div>
						    	<div class="input-group mb-3">
									<span class="input-group-text" id="inputGroup-sizing-default">이름</span>
									<input type="text" name="memberName" id="memberName" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" pattern="[A-Za-z0-9가-힣]+" required>
								</div>
								<div>
									<span id="nameConfirm"></span>
								</div>
							</div>
							<div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="inputGroup-sizing-default">생년월일</span>
									<input type="date" name="memberBirth" id="memberBirth" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
								</div>
								<div>
									<span id="birthConfirm"></span>
								</div>
							</div>
							<div>
								<div class="input-group mb-3">
									<input type="hidden" name = hiddenPhone id=hiddenPhone value="false">
									<span class="input-group-text" id="inputGroup-sizing-default">전화번호</span>
									<input type="text" name="memberPhone" id="memberPhone" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"  pattern="\d{3}-\d{3,4}-\d{4}" required>
							 	</div>	
							 	<div>
									<span id="phoneConfirm"></span>
								</div>
							</div>
						</div>
					      	<div class="modal-footer">
					      		<button type="submit" class="btn btn-primary">확인</button>
					        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					      	</div>
					  	</div>
					</div>
				</div>
			</form>
			
			
			
			
			<form action="<c:url value='findId'/>" method="post" class="form-floating">
				<!-- Button trigger modal -->
				
				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
				    	<div class="modal-content">
					    	<div class="modal-header">
					        	<h1 class="modal-title fs-5" id="staticBackdropLabel">비밀번호 변경</h1>
					        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      	</div>
					    <div class="modal-body">
					   		<div>
						    	<div class="input-group mb-3">
									<span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
									<input type="text" name="memberId" id="memberId2" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" pattern="[A-Za-z0-9가-힣]+" required>
								</div>
								<div>
									<span id="idConfirm2"></span>
								</div>
							</div>
					    	<div>
						    	<div class="input-group mb-3">
									<span class="input-group-text" id="inputGroup-sizing-default">이름</span>
									<input type="text" name="memberName" id="memberName2" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" pattern="[A-Za-z0-9가-힣]+" required>
								</div>
								<div>
									<span id="nameConfirm2"></span>
								</div>
							</div>
							<div>
								<div class="input-group mb-3">
									<span class="input-group-text" id="inputGroup-sizing-default">생년월일</span>
									<input type="date" name="memberBirth" id="memberBirth2" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
								</div>
								<div>
									<span id="birthConfirm2"></span>
								</div>
							</div>
							
							<div>
								<div class="input-group mb-3">
									<input type="hidden" name = "hiddenPhone" id="hiddenPhone2" value="false">
									<span class="input-group-text" id="inputGroup-sizing-default">전화번호</span>
									<input type="text" name="memberPhone" id="memberPhone2" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"  pattern="\d{3}-\d{3,4}-\d{4}" required>
							 	</div>
							 	<div>
									<span id="phoneConfirm2"></span>
								</div>
							</div>	
						</div>
					      	<div class="modal-footer">
					      		<button type="submit" class="btn btn-primary">확인</button>
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
	

	var name = document.querySelector("#memberName");
	var nameConfirm = document.querySelector("#nameConfirm");

	name.onkeyup = function(event) {
		if (name.value == "") {
			nameConfirm.innerText = "필수 정보 입니다.";
		} else {
			nameConfirm.innerText = "";
		}

	}
	
	var birth = document.querySelector("#memberBirth");
	var birthConfirm = document.querySelector("#birthConfirm");

	birth.onkeyup = function(event) {
		if (birth.value == "") {
			birthConfirm.innerText = "생년월일을 선택 해주세요.";
		} else {
			birthConfirm.innerText = "";
		}
	}
	
	var phone = document.querySelector("#memberPhone");
	var phoneConfirm = document.querySelector("#phoneConfirm");
	  
	phone.onkeyup = function(event) {
		re4 = /^\d{3}-\d{3,4}-\d{4}$/;
				if (phone.value == "") {
					phoneConfirm.innerText = "필수 정보 입니다.";
				} else {
					if (re4.test(phone.value)) {
						phoneConfirm.innerText = "";
					} else {
						phoneConfirm.innerText = "000-0000-000 형식을 맞춰주세요.";
					}
				}
			}
	
	
	
	
	var id2 = document.querySelector("#memberId2");
	var idConfirm2 = document.querySelector("#idConfirm2");
	  
	id2.onkeyup = function(event) {
		if (id2.value == "") {
			idConfirm2.innerText = "아이디를 입력 해주세요.";
		} else {
			idConfirm2.innerText = "";
		}
	}

	
	var name2 = document.querySelector("#memberName2");
	var nameConfirm2 = document.querySelector("#nameConfirm2");

	name2.onkeyup = function(event) {
		if (name2.value == "") {
			nameConfirm2.innerText = "필수 정보 입니다.";
		} else {
			nameConfirm2.innerText = "";
		}

	}
	
	var birth2 = document.querySelector("#memberBirth2");
	var birthConfirm2 = document.querySelector("#birthConfirm2");

	birth2.onkeyup = function(event) {
		if (birth2.value == "") {
			birthConfirm2.innerText = "생년월일을 선택 해주세요.";
		} else {
			birthConfirm2.innerText = "";
		}
	}
	
	
	var phone2 = document.querySelector("#memberPhone2");
	var phoneConfirm2 = document.querySelector("#phoneConfirm2");
	  
	phone2.onkeyup = function(event) {
		re4 = /^\d{3}-\d{3,4}-\d{4}$/;
				if (phone2.value == "") {
					idConfirm2.innerText = "필수 정보 입니다.";
				} else {
					if (re4.test(phone2.value)) {
						phoneConfirm2.innerText = "";
					} else {
						phoneConfirm2.innerText = "000-0000-000 형식을 맞춰주세요.";
					}
				}
			}
	
	
			
		
				
		
	</script>
</html>