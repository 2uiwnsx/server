<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="inc/header.jsp" %>
		<%@ include file="inc/asset.jsp" %>
	</head>
	<body class="narrow">
		<h1>Todo <small>List</small></h1>
		
		<form method="POST" action="add_ok.jsp">
			<table>
				<tr>
					<th>할일</th>
					
					<td><input type="text" name="todo" class="long" required></td>
				</tr>
			</table>
			
			<div>
				<button class="add">등록</button>
				<button type="button" class="back" onclick="location.href='list.jsp';">취소</button>
			</div>
		</form>
	</body>
</html>