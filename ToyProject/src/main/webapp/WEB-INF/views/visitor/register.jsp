<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/inc/menu.jsp" %>
		
		<main id="main">
			<h1 class="sub">회원 <small>가입</small></h1>
			
			<form method="POST" action="/toy/visitor/register.do" enctype="multipart/form-data">
				<table class="vertical">
					<tr>
						<th>아이디</th>
						
						<td><input type="text" name="id" class="short" required></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						
						<td><input type="password" name="pswd" class="short" required></td>
					</tr>
					<tr>
						<th>이름</th>
						
						<td><input type="text" name="name" class="short" required></td>
					</tr>
					<tr>
						<th>이메일</th>
						
						<td><input type="text" name="email" class="long" required></td>
					</tr>
					<tr>
						<th>사진</th>
						
						<td><input type="file" name="pic" class="long"></td>
					</tr>
					<tr>
						<th>자기소개</th>
						
						<td><textarea name="intro" class="long" required></textarea></td>
					</tr>
				</table>
				
				<div>
					<button type="submit" class="add primary">가입</button>
					<button type="button" class="back" onclick="location.href='/toy/index.do';">취소</button>
				</div>
			</form>
		</main>
	</body>
</html>