<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.io.File" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String path = application.getRealPath("/pic");
		
	File dir = new File(path);
	
	File[] list = dir.listFiles();

	Arrays.sort(list, ((o1, o2) -> o2.getName().compareTo(o1.getName())));
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
		<style>
			#list {
				display: grid;
				grid-template-columns: 1fr 1fr 1fr 1fr;
			}
			#list > .item {
				position: relative;
				top: 0;
				left: 0;
			}
			#list > .item > img {
				width: 180px;
				height:180px;
				object-fit: cover;
				border: 1px solid gray;
				padding: 3px;
			}
			#list > .item > div:last-child {
				display: none;
				font-size: 1.5rem;
				text-shadow: 0 0 1px #FFF;
				position: absolute;
				top: 5px;
				right: 15px;
				cursor: pointer;
			}
			#list > .item:hover > div:last-child {
				display: block;
			}
		</style>
	</head>
	<body>
		<h1>Image Viewer</h1>
	
		<div id="list">
			<%
				for (File file : list) {
			%>
					<div class="item">
						<img src="pic/<%= file.getName() %>">
						
						<div title="삭제" onclick="deleteImage('<%= file.getName() %>')">&times;</div>
					</div>
			<%
				}
			%>
		</div>

		<form method="POST" action="ex18_ok.jsp" enctype="multipart/form-data">
			<table>
				<tr>
					<th>이미지</th>
					
					<td><input type="file" name="attach" required></td>
				</tr>
			</table>
			
			<div><input type="submit" value="업로드"></div>
		</form>
			
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
		<script>
			function deleteImage(fileName) {
				if (confirm('삭제하시겠습니까?')) {
					location.href = 'ex18_del.jsp?fileName=' + fileName;
				}
			}
		</script>
	</body>
</html>