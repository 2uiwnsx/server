<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
		<style>
			div > input {
				margin-bottom: 15px;
			}
		</style>
	</head>
	<body class="narrow">
		<div>
			<h1>Text</h1>
			
			<input type="button" id="btn1" value="클릭">
			
			<div id="result1"></div>
		</div>
		<div>
			<h1>XML</h1>
			
			<input type="button" id="btn2" value="클릭">
			
			<div id="result2"></div>
		</div>
		<div>
			<h1>JSON</h1>
			
			<input type="button" id="btn3" value="클릭">
			
			<div id="result3"></div>
		</div>
		
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
		<script>
			$('#btn1').click(function () {
				$.ajax({
					type: 'GET',
					url: '/ajax/ex04_data.do',
					dataType: 'text',
					/* data: 'type=1', */
					data: 'type=2',
					success: function (response) {
						/* $('#result1').text(response); */
						
						const list = response.split('\n');
						
						list.forEach(memo => {
							const item = memo.split(',');
							
							$('#result1').append('<div>' + item[0] + '</div>');
							$('#result1').append('<div>' + item[1] + '</div>');
							$('#result1').append('<div>' + item[2] + '</div>');
							$('#result1').append('<div>' + item[3] + '</div>');
							$('#result1').append('<div>' + item[4] + '</div>');
							$('#result1').append('<br>');
						});
					},
					error: function (jqXHR, textStatus, errorThrown) {
						console.log(jqXHR, textStatus, errorThrown);
					}
				});
			});
			
			$('#btn2').click(function () {
				$.ajax({
					type: 'GET',
					url: '/ajax/ex04_data.do',
					dataType: 'xml',
					/* data: 'type=3', */
					data: 'type=4',
					success: function (response) {
						/* $('#result2').append('<div>번호: ' + $(response).find('seq').text() + '</div>');
						$('#result2').append('<div>이름: ' + $(response).find('name').text() + '</div>');
						$('#result2').append('<div>비밀번호: ' + $(response).find('pswd').text() + '</div>');
						$('#result2').append('<div>메모: ' + $(response).find('memo > memo').text().replace('\n', '<br>') + '</div>');
						$('#result2').append('<div>날짜: ' + $(response).find('regdate').text() + '</div>'); */
						
						$(response).find('list > memo').each((index, memo) => {
							$('#result2').append('<div>' + $(memo).find('seq').text() + '</div>');
							$('#result2').append('<div>' + $(memo).find('name').text() + '</div>');
							$('#result2').append('<div>' + $(memo).find('pswd').text() + '</div>');
							$('#result2').append('<div>' + $(memo).find('memo > memo').text().replace('\n', '<br>') + '</div>');
							$('#result2').append('<div>' + $(memo).find('regdate').text() + '</div>');
							$('#result2').append('<br>');
						});
					},
					error: function (jqXHR, textStatus, errorThrown) {
						console.log(jqXHR, textStatus, errorThrown);
					}
				});
			});
			
			$('#btn3').click(function () {
				$.ajax({
					type: 'GET',
					url: '/ajax/ex04_data.do',
					dataType: 'json',
					/* data: 'type=5', */
					data: 'type=6',
					success: function (response) {
						/* $('#result3').append('<div>' + response.seq + '</div>');
						$('#result3').append('<div>' + response.name + '</div>');
						$('#result3').append('<div>' + response.pswd + '</div>');
						$('#result3').append('<div>' + response.memo + '</div>');
						$('#result3').append('<div>' + response.regdate + '</div>'); */
						
						$(response).each((index, memo) => {
							$('#result3').append('<div>' + memo.seq + '</div>');
							$('#result3').append('<div>' + memo.name + '</div>');
							$('#result3').append('<div>' + memo.pswd + '</div>');
							$('#result3').append('<div>' + memo.memo + '</div>');
							$('#result3').append('<div>' + memo.regdate + '</div>');
							$('#result3').append('<br>');
						});
					},
					error: function (jqXHR, textStatus, errorThrown) {
						console.log(jqXHR, textStatus, errorThrown);
					}
				});
			});
		</script>
	</body>
</html>