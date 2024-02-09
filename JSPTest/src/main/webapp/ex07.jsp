<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
	</head>
	<body>
		<h1>데이터 전송</h1>
		
		<h2>POST</h2>
		
		<form method="POST" action="ex07_ok.jsp">
			<div>문자 <input type="text" name="txt"></div>
			<div>숫자 <input type="text" name="num"></div>
			<div><input type="submit" value="전송"></div>
		</form>
		
		<h2>GET</h2>
		
		<form method="GET" action="ex07_ok.jsp">
			<div>문자 <input type="text" name="txt"></div>
			<div>숫자 <input type="text" name="num"></div>
			<div><input type="submit" value="전송"></div>
		</form>
	</body>
</html>