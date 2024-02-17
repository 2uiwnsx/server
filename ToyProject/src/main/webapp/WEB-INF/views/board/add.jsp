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
			<h1>게시판 <small>작성</small></h1>
			
			<form method="POST" action="/toy/board/add.do">
				<table class="vertical">
					<tr>
						<th>제목</th>
						
						<td><input type="text" name="subject" class="full" autofocus required></td>
					</tr>
					<tr>
						<th>내용</th>
						
						<td><textarea name="content" class="full" required></textarea></td>
					</tr>
				</table>
				
				<div>
					<button type="submit" class="add primary">등록</button>
					<button type="button" class="back" onclick="location.href='/toy/board/list.do';">취소</button>
				</div>
			</form>
		</main>
	</body>
</html>