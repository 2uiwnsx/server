<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
	</head>
	<body>
		<h1>Map <small>클릭 이벤트 + 마커 생성</small></h1>
		
		<div><div id="map" style="width: 768px; height: 400px;"></div></div>
		<div><div class="message"></div></div>
		
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
			
			<c:forEach var="dto" items="${list}" varStatus="status">
				const m${status.count} = new kakao.maps.Marker({
					position: new kakao.maps.LatLng(${dto.lat}, ${dto.lng})
				});
			    
			    m${status.count}.setMap(map);
			</c:forEach>
			
			kakao.maps.event.addListener(map, 'click', function (evt) {
			    let msg = `클릭한 위치: (\${evt.latLng.getLat()}, \${evt.latLng.getLng()})`;
			    
			    $('.message').text(msg);

			    $.ajax({
			    	type: 'POST',
			    	url: '/toy/map/add_marker.do',
			    	dataType: 'json',
			    	data: {
			    		lat: evt.latLng.getLat(),
			    		lng: evt.latLng.getLng()
			    	},
			    	success: function (response) {
			    		if (response.result == 1) {
			    			const m = new kakao.maps.Marker({
								position: new kakao.maps.LatLng(evt.latLng.getLat(), evt.latLng.getLng())
							});
						    
						    m.setMap(map);
			    		} else {
			    			alert('등록에 실패했습니다.');
			    		}
			    	},
			    	error: function (jqXHR, textStatus, errorThrown) {
						console.log(jqXHR, textStatus, errorThrown);
					}
			    });
			});
		</script>
	</body>
</html>