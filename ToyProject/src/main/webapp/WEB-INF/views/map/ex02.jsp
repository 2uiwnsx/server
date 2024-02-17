<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
	</head>
	<body>
		<h1>Map <small>이동 + 확대/축소</small></h1>
		
		<div><div id="map" style="width: 768px; height: 400px;"></div></div>
		
		<hr>

		<div>
			<input type="button" id="btn1" value="종각역으로 이동">
			<input type="button" id="btn2" value="역삼역으로 이동">
			<input type="button" id="btn3" value="잠실역으로 이동">
		</div>
		<div>
			<input type="button" id="btn4" value="확대">
			<input type="button" id="btn5" value="축소">
		</div>
		<div>
			<input type="button" id="btn6" value="이동 제어">
			<input type="button" id="btn7" value="확대/축소 제어">
		</div>

		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aeb679ca6f4fc37a18d0b8a659787e47"></script>
		<script>
			const container = document.getElementById('map');
			const options = {
				center: new kakao.maps.LatLng(37.499305, 127.033189),
				level: 3
			};
			
			const map = new kakao.maps.Map(container, options);
			
			map.setDraggable(false);
			map.setZoomable(false);
			
			$('#btn1').click(function () {
				const center = new kakao.maps.LatLng(37.570180, 126.983029);
				
				map.setCenter(center);
			});
			
			$('#btn2').click(function () {
				const center = new kakao.maps.LatLng(37.500640, 127.036370);
				
				map.panTo(center);
			});
			
			$('#btn3').click(function () {
				const center = new kakao.maps.LatLng(37.513275, 127.100110);
				
				map.panTo(center);
			});
			
			$('#btn4').click(function () {
				map.setLevel(map.getLevel() - 1);
			});
			
			$('#btn5').click(function () {
				map.setLevel(map.getLevel() + 1);
			});
			
			$('#btn6').click(function () {
				if (map.getDraggable()) {
					map.setDraggable(false);
					
					$(this).css('background-color', '#EFEFEF');
				} else {
					map.setDraggable(true);
					
					$(this).css('background-color', 'gold');
				}
			});
			
			$('#btn7').click(function () {
				if (map.getZoomable()) {
					map.setZoomable(false);
					
					$(this).css('background-color', '#EFEFEF');
				} else {
					map.setZoomable(true);
					
					$(this).css('background-color', 'gold');
				}
			});
		</script>
	</body>
</html>