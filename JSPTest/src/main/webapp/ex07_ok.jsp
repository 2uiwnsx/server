<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String txt = request.getParameter("txt");
	String num = request.getParameter("num");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
	</head>
	<body>	
		<h1>결과</h1>
	
		<div>문자: <%= txt %></div>
		<div>숫자: <%= num %></div>
	</body>
</html>