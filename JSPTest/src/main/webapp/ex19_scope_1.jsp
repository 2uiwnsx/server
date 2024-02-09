<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	int a = 10;

	pageContext.setAttribute("b", 30);

	request.setAttribute("c", 40);

	session.setAttribute("d", 50);

	application.setAttribute("e", 60);
	
	/* response.sendRedirect("ex19_scope_2.jsp"); */
	
	/* pageContext.forward("ex19_scope_2.jsp"); */
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
		<style>
			a, input {
				margin-left: 17px;
			}
		</style>
	</head>
	<body>
		<h1>첫 번째 페이지</h1>
		
		<a href="ex19_scope_2.jsp?a=<%= a %>">두 번째 페이지</a>
		
		<hr>
		
		<input type="button" id="btn" value="두 번째 페이지">
		
		<hr>
		
		<form method="GET" action="ex19_scope_2.jsp">
			<input type="hidden" name="a" value="<%= a %>">
			<input type="submit" value="두 번째 페이지">
		</form>
		
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
		<script>
			$('#btn').click(function () {
				location.href = 'ex19_scope_2.jsp?a=<%= a %>';
			});
		</script>
	</body>
</html>