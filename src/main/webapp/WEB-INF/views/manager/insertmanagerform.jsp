<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
    <head>
		<style>
		 .container{
            width : 800px;
            margin : 20px auto;
            background-color: #ffffff;
         }
         .title{
            margin : 40px auto;
            text-align : center;
         }
         .title2{
            margin : 40px auto;
            text-align : right;
         }
		
			.id_ok{
			color:#008000;
			display: none;
			}
			
			.id_already{
			color:#6A82FB; 
			display: none;
			}
			
			.nickname_ok{
			color:#008000;
			display: none;
			}
			
			.nickname_already{
			color:#6A82FB; 
			display: none;
			}
		</style>
    </head>
    <body>
    	<%@ include file="../header.jsp" %>
		<%@ include file="managerside.jsp" %>
	    <div class="container">
	        <h1 class="title">관리자 등록</h1>
	        <h4 class="title2">${sessionScope.sessionManagerNickname}</h4>
	        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	        <form name="insertmanagerform" action="<c:url value='/manager/insertmanager'/>" method="post">
		        <fieldset>
		        <div class="mb-3">
		            <label for="exampleFormControlInput1" class="form-label">관리자 ID(5~20자 사이의 영문, 숫자만 가능)</label>
		            <input type="text" class="form-control" id="managerId" name="managerId" oninput="checkManagerId()" pattern="[A-Za-z0-9]{5,20}" placeholder="ID를 입력하세요" required>
		        	<!-- id ajax 중복체크 -->
					<span class="id_ok">사용 가능한 아이디입니다.</span>
					<span class="id_already">누군가 이 아이디를 사용하고 있어요.</span>
		        </div>
		        <div class="mb-3">
		            <label for="exampleFormControlInput1" class="form-label">관리자 password(8~16자 사이만 가능)</label>
		            <input type="password" class="form-control" id="managerPassword" name="managerPassword" pattern="{8,16}" placeholder="password를 입력하세요" required>
		        </div>
		        <div class="mb-3">
		            <label for="exampleFormControlInput1" class="form-label">관리자 password 확인</label>
		            <input type="password" class="form-control" id="confirmManagerPassword" placeholder="확인 password를 입력하세요" required>
		        </div>
		        <div class="mb-3">
		            <label for="exampleFormControlInput1" class="form-label">관리자 nickname(5~20자 사이의 영문, 한글, 숫자만 가능)</label>
		            <input type="text" class="form-control" id="managerNickname" name="managerNickname" oninput="checkManagerNickname()" pattern="[A-Za-z0-9가-힣]{5,20}" placeholder="별명을 입력하세요" required>
		       		<!-- nickname ajax 중복체크 -->
					<span class="nickname_ok">사용 가능한 별명입니다.</span>
					<span class="nickname_already">누군가 이 별명을 사용하고 있어요.</span>
		        </div>
		        <div class="d-grid gap-2 col-1 mx-auto">
		            <input type="submit" id="submitbtn" class="btn btn-primary" value='관리자 등록하기'>
		        </div>
		        </fieldset>
	        </form>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://cdn.jsdelivr.net/npm/vue@2.7.14"></script>
        
        <script type="text/javascript">
        
	        function checkManagerId(){
	            var managerId = $('#managerId').val(); //id값이 "id"인 입력란의 값을 저장
	            $.ajax({
	                url:'http://localhost:8080/logus/managerIdCheck', //Controller에서 요청 받을 주소
	                type:'post', //POST 방식으로 전달
	                data:{managerId:managerId},
	                success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
	                    if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
	                        $('.id_ok').css("display","inline-block"); 
	                        $('.id_already').css("display", "none");
	                        $("#submitbtn").attr("disabled", false);
	                    } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
	                        $('.id_already').css("display","inline-block");
	                        $('.id_ok').css("display", "none");
// 	                        alert("아이디를 다시 입력해주세요");
// 	                        $('#managerId').val('');
	                        $("#submitbtn").attr("disabled", true);
	                    }
	                },
	                error:function(){
	                    alert("에러입니다");
	                }
	            });
	            };
	            
		        function checkManagerNickname(){
		            var managerNickname = $('#managerNickname').val(); //nickname값이 "nickname"인 입력란의 값을 저장
		            $.ajax({
		                url:'http://localhost:8080/logus/managerNicknameCheck', //Controller에서 요청 받을 주소
		                type:'post', //POST 방식으로 전달
		                data:{managerNickname:managerNickname},
		                success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
		                    if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 닉네임
		                        $('.nickname_ok').css("display","inline-block"); 
		                        $('.nickname_already').css("display", "none");
		                        $("#submitbtn").attr("disabled", false);
		                    } else { // cnt가 1일 경우 -> 이미 존재하는 닉네임
		                        $('.nickname_already').css("display","inline-block");
		                        $('.nickname_ok').css("display", "none");
//	 	                        alert("아이디를 다시 입력해주세요");
//	 	                        $('#managerId').val('');
		                        $("#submitbtn").attr("disabled", true);
		                    }
		                },
		                error:function(){
		                    alert("에러입니다");
		                }
		            });
		            };
        
        	var password = document.getElementById("managerPassword")
	        , confirm_password = document.getElementById("confirmManagerPassword");
	
        	function validatePassword(){
				if(password.value != confirm_password.value) {
					confirm_password.setCustomValidity("암호가 일치하지 않습니다.");
				} else {
					confirm_password.setCustomValidity(''); // 오류가 없으면 메시지를 빈 문자열로 설정해야한다. 오류 메시지가 비어 있지 않은 한 양식은 유효성 검사를 통과하지 않고 제출되지 않는다.
				}
			}
	
			password.onchange = validatePassword;
			confirm_password.onkeyup = validatePassword;
        </script>
    </body>
</html>