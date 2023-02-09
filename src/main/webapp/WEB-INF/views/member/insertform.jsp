<%@ include file="../header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
	<head>
	<%@ include file="../include.jsp" %>
	 		<style>
			.id_ok, .nickname_ok, .phone_ok{
				color:#008000;
				display: none;
			}
			
			.id_already, .nickname_already, .phone_already{
				color:#6A82FB; 
				display: none;
			}
			.container{
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
	<%@ include file="../header_body.jsp" %>
		<div class="container">
			<div class="title">
				<h1>회원가입을 환영 합니다!!!</h1>
			</div>
			<form id ="insertForm" action = "<c:url value='/insert'/>" method="post"   onsubmit="return insertMember()" enctype="multipart/form-data" class="form-floating">
				<fieldset class="title2">
					<legend>사용자 정보</legend>
					
					<div>
						<div class="input-group mb-3">
							<input type="hidden" name = hiddenId id=hiddenId value="false">
							<span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
							<input type="text" name="memberId" id="memberId" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"  pattern="[A-Za-z0-9]{5,20}" required>
						</div>
						<div>
							<span id="idConfirm"></span>
							<span class="id_ok">사용 가능한 아이디입니다.</span>
							<span class="id_already">이미 사용중인 아이디입니다.</span>
						</div>
					</div>
					
					<div>
						<div class="input-group mb-3">
							<span class="input-group-text" id="inputGroup-sizing-default">비밀번호</span>
							<input type="password" name="memberPassword" id="memberPassword" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}" required>
						</div>
						<div>
							<span id="passwordConfirm"></span>
						</div>
					</div>
					<div>
						<div class="input-group mb-3">
							<span class="input-group-text" id="inputGroup-sizing-default">비밀번호 확인</span>
							<input type="password" name="memberPasswordRe" id="memberPasswordRe" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
						</div>
						<div>
							<span id="passwordReConfirm"></span>
						</div>
					</div>
					
					
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
							<input type="date" name=memberBirth id="memberBirth" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
						</div>
						<div>
							<span id="birthConfirm"></span>
						</div>
					</div>
					
					<div>
						<div>
							<select name="memberSex" id="memberSex" class="form-select" aria-label="Default select example" required>
								<option value="" selected>성별</option>
								<option value="1">남성</option>
								<option value="2">여성</option>
								<option value="3">기타</option>
							</select>
							<br>
						</div>
						<div>
							<span id="sexConfirm"></span>
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
							<span class="phone_ok">가입 가능한 전화번호 입니다.</span>
							<span class="phone_already">이미 회원가입한 전화번호 입니다.</span>
						</div>
					</div>
					
					<div>
						<div class="input-group mb-3">
							<span class="input-group-text" id="inputGroup-sizing-default">이메일</span>
							<input type="email" name="memberEmail" id="memberEmail" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" pattern="[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+" required>
						</div>
						<div>
							<span id="emailConfirm"></span>
						</div>
					</div>
			
				</fieldset>
				<fieldset>
					<legend>프로필</legend>
					
					<div>
						<div class="input-group mb-3">
							<input type="hidden" name = hiddenNickname id=hiddenNickname value="false">
							<span class="input-group-text" id="inputGroup-sizing-default">닉네임</span>
							<input type="text" name="memberNickname" id="memberNickname" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
						</div>
						
						<div>
							<span id="nicknameConfirm"></span>
							<span class="nickname_ok">사용 가능한 닉네임 입니다.</span>
							<span class="nickname_already">이미 사용중인 닉네임 입니다.</span>
						</div>
					</div>
					<div>
						<div class="input-group mb-3">
							<div class="image-container">
								<span class="input-group-text" id="inputGroup-sizing-default">프로필</span>
								<img style="width: 500px;" id="preview-image" class="rounded-4" src="<c:url value='/resources/images/preview_image.png'/>">
								<input style="display: block;" type="file" name="profile" id="memberProfile" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
							</div>
						</div>
					</div>
					<div>
						<select name="memberJob" id="memberJob" class="form-select" aria-label="Default select example" required>
							<option value="" selected>직업</option>
							<option value="학생">학생</option>
							<option value="취준생">취준생</option>
							<option value="직장인">직장인</option>
							<option value="주부">주부</option>
							<option value="기타">기타</option>
						</select>
						<br>
					</div>
				</fieldset>
				<div class="d-grid gap-2">
					<button class="btn btn-primary" type="submit" >가입하기</button>
					<button class="btn btn-primary" type="reset" onclick="location.href='<c:url value='index'/>'">돌아가기</button>
				</div>
			</form>
		</div>
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
				re4 = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$/;
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
					birthConfirm.innerText = "";
				}
			}
			
			var sex = document.querySelector("#memberSex");
			var sexConfirm = document.querySelector("#sexConfirm");
	
			sex.onkeyup = function(event) {
				if (sex.value == "") {
					sexConfirm.innerText = "성별을 선택 해주세요.";
				} else {
					sexConfirm.innerText = "";
				}
			}
		var checkId = function(str) {
			var re2 = /^[A-Za-z0-9]{5,20}$/;
			return re2.test(str)
		};


		var id = document.querySelector("#memberId");
		var idConfirm = document.querySelector("#idConfirm");
		  
		id.onkeyup = function(event) {
			var id1 = document.querySelector("#memberId");
			var idConfirm = document.querySelector("#idConfirm");
			var id = $('#memberId').val(); //id값이 "id"인 입력란의 값을 저장
			var hiddenId = $('#hiddenId').val();
			re2 = /^[A-Za-z0-9]{5,20}$/;
			$.ajax({
				url : './idCheck', //Controller에서 요청 받을 주소
				type : 'post', //POST 방식으로 전달
				data : {
					id : id
				},
				success : function(cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
					if (id1.value == "") {
						$('.id_already').css("display", "none");
						$('.id_ok').css("display", "none");
						idConfirm.innerText = "필수 정보 입니다.";
					} else {
						if (re2.test(id1.value)) {
							idConfirm.innerText = "";
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
						} else {
							$('.id_already').css("display", "none");
							$('.id_ok').css("display", "none");
							idConfirm.innerText = "5~20자의 영문, 숫자만 사용 가능합니다.";
						}
					}
				},
				error : function() {
					alert("에러입니다");
					
				}
			});
		};
		
		
		
		var checkId = function(str) {
			var re2 = /^[A-Za-z0-9]{5,20}$/;
			return re2.test(str)
		};
		
		var phone = document.querySelector("#memberPhone");
		var phoneConfirm = document.querySelector("#phoneConfirm");
		  
		phone.onkeyup = function(event) {
			var phone1 = document.querySelector("#memberPhone");
			var phoneConfirm = document.querySelector("#phoneConfirm");
			var phone = $('#memberPhone').val(); //id값이 "id"인 입력란의 값을 저장
			var hiddenPhone = $('#hiddenPhone').val();
			re4 = /^\d{3}-\d{3,4}-\d{4}$/;
			$.ajax({
				url : './phoneCheck', //Controller에서 요청 받을 주소
				type : 'post', //POST 방식으로 전달
				data : {
					phone : phone
				},
				success : function(cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
					if (phone1.value == "") {
						$('.phone_already').css("display", "none");
						$('.phone_ok').css("display", "none");
						idConfirm.innerText = "필수 정보 입니다.";
					} else {
						if (re4.test(phone1.value)) {
							phoneConfirm.innerText = "";
							if (cnt == 0) { //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
								hiddenPhone = $('#hiddenPhone').val("false");
								$('.phone_ok').css("display", "inline-block");
								$('.phone_already').css("display", "none");
							} else { // cnt가 1일 경우 -> 이미 존재하는 아이디
								hiddenPhone = $('#hiddenPhone').val("true");
								$('.phone_already').css("display", "inline-block");
								$('.phone_ok').css("display", "none");
								$('#phone').val('');
							}
						} else {
							$('.phone_already').css("display", "none");
							$('.phone_ok').css("display", "none");
							phoneConfirm.innerText = "000-0000-000 형식을 맞춰주세요.";
						}
					}
				},
				error : function() {
					alert("에러입니다");
				}
			});
		};

		var nickname = document.querySelector("#memberNickname");
		var nicknameConfirm = document.querySelector("#nicknameConfirm");
		 
		nickname.onkeyup = function(event) {
 			var nickname1 = document.querySelector("#memberNickname");
 			var nicknameConfirm = document.querySelector("#nicknameConfirm");
			var nickname = $('#memberNickname').val(); //id값이 "id"인 입력란의 값을 저장
			var hiddenNickname = $('#hiddenNickname').val();
			$.ajax({
				url : './nicknameCheck', //Controller에서 요청 받을 주소
				type : 'post', //POST 방식으로 전달
				data : {
					nickname : nickname
				},
				success : function(cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
					if (nickname1.value == "") {
						$('.nickname_already').css("display", "none");
						$('.nickname_ok').css("display", "none");
						nicknameConfirm.innerText = "필수 정보 입니다.";
					} else {
						nicknameConfirm.innerText = "";
						if (cnt == 0) { //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
							hiddenNickname = $('#hiddenNickname').val("false");
							$('.nickname_ok').css("display", "inline-block");
							$('.nickname_already').css("display", "none");
						} else { // cnt가 1일 경우 -> 이미 존재하는 아이디
							hiddenNickname = $('#hiddenNickname').val("true");
							$('.nickname_already').css("display", "inline-block");
							$('.nickname_ok').css("display", "none");
							$('#nickname').val('');
						}
					}
				},
				error : function() {
					alert("에러입니다");
					return;
				}
			});
		};
	});
		
		 // 정보 저장 및 입력 확인 함수
 		 function insertMember() {
			
 			var id = $('#memberId');
 			var hiddenId = $('#hiddenId')
			var pw1 = $('#memberPassword');
			var pw2 = $('#memberPasswordRe');
			var nickname = $('#memberNickname');
			var hiddenNickname = $('#hiddenNickname')
			var phone = $('#memberPhone');
			var hiddenPhone = $('#hiddenPhone')

			if(hiddenId.val() == "true"){
		 		alert("아이디를 확인 해주세요.");
		 		hiddenId.focus();
		 		return false;
			} else if (pw2.val() != pw1.val()) {
		    	alert("비밀번호를 다시 한번 확인 해주세요.");
		    	pw2.focus();
		    	return false;	
		 	} else if(hiddenNickname.val()=="true"){
		 		alert("닉네임을 확인 해주세요.");
		 		hiddenNickname.focus();
		 		return false;	
		 	} else if(hiddenPhone.val()=="true"){
		 		alert("이미 가입한 전화번호로는 가입이 불가 합니다.");
		 		hiddenNickname.focus();
		 		return false;	
		 	}
		}; 
		
		
		function readImage(input) {
		    // 인풋 태그에 파일이 있는 경우
		    if(input.files && input.files[0]) {
		        // 이미지 파일인지 검사 (생략)
		        // FileReader 인스턴스 생성
		        const reader = new FileReader()
		        // 이미지가 로드가 된 경우
		        reader.onload = e => {
		            const previewImage = document.getElementById("preview-image")
		            previewImage.src = e.target.result
		        }
		        // reader가 이미지 읽도록 하기
		        reader.readAsDataURL(input.files[0])
		    }
		}
		// input file에 change 이벤트 부여
		const inputImage = document.getElementById("memberProfile")
		inputImage.addEventListener("change", e => {
		    readImage(e.target)
		})
		
	</script>
</html>
