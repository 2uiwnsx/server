<%@ page import="com.test.auth.DBUtil" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String id = request.getParameter("id");
	String pswd = request.getParameter("pswd");
	
	Connection conn = null;
	
	PreparedStatement stat = null;
	
	ResultSet rs = null;
	
	try {
		
		conn = DBUtil.open();
		
		String sql = "SELECT * FROM tblUser WHERE (id = ?) AND (pswd = ?)";
		
		stat = conn.prepareStatement(sql);
		
		stat.setString(1, id);
		stat.setString(2, pswd);
		
		rs = stat.executeQuery();
		
		if (rs.next()) {
			
			System.out.println("로그인에 성공했습니다.");
			
			session.setAttribute("auth", id);
			session.setAttribute("name", rs.getString("name"));
			session.setAttribute("lv", rs.getString("lv"));
			
			response.sendRedirect("../index.jsp");
			
		} else {
			
			System.out.println("로그인에 실패했습니다.");
			
			response.sendRedirect("login.jsp");
			
		}
		
		rs.close();
		
		stat.close();
		
		conn.close();
		
	} catch (Exception e) {
		
		e.printStackTrace();
		
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	</body>
</html>