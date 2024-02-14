<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
		<style>
			#list {
				display: grid;
				grid-template-columns: repeat(3, 1fr);
				gap: 10px;
			}
			#list .item {
				border: 1px solid #CCC;
				cursor: pointer;
			}
			#list .item div {
				padding: 5px;
			}
			#list .item div:nth-child(odd) {
				background-color: #EEE;
			}
			#list .item div:nth-child(2) {
				height: 60px;
			}
		</style>
	</head>
	<body>
		<h1>Memo <small>JSP Model 2</small></h1>
		
		<div id="list">
			<c:forEach var="dto" items="${list}">
				<div class="item" onclick="location.href='/memo/view.do?seq=${dto.seq}';">
					<div>${dto.seq}. ${dto.name}</div>
					<div>${dto.memo}</div>
					<div>${dto.regdate}</div>
				</div>
			</c:forEach>
		</div>
		
		<div><input type="button" value="등록" onclick="location.href='/memo/add.do';"></div>
	</body>
</html>