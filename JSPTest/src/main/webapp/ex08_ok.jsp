<%@ page import="java.util.Arrays" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String txt1 = request.getParameter("txt");
	String txt2 = request.getParameter("txt2");
	
	if (txt2 != null) {
		
		txt2 = txt2.replace("\n", "<br>");
		
	}
	
	String pswd = request.getParameter("pswd");
	String cb1 = request.getParameter("cb1");
	String[] cb2 = request.getParameterValues("cb2");
	String rb = request.getParameter("rb");
	String sel1 = request.getParameter("sel1");
	String[] sel2 = request.getParameterValues("sel2");
	String txt3 = request.getParameter("txt3");
	String date = request.getParameter("date");
	String range = request.getParameter("range");
	String color = request.getParameter("color");
	String count = request.getParameter("count");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
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
		
		<h2>텍스트</h2>
		
		<div><%= txt1 %></div>
		
		<h2>텍스트</h2>
		
		<div><%= txt2 %></div>
		
		<h2>비밀번호</h2>
		
		<div><%= pswd %></div>
		
		<h2>체크박스</h2>
		
		<div><%= cb1 %></div>
		
		<h2>체크박스</h2>
		
		<div><%= Arrays.toString(cb2) %></div>
		
		<h2>라디오 버튼</h2>
		
		<div><%= rb %></div>
		
		<h2>셀렉트 박스</h2>
		
		<div><%= sel1 %></div>
		
		<h2>셀렉트 박스</h2>
		
		<div><%= Arrays.toString(sel2) %></div>
		
		<h2>숨겨진 요소</h2>
		
		<div><%= txt3 %></div>

		<h2>날짜</h2>
		
		<div><%= date %></div>
		
		<h2>범위</h2>
		
		<div><%= range %></div>
		
		<h2>색상</h2>
		
		<div style="background-color: <%= color %>;"><%= color %></div>
		
		<h2>숨겨진 요소</h2>
		
		<div><%= count %></div>
		
		<h2>아이디 &amp; 비밀번호</h2>
		
		<div><%= id %> &amp; <%= password %></div>
	</body>
</html>