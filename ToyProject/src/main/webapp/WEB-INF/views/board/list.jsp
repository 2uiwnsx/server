<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
		<style>
			form {
				text-align: center;
				margin-bottom: 20px;
			}
			th:first-child {
				width: 50px;
			}
			th:nth-child(2) {
				width: auto;
			}
			th:nth-child(3) {
				width: 70px;
			}
			th:nth-child(4) {
				width: 120px;
			}
			th:last-child {
				width: 50px;
			}
			td {
				text-align: center;
			}
			td:nth-child(2) {
				text-align: left;
			}
			.cmtCount {
				font-size: 12px;
			}
			.cmtCount::before {
				content: '';
			}
			.isNew {
				font-size: 14px;
				color: tomato;
			}
			#pageBar {
				text-align: center;
				margin: 20px 0 5px;
			}
		</style>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/inc/menu.jsp" %>
		
		<main id="main">
			<h1 class="sub">
				게시판
				
				<small>
					<c:if test="${map.search == 'n'}">
						목록
					</c:if>
					<c:if test="${map.search == 'y'}">
						검색 결과
					</c:if>
				</small>
			</h1>
			
			<form method="GET" action="/toy/board/list.do">
				<select name="column">
					<option value="subject">제목</option>
					<option value="content">내용</option>
					<option value="name">이름</option>
				</select>
				
				<input type="text" name="word" class="long" required>
				<input type="submit" value="검색">
			</form>

			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>이름</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.seq}</td>
						<td>
							<a href="/toy/board/view.do?seq=${dto.seq}">${dto.subject}</a>
							
							<c:if test="${dto.cmtCount > 0}">
								<span class="cmtCount">(${dto.cmtCount})</span>
							</c:if>
							
							<c:if test="${dto.isNew == 1}">
								<span class='isNew'>New</span>
							</c:if>
						</td>
						<td>${dto.name}</td>
						<td>${dto.regdate}</td>
						<td>${dto.readCount}</td>
					</tr>
				</c:forEach>
			</table>
			
			<div id="pageBar">${pageBar}</div>
			<div>
				<button type="button" class="list" onclick="location.href='/toy/board/list.do';">목록</button>
				
				<c:if test="${not empty id}">
					<button type="button" class="add primary" onclick="location.href='/toy/board/add.do';">등록</button>
				</c:if>
			</div>
		</main>
		
		<script>
			<c:if test="${map.search == 'y'}">
				$('select[name="column"]').val('${map.column}');
				
				$('input[name="word"]').val('${map.word}');
			</c:if>
		</script>
	</body>
</html>