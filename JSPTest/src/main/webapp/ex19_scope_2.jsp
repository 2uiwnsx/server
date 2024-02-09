<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String a = request.getParameter("a");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
	</head>
	<body>
		<h1>두 번째 페이지</h1>

		<p>지역 변수: <%= a %></p>
		<p>pageContext 객체: <%= pageContext.getAttribute("b") %></p>
		<p>request 객체: <%= request.getAttribute("c") %></p>
		<p>session 객체: <%= session.getAttribute("d") %></p>
		<p>application 객체: <%= application.getAttribute("e") %></p>
	</body>
</html>