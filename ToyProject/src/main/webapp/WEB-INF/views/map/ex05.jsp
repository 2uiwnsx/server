<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
		<style>
			#list {
				display: grid;
				grid-template-columns: repeat(4, 1fr);
				gap: 10px;
			}
			#list .item {
				display: flex;
				align-items: center;
				border: 1px solid #CCC;
				border-radius: 5px;
				padding: 5px 10px;
			}
			#list .item img {
				height: 35px;
				margin: 7px;
			}
		</style>
	</head>
	<body class="wide">
		<h1>Map</h1>
		
		<div><div id="map" style="width: 1168px; height: 400px;"></div></div>
		
		<hr>
		
		<h3>Place</h3>
		
		<div id="list">
			<c:forEach var="dto" items="${list}">
				<div id="item${dto.seq}" class="item">
					<img src="/toy/asset/marker/${dto.category}.png">
					
					<span>${dto.name}</span>
				</div>
			</c:forEach>
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
			
			const pList = [];
			
			const imageSize = new kakao.maps.Size(40, 40);
			const option = {};

			<c:forEach var="dto" items="${list}" varStatus="status">
				const m${status.count} = new kakao.maps.Marker({
					position: new kakao.maps.LatLng(${dto.lat}, ${dto.lng})
				});
				
				m${status.count}.seq = ${dto.seq};
				
				m${status.count}.setMap(map);
				
				pList.push({
					seq: ${dto.seq},
					lat: ${dto.lat},
					lng: ${dto.lng}
				});
			
				const imageUrl${status.count} = '/toy/asset/marker/${dto.category}.png';

				const image${status.count} = new kakao.maps.MarkerImage(imageUrl${status.count}, imageSize, option);
				
				m${status.count}.setImage(image${status.count});
				
				kakao.maps.event.addListener(m${status.count}, 'click', function (evt) {
					$('#map > div > div > div > div > img').css('opacity', '0.3');
					
					$(event.target).css('opacity', '1');
					
					selPlace(this.seq);
				});
			</c:forEach>
			
			function selPlace(seq) {
				$('#list .item').css('background-color', 'transparent');
				
				$('#list #item' + seq).css('background-color', 'gold');
			}
			
			function clear() {
				$('#map > div > div > div > div > img').css('opacity', '1');
				
				$('#list .item').css('background-color', 'transparent');
			}
			
			kakao.maps.event.addListener(map, 'click', function (evt) {
				clear();
			});
			
			window.onkeydown = function () {
				if (event.keyCode == 27) {
					clear();
				}
			};
			
			function contain(lat, lng) {
				const ne = map.getBounds().getNorthEast();
				const sw = map.getBounds().getSouthWest();
				
				if (((lat >= sw.getLat()) && (lat <= ne.getLat())) && ((lng >= sw.getLng()) && (lng <= ne.getLng()))) {
					return true;
				} else {
					return false;
				}
			}
			
			kakao.maps.event.addListener(map, 'dragend', function (evt) {
				$(pList).each((index, item) => {
					if (contain(item.lat, item.lng)) {
						$('#list #item' + item.seq).show();
					} else {
						$('#list #item' + item.seq).hide();
					}
				});
			});
			
			kakao.maps.event.addListener(map, 'zoom_changed', function (evt) {
				$(pList).each((index, item) => {
					if (contain(item.lat, item.lng)) {
						$('#list #item' + item.seq).show();
					} else {
						$('#list #item' + item.seq).hide();
					}
				});
			});
		</script>
	</body>
</html>