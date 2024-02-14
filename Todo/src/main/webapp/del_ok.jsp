<%@ page import="com.test.todo.DBUtil" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String seq = request.getParameter("seq");

	Connection conn = null;
	
	PreparedStatement stat = null;
	
	int result = 0;
	
	try {
		
		conn = DBUtil.open();
		
		String sql = "DELETE FROM tblTodo WHERE seq = ?";
		
		stat = conn.prepareStatement(sql);
		
		stat.setString(1, seq);
		
		result = stat.executeUpdate();
		
		stat.close();
		
		conn.close();
		
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
		<script>
			<%
				if (result == 1) {
			%>
					location.href = 'list.jsp';
			<%
				} else {
			%>
					alert('삭제에 실패했습니다.');
					
					location.href = 'add.jsp';
			<%
				}
			%>
		</script>
	</body>
</html>