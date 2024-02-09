<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String path = application.getRealPath("/files");

	int size = 1024 * 1024 * 100;
	
	ArrayList<String> fileName = new ArrayList<String>();
	
	ArrayList<String> originalFileName = new ArrayList<String>();
	
	try {
		
		MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

		fileName.add(multi.getFilesystemName("attach1"));
		
		originalFileName.add(multi.getOriginalFileName("attach1"));
		
		fileName.add(multi.getFilesystemName("attach2"));
		
		originalFileName.add(multi.getOriginalFileName("attach2"));
		
		fileName.add(multi.getFilesystemName("attach3"));
		
		originalFileName.add(multi.getOriginalFileName("attach3"));
		
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
		<h1>파일 다운로드</h1>
		
		<%
			for (int i = 0; i < 3; i++) {
		%>
				<div><a href="download.jsp?fileName=<%= fileName.get(i) %>&originalFileName=<%= originalFileName.get(i) %>"><%= originalFileName.get(i) %></a></div>
		<%
			}
		%>
	</body>
</html>