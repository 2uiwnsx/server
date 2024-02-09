<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
		<style>
			input[type="color"] {
				height: 40px;
			}
		</style>
	</head>
	<body>		
		<h1>버튼 생성</h1>
		
		<form method="POST" action="ex09_ok.jsp">
			<table class="vertical">
				<tr>
					<th>너비(px)</th>
					
					<td><input type="number" name="width" min="50" max="300" step="10" value="100"></td>
				</tr>
				<tr>
					<th>높이(px)</th>
					
					<td><input type="number" name="height" min="50" max="300" step="10" value="50"></td>
				</tr>
				<tr>
					<th>텍스트</th>
					
					<td><input type="text" name="text" value="Button"></td>
				</tr>
				<tr>
					<th>글자 크기(px)</th>
					
					<td><input type="number" name="fontSize" min="10" max="50" value="16"></td>
				</tr>
				<tr>
					<th>글자색</th>
					
					<td><input type="color" name="color" value="#000"></td>
				</tr>
				<tr>
					<th>배경색</th>
					
					<td><input type="color" name="bgColor" value="#FFF"></td>
				</tr>
				<tr>
					<th>개수</th>
					
					<td><input type="number" name="count" min="1" max="20" value="1"></td>
				</tr>
			</table>
			
			<div><input type="submit" value="생성"></div>
		</form>
	</body>
</html>