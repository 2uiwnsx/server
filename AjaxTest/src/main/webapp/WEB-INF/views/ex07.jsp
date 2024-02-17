<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
		<style>
			<c:forEach var="dto" items="${list}">
				#${dto.catId} {
					top: ${dto.y}px;
					left: ${dto.x}px;
				}
			</c:forEach>
		</style>
	</head>
	<body>
		<img src="/ajax/images/catty01.png" id="cat1" class="cat">
		<img src="/ajax/images/catty02.png" id="cat2" class="cat">
		<img src="/ajax/images/catty03.png" id="cat3" class="cat">
		<img src="/ajax/images/catty04.png" id="cat4" class="cat">
		<img src="/ajax/images/catty05.png" id="cat5" class="cat">
		
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
		<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
		<script>
			$('.cat').draggable({
				stop: function (event, ui) {
					$.ajax({
						type: 'POST',
						url: '/ajax/ex07_data.do',
						data: {
							catId: this.id,
							x: ui.position.left,
							y: ui.position.top
						},
						error: function (jqXHR, textStatus, errorThrown) {
							console.log(jqXHR, textStatus, errorThrown);
						}
					});
				}
			});
		</script>
	</body>
</html>