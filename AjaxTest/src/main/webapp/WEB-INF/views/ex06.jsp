<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
	</head>
	<body>
		<h1>아이디 중복 검사</h1>
		
		<table class="vertical">
			<tr>
				<th>이름</th>
				
				<td><input type="text"></td>
			</tr>
			<tr>
				<th>아이디</th>
				
				<td>
					<input type="text" id="id" class="short">
					<input type="button" id="btn" value="검사">
					
					<br>
					
					<span id="result"></span>
				</td>
			</tr>
		</table>
		
		<div><input type="button" id="regBtn" value="가입" disabled onclick="alert('가입에 성공했습니다.');"></div>
		
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
		<script>
			$('#btn').click(function () {
				$.ajax({
					type: 'POST',
					url: '/ajax/ex06_data.do',
					dataType: 'json',
					data: {
						id: $('#id').val()
					},
					success: function (response) {
						if (response.result == 0) {
							$('#result').text('사용 가능한 아이디입니다.');
							
							$('#regBtn').prop('disabled', false);
						} else {
							$('#result').text('이미 사용 중인 아이디입니다.');
							
							$('#regBtn').prop('disabled', true);
						}
					},
					error: function (jqXHR, textStatus, errorThrown) {
						console.log(jqXHR, textStatus, errorThrown);
					}
				});
			});
			
			$('#id').change(function () {
				$('#regBtn').prop('disabled', true);
			});
		</script>
	</body>
</html>