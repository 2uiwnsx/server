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
		
		<table class="vertical">
			<tr>
				<th>번호</th>
				
				<td>${dto.seq}</td>
			</tr>
			<tr>
				<th>이름</th>
				
				<td>${dto.name}</td>
			</tr>
			<tr>
				<th>메모</th>
				
				<td>${dto.memo}</td>
			</tr>
			<tr>
				<th>날짜</th>
				
				<td>${dto.regdate}</td>
			</tr>
		</table>
		
		<div>
			<input type="button" value="이전" onclick="location.href='/memo/list.do';">
			<input type="button" value="수정" onclick="location.href='/memo/edit.do?seq=${dto.seq}';">
			<input type="button" value="삭제" onclick="location.href='/memo/del.do?seq=${dto.seq}';">
		</div>
	</body>
</html>