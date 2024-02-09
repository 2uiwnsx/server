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
		<h1>JSP Standard Tag Library</h1>
		
		<h2>변수</h2>
		
		<%
			int a = 10;
		
			pageContext.setAttribute("b", 20);
		%>

		<c:set var="c" value="30" />
		
		<div>a: <%= a %></div>
		<div>a: ${a}</div>
		
		<br>
		
		<div>b: <%= pageContext.getAttribute("b") %></div>
		<div>b: ${b}</div>
		
		<br>

		<div>c: <%= pageContext.getAttribute("c") %></div>
		<div>c: ${c}</div>
		
		<br>
		
		<c:set var="c" value="300" />
		
		<div>c: ${c}</div>
		
		<br>
		
		<c:remove var="c" />
		
		<div>c: ${c}</div>
		<div>c: ${empty c}</div>
		
		<h2>조건문</h2>
		
		<c:set var="num" value="10" />
		
		<div>num: ${num}</div>
		
		<c:if test="${num > 0}">
			<div>양수입니다.</div>
		</c:if>
		<c:if test="${num <= 0}">
			<div>양수가 아닙니다.</div>
		</c:if>
		
		<c:choose>
			<c:when test="${num > 0}">
				<div>양수입니다.</div>
			</c:when>
			<c:when test="${num < 0}">
				<div>음수입니다.</div>
			</c:when>
			<c:otherwise>
				<div>0입니다.</div>
			</c:otherwise>
		</c:choose>
		
		<h2>반복문</h2>
		
		<%
			for (int i = 0; i < 10; i++) {
		%>
				<div><%= i %></div>
		<%
			}
		%>
		
		<br>
		
		<c:forEach var="i" begin="0" end="9" step="1">
			<div>${i}</div>
		</c:forEach>
		
		<hr>
		
		<%
			String[] names = {"홍길동", "아무개", "하하하", "호호호", "후후후"};
		
			pageContext.setAttribute("names", names);
		%>
		
		<c:set var="n" value="0" />
		
		<table>
			<tr>
				<th>이름</th>
				<th>current</th>
				<th>n</th>
				<th>index</th>
				<th>count</th>
				<th>first</th>
				<th>last</th>
			</tr>
			<c:forEach var="name" items="${names}" varStatus="status">
				<tr>
					<td>${name}</td>
					<td>${status.current}</td>
					<td>${n}</td>
					<td>${status.index}</td>
					<td>${status.count}</td>
					<td>${status.first}</td>
					<td>${status.last}</td>
				</tr>
				
				<c:set var="n" value="${n + 1}" />
			</c:forEach>
		</table>
	</body>
</html>