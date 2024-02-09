<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String name = "홍길동";
	int age = 20;
	String txt = "<input type=\"text\">";
	String color = "cornflowerblue";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			div {
				color: <%= color %>;
			}
		</style>
	</head>
	<body>
		<h1>스크립트릿 + 표현식</h1>
		
		<div>이름: <%= name %></div>
		<div>나이: <%= age %></div>
		<div><%= txt %></div>
		<div><input type="text" value="<%= color %>"></div>
		
		<input type="button" id="btn" value="버튼">
		
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
		<script>
			document.getElementById('btn').onclick = function () {
				alert('<%= color %>');
			};
		</script>
	</body>
</html>