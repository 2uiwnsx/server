<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	</head>
	<body>
		<h1>Memo <small>JSP Model 2</small></h1>
		
		<script>
			<c:if test="${result == 0}">
				alert('등록에 실패했습니다.');

				history.back();
			</c:if>
			<c:if test="${result == 1}">
				location.href = '/memo/list.do';
			</c:if>
		</script>
	</body>
</html>