<%@ page import="com.test.jsp.MyMath" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
	MyMath m = new MyMath();

	public int sum(int a, int b) {
		
		return (a + b);
		
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div><%= 10 + 20 %></div>
		<div><%= m.sum(10, 20) %></div>
		<div><%= sum(10, 20) %></div>
	</body>
</html>