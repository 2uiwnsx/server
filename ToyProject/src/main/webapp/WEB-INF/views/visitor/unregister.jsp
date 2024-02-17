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
			<h1 class="sub">회원 <small>탈퇴</small></h1>
			
			<form method="POST" action="/toy/visitor/unregister.do">
				<div>
					<button type="button" class="back" onclick="location.href='/toy/index.do';">이전</button>
					<button type="submit" class="out primary">탈퇴</button>
				</div>
			</form>
		</main>
	</body>
</html>