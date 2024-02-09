<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String fileName = request.getParameter("fileName");
	String originalFileName = request.getParameter("originalFileName");

	String path = application.getRealPath("/files") + "/" + fileName;
	String mimeType = application.getMimeType(path);

	if (mimeType == null) {
		
		mimeType = "application/octet-stream";
		
	}
	
	response.setContentType(mimeType);
	
	String userAgentHeader = request.getHeader("User-Agent");
	
	boolean isInternetExplorer = (userAgentHeader.indexOf("MSIE") > -1) || (userAgentHeader.indexOf("Trident") > -1);

	if (isInternetExplorer) {
		
		originalFileName = URLEncoder.encode(originalFileName, "UTF-8").replaceAll("/+", "%20");
		
	} else {
		
		originalFileName = new String(originalFileName.getBytes("UTF-8"), "iso-8859-1");
		
	}

	response.setHeader("Content-Disposition", "attachment; filename= " + originalFileName);

	ServletOutputStream outputStream = response.getOutputStream();
	
	FileInputStream inputStream = new FileInputStream(path);
	
	byte b[] = new byte[4096];
	
	int bytesRead;

	while ((bytesRead = inputStream.read(b, 0, b.length)) != -1) {
		
		outputStream.write(b, 0, bytesRead);
		
	}
	
	outputStream.flush();
	
	inputStream.close();
	
	outputStream.close();
%>