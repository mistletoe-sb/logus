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
	</head>

	<body>
		<h1>회원가입을 환영 합니다!!!</h1>
		<form action="<c:url value='/insert'/>" method="post">
			<fieldset>
				<legend>사용자 정보</legend>
				
				<div>
					<label>*아이디</label>
					<input type="text" name="memberId" value="${memberId}" pattern="\w+">
					<span id="IdConfirm"></span>
				</div>
				
				<div>
					<label>*비밀번호</label>
					<input type="password" name="memberPassword" id="memberPassword" value="${memberPassword}" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}">
				</div>
				
				<div>
					<label>*비밀번호 확인</label>
					<input type="password" name="memberPasswordRe" id="memberPasswordRe">
					<span id="passwordConfirm"></span>
				</div>
				
				<div>
					<label>*이름</label>
					<input type="text" name="memberName" value="${memberName}">
				</div>
				
				<div>
					<label>*생년월일</label>
					<input type="date" name=memberBirth value="${memberBirth}">
				</div>
				
				<div>
					<label>*성별</label>
					<select name="memberSex" value="${memberSex}">
						<option value="1">남성</option>
						<option value="2">여성</option> 
					</select>
				 </div>
				  
				 <div>
					<label>전화번호</label>
					<input type="text" name="memberPhone" value="${memberPhone}">
				</div>
				
				<div>
					<label>이메일 주소</label>
					<input type="email" name="memberEmail" value="${memberEmail}">
				</div>
			</fieldset>
			
			<fieldset>
				<legend>프로필</legend>
				
				<div>
					<label>닉네임</label>
					<input type="text" name="memberNickname" value="${memberNickname}">
				</div>
				
				<div>
					<label>프로필 사진</label>
					<input type="text" name="memberProfile" value="${memberProfile}">
				</div>
				
				<div>
				  	<label>직업</label>
					 <select name="memberJob" value="${memberJob}">
						 <option value="학생">학생</option>
						 <option value="취준생">취준생</option>
						 <option value="직장인">직장인</option>
						 <option value="주부">주부</option>
						 <option value="기타">기타</option>
					 </select>
				 </div>
			</fieldset>
			
			<div>
				<input type="submit" class="SAVE" value="저장">
				<input type="button" class="CANCLE" value="취소">
			</div>
		</form>
	</body>
	
	<script type="text/javascript">
	
		document.addEventListener("DOMContentLoaded", function(){
		 var re = /^(?=.*\d)(?=.*[a-z])(?=.[A-Z]).{6,}$/;
		 return re.test(str);
		 };
	
		var pw1 = document.querySelector("#memberPassword");
		var pw2 = document.querySelector("#memberPasswordRe");
		var pwConfirm = document.querySelector("#passwordConfirm");
		var id = document.querySelector("#memberId");
		var idConfirm = document.querySelector("#idConfirm");
		
		

		pw2.onkeyup = function(event) {
			if(pw1.value !== pw2.value) {
				pwConfirm.innerText = "비밀번호가 일치하지 않습니다.";
			}else {
				pwConfirm.innerText = "비밀번호가 일치합니다.";
			}
		}
		
		re=\w+;
		id.onkeyup = function(event) {
			if(re.test(id)) {
				pwConfirm.innerText = "비밀번호가 일치하지 않습니다.";
			}else {
				pwConfirm.innerText = "비밀번호가 일치합니다.";
			}
		}
		
		
		
	</script>
	
</html>
