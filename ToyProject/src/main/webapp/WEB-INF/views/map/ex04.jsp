<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
		<style>
			#main {
				display: flex;
				align-items: flex-start;
			}
			#main table {
				width: 384px;
				margin: 0 16px;
				margin-bottom: 10px;
			}
			#list td {
				cursor: pointer;
			}
			#list td span:last-child {
				display: none;
				float: right;
			}
			#list td:hover span:last-child {
				display: inline;
			}
		</style>
	</head>
	<body class="wide">
		<h1>Map <small>즐겨찾기</small></h1>
		
		<div id="main">
			<div id="map" style="width: 768px; height: 400px;"></div>
			<div>
				<table>
					<tr>
						<td>
							<select name="category" id="category">
								<option value="default">기본</option>
								<option value="cafe">카페</option>
								<option value="food">식당</option>
								<option value="private">개인</option>
							</select>
							
							<input type="text" name="name" id="name" class="middle">
							<input type="button" id="btn" value="등록">
						</td>
					</tr>
				</table>
				<table id="list">
					<tbody>
					</tbody>
				</table>
			</div>
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
			
			function load() {
				$.ajax({
					type: 'GET',
					url: '/toy/map/list.do',
					dataType: 'json',
					success: function (response) {
						$('#list tbody').html('');
						
						$(response).each((index, item) => {
							$('#list tbody').append(`
								<tr>
									<td onclick="selPlace('\${item.category}', \${item.lat}, \${item.lng});">
										<span>\${item.name}</span>
										<span title="삭제" onclick="delPlace(\${item.seq});">&times;</span>
									</td>
								</tr>
							`);
						});
					},
					error: function (jqXHR, textStatus, errorThrown) {
						console.log(jqXHR, textStatus, errorThrown);
					}
				});
			}
			
			load();
			
			let m = null;
			
			function selPlace(category, lat, lng) {
				$('#list td').css('background-color', 'transparent');
				
				$(event.currentTarget).css('background-color', 'gold');
				
				map.panTo(new kakao.maps.LatLng(lat, lng));
				
				if (m != null) {
					m.setMap(null);
				}
				
				m = new kakao.maps.Marker({
					position: new kakao.maps.LatLng(lat, lng)
				});
				
				m.setMap(map);
				
				let imageUrl = '/toy/asset/marker/' + category + '.png';
				let imageSize = new kakao.maps.Size(40, 40);
				let option = {};
				
				let markerImage = new kakao.maps.MarkerImage(imageUrl, imageSize, option);
			
				m.setImage(markerImage);
			}
			
			function delPlace(seq) {
				$.ajax({
					type: 'POST',
					url: '/toy/map/del_place.do',
					dataType: 'json',
					data: {
						seq: seq
					},
					success: function (response) {
						if (response.result == 1) {
							if (m != null) {
								m.setMap(null);
							}
							
							load();
						} else {
							alert('삭제에 실패했습니다.');
						}
					},
					error: function (jqXHR, textStatus, errorThrown) {
						console.log(jqXHR, textStatus, errorThrown);
					}
				});
				
				event.stopPropagation();
			}
			
			let lat = null;
			let lng = null;
			
			kakao.maps.event.addListener(map, 'click', function (evt) {
				if (m != null) {
					m.setMap(null);
				}
				
				lat = evt.latLng.getLat();
				lng = evt.latLng.getLng();
				
				m = new kakao.maps.Marker({
					position: new kakao.maps.LatLng(lat, lng)
				});
				
				m.setMap(map);
				
				let imageUrl = '/toy/asset/marker/' + $('#category').val() + '.png';
				let imageSize = new kakao.maps.Size(40, 40);
				let option = {};
				
				let markerImage = new kakao.maps.MarkerImage(imageUrl, imageSize, option);
				
				m.setImage(markerImage);
			});
			
			$('#category').change(function () {
				if (m != null) {
					let imageUrl = '/toy/asset/marker/' + $('#category').val() + '.png';
					let imageSize = new kakao.maps.Size(40, 40);
					let option = {};
					
					let markerImage = new kakao.maps.MarkerImage(imageUrl, imageSize, option);
				
					m.setImage(markerImage);
				}
			});
			
			$('#btn').click(function () {
				$.ajax({
					type: 'POST',
					url: '/toy/map/add_place.do',
					dataType: 'json',
					data: {
						category: $('#category').val(),
						name: $('#name').val(),
						lat: lat,
						lng: lng
					},
					success: function (response) {
						if (response.result == 1) {
							$('#category').val('default');
							
							$('#name').val('');
							
							load();
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