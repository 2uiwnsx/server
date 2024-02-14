<%@ page import="com.test.todo.DBUtil" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String todo = request.getParameter("todo");
	
	Connection conn = null;
	
	PreparedStatement stat = null;
	
	int result = 0;
	
	try {
		
		conn = DBUtil.open();
		
		String sql = "INSERT INTO tblTodo(seq, todo, state, regdate) VALUES (todoSeq.NEXTVAL, ?, DEFAULT, DEFAULT)";
		
		stat = conn.prepareStatement(sql);
		
		stat.setString(1, todo);
		
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
	<body class="narrow">
		<h1>Todo <small>List</small></h1>
		
		<%
			if (result == 1) {
		%>
				<div class="message">등록에 성공했습니다.</div>
				<div><a href="list.jsp">목록</a></div>
		<%
			} else {
		%>
				<div class="message">등록에 실패했습니다.</div>
				<div><a href="add.jsp">이전</a></div>
		<%
			}
		%>
	</body>
</html>