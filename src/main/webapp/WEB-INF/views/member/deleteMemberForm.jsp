<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<style>
			.id_ok, .nickname_ok{
				color:#008000;
				display: none;
			}
			
			.id_already, .nickname_already{
				color:#6A82FB; 
				display: none;
			}
			.memberId, .memberBirth, .memberNickname{
				background-color:"#e5e5e5";
			}
			.title{
				margin : 40px auto;
				text-align : center;
			}
			.title2{
				margin : 40px auto;
			}
			.container{
				width : 1000px;
				margin : 0px auto;
				background-color: #f7f7f7;	
			}
			textarea {
			    width: 100%;
			    border: none;
			    resize: none;
		  }
		</style>
	</head>
	<body class = "container">
		<form action="<c:url value='/deleteMember'/>" method="post" >
			<div class = "title">
	    		<h1>탈퇴</h1>
	    	</div>
	    	<div>
	    		<h2>탈퇴를 계속 진행 하시겠습니까?</h2>
	    	</div>
	    	<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label">반드시 확인 해주세요!</label>
				<textarea class="form-control" id="exampleFormControlTextarea1" rows="4" disabled>
	1. 탈퇴를 진행하시려면 비밀번호를 재확인 하여야 합니다. 
	2. 탈퇴 이후 게시물 삭제가 불가능하니 민감한 정보는 미리 삭제 후 탈퇴해주시기 바랍니다. 
	3. 탈퇴 이후 해당 계정으로는 재가입이 불가능합니다. 
	4. 추가 문의 사항은 탈퇴 이전 QnA로 문의 바랍니다
				</textarea>
			</div>
	    	<div>
	    		<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default">비밀번호 확인</span>
					<input type="password" name="memberPassword" id="memberPassword" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" required>
				</div>
	    	</div>
	    	<div class="d-grid gap-2 col-6 mx-auto">
				<button class="btn btn-primary" type="submit" onclick="memberDelete()">탈퇴하기</button>
			</div>
			<div>
				<div>
					<input type="hidden" name="message" id="message" value="${message}">
				</div>
			</div>
		</form>
	</body>
	
	<script type="text/javascript">

	</script>
</html>