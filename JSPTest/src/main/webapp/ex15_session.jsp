<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	Calendar time = Calendar.getInstance();

	time.setTimeInMillis(session.getCreationTime());
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
	</head>
	<body>
		<h1>세션(Session)</h1>
		
		<div class="list">
			<div><a href="ex15_set.jsp">데이터 저장</a></div>
			<div><a href="ex15_del.jsp">데이터 삭제</a></div>
			<div><a href="ex15_reset.jsp">초기화</a></div>
			<div><a href="ex15_interval.jsp">유효 시간 설정</a></div>
		</div>
		
		<hr>
		
		<h2>세션 정보</h2>
		
		<div>getId() ➜ <%= session.getId() %></div>
		<div>
			getCreationTime() ➜
			
			<%				
				out.println(String.format("%tF %tT", time, time));
			%>
		</div>
		<div>getMaxInactiveInterval() ➜ <%= session.getMaxInactiveInterval() %></div>
		<div>isNew() ➜ <%= session.isNew() %></div>
		<div>
			getAttribute("data") ➜
			
			<% 
				if (session.getAttribute("data") != null) {
					
					out.println(session.getAttribute("data"));
					
				} else {
					
					out.println("데이터가 존재하지 않습니다.");
					
				}
			%>
		</div>
	</body>
</html>