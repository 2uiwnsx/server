<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	if ((session.getAttribute("auth") == null) || session.getAttribute("lv").equals("1")) {

		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("</head>");
		out.println("<body>");
		out.println("<script>");
		out.println("alert('관리자만 접근 가능합니다.');");
		out.println("location.href='../index.jsp';");
		out.println("</script>");
		out.println("</body>");
		out.println("</html>");
		
		out.close();
		
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
	</head>
	<body>		
		<h1>관리자 페이지</h1>
		
		<p>관리자만 접근 가능한 페이지입니다.</p>
	</body>
</html>