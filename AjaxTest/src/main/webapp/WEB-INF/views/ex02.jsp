<!--
	▶ XMLHttpRequest 객체의 프로퍼티
	
		▷ readyState
						
			◆ 0 : UNSENT
			◆ 1 : OPENED
			◆ 2 : HEADERS_RECEIVED
			◆ 3 : LOADING
			◆ 4 : DONE
			
		▷ status
		
			◆ 200 : OK
			◆ 404 : Not Found
			◆ 405 : Method Not Allowed
			◆ 408 : Request Timeout
			◆ 500 : Internal Server Error
-->

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
			<input type="text" id="txt1">
			<input type="button" id="btn1" value="버튼1">
		</div>
		<div id="msg" class="message"></div>
		<div>
			<input type="text" id="txt2">
			<input type="button" id="btn2" value="버튼2">
		</div>
		
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
		<script>
			$('#btn1').click(function () {
				const ajax = new XMLHttpRequest();
				
				ajax.open('GET', '/ajax/ex02_data.do');
				
				ajax.send();
				
				ajax.onreadystatechange = function () {
					if ((ajax.readyState == 4) && (ajax.status == 200)) {
						$('#msg').append('<div>readyState: ' + ajax.readyState + '</div>');
						$('#msg').append('<div>status: ' + ajax.status + '</div>');
						
						$('#txt1').val(ajax.responseText);
					} else {
						if (ajax.readyState == 4) {
							alert('서버와의 통신이 불안정합니다.');
						}
					}
				};
			});
		</script>	
	</body>
</html>