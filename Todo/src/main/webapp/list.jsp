<%@ page import="com.test.todo.DBUtil" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	Connection conn = null;

	Statement stat = null;
	
	ResultSet rs = null;
	
	try {
		
		conn = DBUtil.open();
		
		stat = conn.createStatement();
		
		String sql = "SELECT * FROM tblTodo ORDER BY state, seq DESC";
		
		rs = stat.executeQuery(sql);
		
	} catch (Exception e) {
		
		e.printStackTrace();
		
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="inc/header.jsp" %>
		<%@ include file="inc/asset.jsp" %>
		<style>
			table td:first-child {
				width: 20px;
				text-align: center;
				border-right: 0;
			}
			table td:nth-child(2) {
				width: auto;
				border-right: 0;
				border-left: 0;
			}
			table td:last-child {
				width: 20px;
				text-align: center;
				border-left: 0;
			}
			table td:last-child > div {
				display: none;
				cursor: pointer;
			}
			table tr:hover td:last-child > div {
				display: block;
			}
		</style>
	</head>
	<body class="narrow">
		<h1>Todo <small>List</small></h1>
		
		<table>
			<%
				while (rs.next()) {
			%>
					<tr>
						<td><input type="checkbox" <% if (rs.getString("state").equals("y")) {out.print("checked");} %> onchange="editTodo(<%= rs.getString("seq") %>);"></td>
						<td>
							<%
								if (rs.getString("state").equals("n")) {
							%>
									<div><%= rs.getString("todo") %></div>
							<%
								} else {
							%>
									<div style="text-decoration: line-through;"><%= rs.getString("todo") %></div>
							<%
								}
							%>
						</td>
						<td><div onclick="deleteTodo(<%= rs.getString("seq") %>);">&times;</div></td>
					</tr>
			<%
				}
			%>
		</table>
		
		<div><button class="add" onclick="location.href='add.jsp';">등록</button></div>
		
		<script>
			function editTodo(seq) {
				location.href = 'edit_ok.jsp?seq=' + seq;
			}
			
			function deleteTodo(seq) {
				if (confirm('삭제하시겠습니까?')) {
					location.href = 'del_ok.jsp?seq=' + seq;
				}
			}
		</script>
	</body>
</html>
<%
	try {
		
		rs.close();
		
		stat.close();
		
		conn.close();
		
	} catch (Exception e) {
		
		e.printStackTrace();
		
	}
%>