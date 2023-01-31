<%@ include file="../header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/member"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Log Us</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	
		<style>
			.id_ok, .nickname_ok{
				color:#008000;
				display: none;
			}
			
			.id_already, .nickname_already{
				color:#6A82FB; 
				display: none;
			}
		</style>
	
	</head>

	<body>
		<h1>회원가입을 환영 합니다!!!</h1>
		<form id = "insertForm" action = "<c:url value='/insert'/>" method="post">
			<fieldset>
				<legend>사용자 정보</legend>
				
				<div>
					<h6><label>*아이디</label></h6>
					<input type="hidden" name = hiddenId id=hiddenId value="false">
					<input type="text" name="memberId" id="memberId" oninput = "checkId()" value="${memberId}" pattern="[A-Za-z0-9]{5,20}" required>
					<span id="idConfirm"></span>
					<span class="id_ok">사용 가능한 아이디입니다.</span>
					<span class="id_already">이미 사용중인 아이디입니다.</span>
				</div>
				
				<div>
					<h6><label>*비밀번호</label></h6>
					<input type="password" name="memberPassword" id="memberPassword" value="${memberPassword}" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}" required>
					<span id="passwordConfirm"></span>
				</div>
				
				<div>
					<h6><label>*비밀번호 확인</label></h6>
					<input type="password" name="memberPasswordRe" id="memberPasswordRe" required>
					<span id="passwordReConfirm"></span>
				</div>
				
				<div>
					<h6><label>*이름</label></h6>
					<input type="text" name="memberName" id="memberName" value="${memberName}"  pattern="[A-Za-z0-9가-힣]+" required>
					<span id="nameConfirm"></span>
				</div>
				
				<div>
					<h6><label>*생년월일</label></h6>
					<input type="date" name=memberBirth id="memberBirth" value="${memberBirth}" required>
					<span id="birthConfirm"></span>
				</div>
				
				<div>
					<h6><label>*성별</label></h6>
					<select name="memberSex" id="memberSex" value="${memberSex}" required>
						<option value="1">남성</option>
						<option value="2">여성</option> 
					</select>
					<span id="sexConfirm"></span>
				 </div>
				  
				 <div>
					<h6><label>전화번호</label></h6>
					<input type="text" name="memberPhone" id="memberPhone" value="${memberPhone}"  pattern="\d{3}-\d{3,4}-\d{4}" required>
					<span id="phoneConfirm"></span>
				</div>
				
				<div>
					<h6><label>이메일 주소</label></h6>
					<input type="email" name="memberEmail" id="memberEmail" value="${memberEmail}" pattern="[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+" required>
					<span id="emailConfirm"></span>
				</div>
				
		
			</fieldset>
			
			
			
			<fieldset>
				<legend>프로필</legend>
				
				<div>
					<h6><label>닉네임</label></h6>
					<input type="hidden" name = hiddenNickname id=hiddenNickname value="false">
					<input type="text" name="memberNickname" id="memberNickname" value="${memberNickname}"  oninput = "checkNickname()" required>
					<span id="nicknameConfirm"></span>
					<span class="nickname_ok">사용 가능한 닉네임 입니다.</span>
					<span class="nickname_already">이미 사용중인 닉네임 입니다.</span>
				</div>
				
				<div>
					<h6><label>프로필 사진</label></h6>
					<input type="text" name="memberProfile" value="${memberProfile}">
				</div>
				
				<div>
				  	<h6><label>직업</label></h6>
					 <select name="memberJob" value="${memberJob}" required>
						 <option value="학생">학생</option>
						 <option value="취준생">취준생</option>
						 <option value="직장인">직장인</option>
						 <option value="주부">주부</option>
						 <option value="기타">기타</option>
					 </select>
				 </div>
			</fieldset>
			<div class="d-grid gap-2 col-6 mx-auto">
				<button class="btn btn-primary" type="button" onclick="insertMember()">가입하기</button>
				<button class="btn btn-primary" type="reset">돌아가기</button>
			</div>
		</form>
	</body>

	<script type="text/javascript">
		document.addEventListener("DOMContentLoaded", function() {
			var checkPassword = function(str) {
				var re = /^(?=.*\d)(?=.*[a-z])(?=.[A-Z]).{8,16}$/;
				return re.test(str)
			};
	
			var pw1 = document.querySelector("#memberPassword");
			var pw2 = document.querySelector("#memberPasswordRe");
			var pw1Confirm = document.querySelector("#passwordConfirm");
			var pw2Confirm = document.querySelector("#passwordReConfirm");
	
			pw1.onkeyup = function(event) {
				re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,16}$/;
				if (pw1.value == "") {
					pw1Confirm.innerText = "필수 정보 입니다.";
				} else {
					if (re.test(pw1.value)) {
						pw1Confirm.innerText = "사용 가능한 비밀번호 입니다.";
					} else {
						pw1Confirm.innerText = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
					}
				}
	
			}
	
			pw2.onkeyup = function(event) {
				if (pw1.value !== pw2.value) {
					pw2Confirm.innerText = "비밀번호가 일치하지 않습니다.";
				} else {
					pw2Confirm.innerText = "비밀번호가 일치합니다.";
				}
			}

			var checkId = function(str) {
				var re2 = /^[A-Za-z0-9]{5,20}$/;
				return re2.test(str)
			};

	
			var id = document.querySelector("#memberId");
			var idConfirm = document.querySelector("#idConfirm");
	
			id.onkeyup = function(event) {
				re2 = /^[A-Za-z0-9]{5,20}$/;
				if (id.value == "") {
					idConfirm.innerText = "필수 정보 입니다.";
				} else {
					if (re2.test(id.value)) {
						idConfirm.innerText = "";
					} else {
						idConfirm.innerText = "5~20자의 영문, 숫자만 사용 가능합니다.";
					}
				}
	
			}
			
			
			var checkName = function(str) {
				var re3 = /^[A-Za-z0-9가-힣]$/;
				return re2.test(str)
			};

	
			var name = document.querySelector("#memberName");
			var nameConfirm = document.querySelector("#nameConfirm");
	
			name.onkeyup = function(event) {
				re3 = /^[A-Za-z0-9가-힣]+$/;
				if (name.value == "") {
					nameConfirm.innerText = "필수 정보 입니다.";
				} else {
					if (re3.test(name.value)) {
						nameConfirm.innerText = "";
					} else {
						nameConfirm.innerText = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
					}
				}
	
			}
			

			var checkemail = function(str) {
				var re4 = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
				return re4.test(str)
			};
			
			var email = document.querySelector("#memberEmail");
			var emailConfirm = document.querySelector("#emailConfirm");
	
			email.onkeyup = function(event) {
				re4 = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
				if (email.value == "") {
					emailConfirm.innerText = "필수 정보 입니다.";
				} else {
					if (re4.test(email.value)) {
						emailConfirm.innerText = "";
					} else {
						emailConfirm.innerText = "이메일을 확인 해주세요.";
					}
				}
	
			}
			
			var birth = document.querySelector("#memberBirth");
			var birthConfirm = document.querySelector("#birthConfirm");
	
			birth.onkeyup = function(event) {
				if (birth.value == "") {
					birthConfirm.innerText = "생년월일을 선택 해주세요.";
				} else {
					
				}
			}
			
			var sex = document.querySelector("#memberSex");
			var sexConfirm = document.querySelector("#sexConfirm");
	
			sex.onkeyup = function(event) {
				if (sex.value == "") {
					sexConfirm.innerText = "성별을 선택 해주세요.";
				} else {
					
				}
			}
			
			var checkPhone = function(str) {
				var re4 = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
				return re4.test(str)
			};
			
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
			
			var nickname = document.querySelector("#memberNickname");
			var nicknameConfirm = document.querySelector("#nicknameConfirm");
	
			nickname.onkeyup = function(event) {
				if (nickname.value == "") {
					nicknameConfirm.innerText = "필수 정보 입니다.";
				} else {
					
				}
			}
			
	
		});
		
		  
		function checkId() {
			var id = $('#memberId').val(); //id값이 "id"인 입력란의 값을 저장
			var hiddenId = $('#hiddenId').val();
			$.ajax({
				url : './idCheck', //Controller에서 요청 받을 주소
				type : 'post', //POST 방식으로 전달
				data : {
					id : id
				},
				success : function(cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
					if (cnt == 0) { //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
						hiddenId = $('#hiddenId').val("false");
						$('.id_ok').css("display", "inline-block");
						$('.id_already').css("display", "none");
					} else { // cnt가 1일 경우 -> 이미 존재하는 아이디
						hiddenId = $('#hiddenId').val("true");
						$('.id_already').css("display", "inline-block");
						$('.id_ok').css("display", "none");
						$('#id').val('');
					}
				},
				error : function() {
					alert("에러입니다");
				}
			});
		};
		
		
 		function checkNickname() {
			var nickname = $('#memberNickname').val(); //id값이 "id"인 입력란의 값을 저장
			var hiddenNickname = $('#hiddenNickname').val();
			$.ajax({
				url : './nicknameCheck', //Controller에서 요청 받을 주소
				type : 'post', //POST 방식으로 전달
				data : {
					nickname : nickname
				},
				success : function(cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
					if (cnt == 0) { //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
						$('#hiddenNickname').val("false");
						$('.nickname_ok').css("display", "inline-block");
						$('.nickname_already').css("display", "none");
					} else { // cnt가 1일 경우 -> 이미 존재하는 아이디
						 $('#hiddenNickname').val("true");
						$('.nickname_already').css("display", "inline-block");
						$('.nickname_ok').css("display", "none");
						$('#nickname').val('');
					}
				},
				error : function() {
					alert("에러입니다");
				}
			});
		};
		
		 // 정보 저장 및 입력 확인 함수
 		function insertMember() {
			
			var pw1 = $('#memberPassword');
			var pw2 = $('#memberPasswordRe');
			var id = $('#memberId');
			var nickname = $('#memberNickname');
			var hiddenId = $('#hiddenId').val();
			var hiddenNickname = $('#hiddenNickname').val();
			var ajaxOption = {
				url : './insert', //Controller에서 요청 받을 주소
				dataType : "html",
				type : 'post', //POST 방식으로 전달
			};

			$.ajax({ajaxOption,
				success: function(){
				if (pw2.val() != pw1.val()) {
			    	alert("비밀번호를 다시 한번 확인 해주세요.");
			    	pw2.focus();
			 	 }  else if(hiddenId=="true"){
			 		alert("아이디를 확인 해주세요.");
			 		id.focus();
			 	 }	else if(hiddenNickname=="true"){
			 		alert("닉네임을 확인 해주세요.");
			 		nickname.focus();
			 	 }	else {
			 		alert("가입이 완료 되었습니다.");
			 		$("#insertForm").attr("action", "<c:url value='/insert'/>").submit();
			 	 }
			 	 },
					error : function() {
						alert("에러입니다");
				}
			});

		};
		
		
		/* // 정보 저장 및 입력 확인 함수
 		function insertMember() {
			
			var pw1 = $('#memberPassword');
			var pw2 = $('#memberPasswordRe');
			
			if (pw2.val() != pw1.val()) {
		    	alert("비밀번호를 다시 한번 확인 해주세요.");
		    	pw2.focus();
		 	 }  else {
		 		alert("가입이 완료 되었습니다.");
 		    	document.form.action = "<c:url value='/insert'/>";
		    	document.form.submit();
		 	 }
		}  */
		
	</script>

</html>
