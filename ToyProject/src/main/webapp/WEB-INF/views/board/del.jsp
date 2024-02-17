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
			<h1>게시판 <small>삭제</small></h1>
			
			<form method="POST" action="/toy/board/del.do">
				<input type="hidden" name="seq" value="${seq}">
				
				<div>
					<button type="button" class="back" onclick="location.href='/toy/board/view.do?seq=${seq}';">이전</button>
					<button type="submit" class="del primary">삭제</button>
				</div>
			</form>
		</main>
	</body>
</html>