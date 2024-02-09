<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	int dan = 2;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
	</head>
	<body>		
		<h1>out 객체</h1>
		
		<h2>스크립트릿 + 표현식</h2>
		
		<%
			for (int i = 1; i <= 9; i++) {
		%>
				<div><%= dan %> &times; <%= i %> = <%= dan * i %></div>
		<%
			}
		%>
		
		<h2>스크립트릿 + out 객체</h2>
		
		<%
			for (int i = 1; i <= 9; i++) {
				
				out.println(String.format("<div>%d %s %d = %d</div>", dan, "\u00D7", i, (dan * i)));
				
			}
		%>
	</body>
</html>