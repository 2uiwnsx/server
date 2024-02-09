<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	session.setAttribute("a", 10);
	
	if (session.getAttribute("count") == null) {
		
		session.setAttribute("count", 1);
		
	} else {
		
		session.setAttribute("count", ((int)session.getAttribute("count") + 1));
	}
	
	application.setAttribute("b", 20);
	
	if (application.getAttribute("count") == null) {
		
		application.setAttribute("count", 1);
		
	} else {
		
		application.setAttribute("count", ((int)application.getAttribute("count") + 1));
		
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
	</head>
	<body>		
		<h1>session 객체</h1>
		
		<div>a: <%= session.getAttribute("a") %></div>
		<div>count: <%= session.getAttribute("count") %></div>
		
		<h1>application 객체</h1>
		
		<div>b: <%= application.getAttribute("b") %></div>
		<div>count: <%= application.getAttribute("count") %></div>
	</body>
</html>