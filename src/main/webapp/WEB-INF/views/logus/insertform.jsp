<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Log Us</title>
	</head>
	<body>
		<h1>회원가입</h1>
		<form action="insert" method="post">
			<table border="1">
				<tr>
					<th>ID</th>
					<td><input type="text" name="memberId"></td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input type="password" name="memberPassword"></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" name="memberNickname"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="memberName"></td>
				</tr>
				<tr>
					<th>EMAIL</th>
					<td><input type="text" name="memberEmail"></td>
				</tr>
				<tr>
					<th>PHONE</th>
					<td><input type="text" name="memberPhone"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="memberBirth"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<select name="memberSex">
							<option value="1">남성</option>
							<option value="2">여성</option>						
						</select>
					</td>
				</tr>
				<tr>
					<th>직업</th>
					<td>
						<select name="memberJob">
							<option value="학생">학생</option>
							<option value="취준생">취준생</option>
							<option value="직장인">직장인</option>
							<option value="주부">주부</option>
							<option value="기타">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>프로필</th>
					<td><input type="text" name="memberProfile"></td>
				</tr>
				<tr>
					<th>&nbsp;</th>
					<td>
						<input type="submit" value="저장"> 
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>