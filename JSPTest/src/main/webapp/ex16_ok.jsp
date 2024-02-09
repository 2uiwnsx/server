<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");

	String path = application.getRealPath("/files");
	
	int size = 1024 * 1024 * 100;
	
	String name = "";
	String age = "";
	String fileName = "";
	String originalFileName = "";

	try {

		MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		
		name = multi.getParameter("name");
		age = multi.getParameter("age");
		fileName = multi.getFilesystemName("attach");
		originalFileName = multi.getOriginalFileName("attach");
		
	} catch (Exception e) {
		
		e.printStackTrace();
		
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
		<h1>결과</h1>
		
		<div>이름: <%= name %></div>
		<div>나이: <%= age %></div>
		<div>파일명: <%= fileName %></div>
		<div>파일명: <%= originalFileName %></div>
		
		<h2>파일 다운로드</h2>

		<div><a href="/jsp/files/<%= fileName %>"><%= originalFileName %></a></div>
		<div><a href="/jsp/files/<%= fileName %>" download><%= originalFileName %></a></div>
		<div><a href="download.jsp?fileName=<%= fileName %>&originalFileName=<%= originalFileName %>"><%= originalFileName %></a></div>
	</body>
</html>