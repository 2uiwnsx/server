<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	</head>
	<body>
		<h1>Memo <small>JSP Model 2</small></h1>
		
		<form method="POST" action="/memo/edit_ok.do">
			<input type="hidden" name="seq" value="${dto.seq}">
			
			<table class="vertical">
				<tr>
					<th>이름</th>
					
					<td><input type="text" name="name" value="${dto.name}" required></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					
					<td><input type="password" name="pswd" required></td>
				</tr>
				<tr>
					<th>메모</th>
					
					<td><textarea name="memo" class="full" required>${dto.memo}</textarea></td>
				</tr>
			</table>
			
			<div>
				<input type="submit" value="수정">
				<input type="button" value="취소" onclick="location.href='/memo/list.do';">
			</div>
		</form>
	</body>
</html>