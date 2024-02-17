<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
		<style>
			#token {
				margin-left: 15px;
			}
		</style>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/inc/menu.jsp" %>
		
		<main id="main">
			<h1 class="sub">회원 <small>로그인</small></h1>
			
			<form method="POST" action="/toy/visitor/login.do">
				<table class="vertical">
					<tr>
						<th>아이디</th>
						
						<td><input type="text" name="id" class="short" required></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						
						<td><input type="password" name="pswd" class="short" required></td>
					</tr>
				</table>
				
				<div>
					<button type="submit" class="login primary">로그인</button>
					<button type="button" class="back" onclick="location.href='/toy/index.do';">취소</button>
				</div>
			</form>
		</main>
		
		<hr>
		
		<div id="token">
			<form method="POST" action="/toy/visitor/login.do">
				<input type="hidden" name="id" value="hong">
				<input type="hidden" name="pswd" value="1111">
				
				<button class="login primary">홍길동</button>
			</form>
			<form method="POST" action="/toy/visitor/login.do">
				<input type="hidden" name="id" value="test">
				<input type="hidden" name="pswd" value="1111">
				
				<button class="login primary">테스트</button>
			</form>
			<form method="POST" action="/toy/visitor/login.do">
				<input type="hidden" name="id" value="admin">
				<input type="hidden" name="pswd" value="1111">
				
				<button class="login primary">관리자</button>
			</form>
		</div>
	</body>
</html>