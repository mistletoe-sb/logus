<%@ include file="../header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Log Us</title>
	</head>
	<body>
		<form action="<c:url value='/login'/>" method="post">
			<h1>로그인</h1>
			<label>ID</label><br>
			<input type="text" name="memberId" id="memberId" value= "${memberId}"  maxlength="20" placeholder="아이디를 입력 해주세요." required><br>
			<label>Password</label><br>
			<input type="password" name="memberPassword" id="memberPassword" value="${memberPassword}" maxlength="16" placeholder="비밀번호를 입력 해주세요." required><br>

			<input type="submit" onclick="memberLogin()">
		</form>
		<br><br><br>계정이 없으면 <a href="<c:url value='/insertform'/>">회원가입</a>
		<p>${message}</p>
	</body>
	<script type="text/javascript">
	
	
		function memberLogin() {
			var id = $('#memberId').val(); //id값이 "id"인 입력란의 값을 저장
			var pw = $('#memberPassword').val();
			$.post('./memberLogin',
					{id : id,
					pw : pw},
					function(data){
						alert(${message}+data);
					});
		}
		
				
		
	</script>
</html>