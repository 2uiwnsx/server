<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
	</head>
	<body>
		<form id="form">
			<table class="vertical">
				<tr>
					<th>이름</th>
					
					<td><input type="text" name="name" id="name" value="홍길동"></td>
				</tr>
				<tr>
					<th>나이</th>
					
					<td><input type="text" name="age" id="age" value="20"></td>
				</tr>
				<tr>
					<th>성별</th>
					
					<td>
						<input type="radio" name="gender" id="gender1" value="m" checked>남자
						<input type="radio" name="gender" id="gender2" value="f">여자
					</td>
				</tr>
				<tr>
					<th>주소</th>
					
					<td><input type="text" name="address" id="address" value="서울시 강남구 역삼동"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					
					<td><input type="text" name="tel" id="tel" value="010-1234-5678"></td>
				</tr>
			</table>
			
			<div><input type="button" id="btn" value="확인"></div>
		</form>
		
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
		<script>
			$('#btn').click(function () {
				/* $.ajax({
					type: 'POST',
					url: '/ajax/ex05_data.do',
					data: 'name=' + $('#name').val() + '&age=' + $('#age').val() + '&gender=' + $('input[name="gender"]:checked').val() + '&address=' + $('#address').val() + '&tel=' + $('#tel').val(),
					error: function (jqXHR, textStatus, errorThrown) {
						console.log(jqXHR, textStatus, errorThrown);
					}
				}); */
				
				/* $.ajax({
					type: 'POST',
					url: '/ajax/ex05_data.do',
					data: {
						name: $('#name').val(),
						age: $('#age').val(),
						gender: $('input[name="gender"]:checked').val(),
						address: $('#address').val(),
						tel: $('#tel').val()
					},
					error: function (jqXHR, textStatus, errorThrown) {
						console.log(jqXHR, textStatus, errorThrown);
					}
				}); */
				
				$.ajax({
					type: 'POST',
					url: '/ajax/ex05_data.do',
					data: $('#form').serialize(),
					error: function (jqXHR, textStatus, errorThrown) {
						console.log(jqXHR, textStatus, errorThrown);
					}
				});
			});
		</script>
	</body>
</html>