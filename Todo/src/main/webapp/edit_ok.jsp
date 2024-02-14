<%@ page import="com.test.todo.DBUtil" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String seq = request.getParameter("seq");
	
	Connection conn = null;
	
	PreparedStatement stat = null;
	
	ResultSet rs = null;
	
	try {
		
		conn = DBUtil.open();
		
		String sql = "SELECT state FROM tblTodo WHERE seq = ?";
		
		stat = conn.prepareStatement(sql);
		
		stat.setString(1, seq);
		
		rs = stat.executeQuery();
		
		String state = "";
		
		if (rs.next()) {
			
			state = rs.getString("state");
			
		}
		
		if (state.equals("n")) {
			
			state = "y";
			
		} else {
			
			state = "n";
			
		}
		
		sql = "UPDATE tblTodo SET state = ? WHERE seq = ?";
		
		stat = conn.prepareStatement(sql);
		
		stat.setString(1, state);
		stat.setString(2, seq);
		
		int result = stat.executeUpdate();
		
		stat.close();
		
		conn.close();
		
		if (result == 1) {
			
			response.sendRedirect("list.jsp");
			
		} else {
			
			out.println("<script>");
			out.println("alert('수정에 실패했습니다.');");
			out.println("location.href='list.jsp';");
			out.println("</script>");
			
		}
		
	} catch (Exception e) {
		
		e.printStackTrace();
		
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="inc/header.jsp" %>
		<%@ include file="inc/asset.jsp" %>
	</head>
	<body>
	</body>
</html>