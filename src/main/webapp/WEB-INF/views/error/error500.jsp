<%@ page contentType="text/html; charset=UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
	//request.setCharacterEncoding("utf-8");
	request.setAttribute("status", response.getStatus());
	//response.setStatus(200);
%> --%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" http-equiv="refresh" content="0;url=<c:url value='/error'/>">
		<title>요청하신 작업이 정상처리되지 않았습니다...</title>
	</head>
	<body>
		<%-- <p>
		${url}<br>
		확인<br>
		${status}<br>
		${exception.message}<br>
		</p>
		<!--
			Failed URL: ${url}
			Exception:  ${exception.message}
			<c:forEach items="${exception.stackTrace}" var="ste">    ${ste} 
			</c:forEach>
		--> --%>
		<script>
			var msg = '요청하신 작업이 정상적으로 처리되지 않았습니다.\n' 
					+ '이용에 불편을 드려 대단히 죄송합니다.\n'
					+ '동일한 문제가 지속적으로 발생할 경우 고객센터로 문의 바랍니다.\n\n'
					+ '\'확인\'버튼을 누를 시 메인 페이지로 돌아갑니다.';
			alert(msg);
		</script>
	</body>
</html>