<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>페이지를 찾을 수 없습니다...</title>
	</head>
	<body>
		<p>
		
		
		</p>
		<!--
			Failed URL: ${url}
			Exception:  ${exception.message}
			<c:forEach items="${exception.stackTrace}" var="ste">    ${ste} 
			</c:forEach>
		-->
		<script>
			var msg = '요청하신 페이지는 존재하지 않거나,\n' 
					+ '주소가 변경 또는 삭제되어 이용이 불가합니다.\n\n'
					+ '\'확인\'버튼을 누를 시 메인 페이지로 돌아갑니다.';
			alert(msg);
		</script>
	</body>
</html>