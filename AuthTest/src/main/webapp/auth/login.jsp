<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
	</head>
	<body>
		<h1>로그인</h1>
		
		<form method="POST" action="login_ok.jsp">
			<table class="vertical">
				<tr>
					<th>아이디</th>
					
					<td><input type="text" name="id" required></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					
					<td><input type="password" name="pswd" required></td>
				</tr>
			</table>
			
			<div><input type="submit" value="로그인"></div>
		</form>
	</body>
</html>