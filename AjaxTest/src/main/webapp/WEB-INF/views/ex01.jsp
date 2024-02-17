<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
	</head>
	<body>
		<div>
			<input type="text" id="txt1" value="${count}">
			<input type="button" id="btn1" value="버튼1">
		</div>
		<div>
			<input type="text" id="txt2">
			<input type="button" id="btn2" value="버튼2">
		</div>
		
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
		<script>
			$('#btn1').click(function () {
				location.href = '/ajax/ex01_data.do';
			});
		</script>	
	</body>
</html>