<%@ include file="../header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style type="text/css">
		.sideber{
			width : 300px;
			height : 600px;
			float : left
			background-color: #383838
		}
		.container{
			width : 1000px;
			margin : 0px auto;
			background-color: #f7f7f7;	
		}
		#contents{
			margin : 0px ;
		}
		.title{
				margin : 0px;
				text-align : center;
		}
		
	</style>
	<title>Insert title here</title>
</head>
    <body>
    	<div class="container">
	    	<div class="title">
	    		<h1>My Page</h1>
	    	</div>
	     	<div class="menu">
	     	
	     		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		     		<div class="btn-group" role="group" aria-label="Basic radio toggle button group">

						<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" onclick="acyncMovePage('./updateMemberForm')" checked>
						<label class="btn btn-outline-primary" for="btnradio2">회원 수정</label>
						
						<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" onclick="acyncMovePage('./deleteMemberForm')">
						<label class="btn btn-outline-primary" for="btnradio3">탈퇴하기</label>
					</div>
		     	</div>
		     	<div id=contents></div>
	     	</div>
     	</div>
    </body>
    
    <script>
 
    function acyncMovePage(url){
        // ajax option
        var ajaxOption = {
                url : url,
                async : true,
                type : "POST",
                dataType : "html",
                cache : false
        };
        
        $.ajax(ajaxOption).done(function(data){
            // Contents 영역 삭제
            $('#contents').children().remove();
            // Contents 영역 교체
            $('#contents').html(data);
        });
    }
    
    
    
    
 
</script>
    
</html>