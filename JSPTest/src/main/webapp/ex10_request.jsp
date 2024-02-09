<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
		<style>
			a {
				margin-left: 17px;
			}
		</style>
	</head>
	<body>
		<h1>request 객체</h1>
		
		<p>getRequestURI() ➜ <%= request.getRequestURI() %></p>
		<p>getServerName() ➜ <%= request.getServerName() %></p>
		<p>getMethod() ➜ <%= request.getMethod() %></p>
		<p>getRemoteAddr() ➜ <%= request.getRemoteAddr() %></p>
		<p>getContextPath() ➜ <%= request.getContextPath() %></p>
		
		<!-- 상대 경로 -->
		<a href="ex09.jsp">9번 예제</a>
		
		<!-- 절대 경로 -->
		<a href="<%= request.getContextPath() %>/ex09.jsp">9번 예제</a>
	</body>
</html>