<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
	</head>
	<body>
		<h1>인증 및 허가</h1>
		
		<%
			if (session.getAttribute("auth") == null) {
		%>
				<fieldset><input type="button" value="로그인" onclick="location.href='auth/login.jsp';"></fieldset>
		<%
			} else {
		%>
				<fieldset>
					<input type="button" value="로그아웃" onclick="location.href='auth/logout_ok.jsp';">
						
					<div class="message">
						<div>아이디: <%= session.getAttribute("auth") %></div>
						<div>이름: <%= session.getAttribute("name") %></div>
						<div>등급: <%= session.getAttribute("lv").equals("1") ? "회원" : "관리자" %></div>
					</div>
				</fieldset>
		<%
			}
		%>
		
		<hr>
		
		<%
			if (session.getAttribute("auth") != null) {
		%>
				<div><a href="member/member.jsp">회원 페이지</a></div>
		<%
			} else {
		%>
				<div><a href="#!" onclick="alert('로그인한 회원만 접근 가능합니다.');">회원 페이지</a></div>
		<%
			}
		%>
		
		<hr>
		
		<%
			if (session.getAttribute("auth") != null) {
		%>
				<div><a href="member/member.jsp">회원 페이지</a></div>
		<%
			}
		%>
		
		<%
			if ((session.getAttribute("auth") != null) && session.getAttribute("lv").toString().equals("2")) {
		%>
				<div><a href="admin/admin.jsp">관리자 페이지</a></div>
		<%
			}
		%>
	</body>
</html>