<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
		<style>
			tr:first-child td:first-child {
				width: 170px;
				text-align: center;
			}
			th:nth-child(2), th:nth-child(4) {
				width: 90px;
			}
			td:nth-child(3), td:nth-child(5) {
				width: 195px;
			}
			tr:last-child td {
				padding: 20px 10px;
			}
			img {
				display: block;
				width: 150px;
				height: 180px;
				object-fit: cover;
				border: 1px solid #AAA;
				padding: 3px;
        		margin: 0 auto;
			}
		</style>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/inc/menu.jsp" %>
		
		<main id="main">
			<h1>회원 <small>정보</small></h1>
			
			<table>
				<tr>
					<td rowspan="3"><img src="/toy/asset/pic/${dto.pic}"></td>

					<th>아이디</th>
					
					<td>${id}</td>
					
					<th>등급</th>
					
					<td>${(lv == 1) ? '회원' : '관리자'}</td>
				</tr>
				<tr>
					<th>이름</th>
					
					<td>${name}</td>
					
					<th>이메일</th>
					
					<td>${dto.email}</td>
				</tr>
				<tr>
					<td colspan="4">${dto.intro}</td>
				</tr>
			</table>
		</main>
	</body>
</html>