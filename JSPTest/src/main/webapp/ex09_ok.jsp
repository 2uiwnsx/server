<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");

	String width = request.getParameter("width");
	String height = request.getParameter("height");
	String text = request.getParameter("text");
	String fontSize = request.getParameter("fontSize");
	String color = request.getParameter("color");
	String bgColor = request.getParameter("bgColor");
	int count = Integer.parseInt(request.getParameter("count"));
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			.btn {
				width: <%= width %>px;
				height: <%= height %>px;
				font-size: <%= fontSize %>px;
				color: <%= color %>;
				background-color: <%= bgColor %>;
			}
		</style>
	</head>
	<body>		
		<h1>결과</h1>
		
		<div>
			<%
				for (int i = 0; i < count; i++) {
			%>
					<button class="btn"><%= text %></button>
			<%
				}
			%>
		</div>
	</body>
</html>