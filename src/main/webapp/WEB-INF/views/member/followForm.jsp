<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

		<p>팔로우 리스트</p>
		<br>
		<div>
			<c:forEach var="List" items="${followList}" varStatus="stat">
				<div>
				    <p class="card-text">${List.followingMemberId}<br>
				</div>
			</c:forEach>
		</div>
		
		<form action="./followinsert" method="post">	
			<div class="mb-3 row">
    			<label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
    		<div class="col-sm-10">
     	 		<input type="text" class="form-control-plaintext" id="staticEmail" name="followingMemberId">
  			</div>
    		</div>
			<div class="/followList" >
				<button type="submit">Send your message</button>
			</div>
  		</form>
	
	</body>
</html>

