<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header">
	<h1>
		<c:if test="${empty id}">
			<span>Toy</span>
		</c:if>
		<c:if test="${not empty id}">
			<span><span class="material-symbols-outlined">toys</span>.. Toy</span>
		</c:if>
			
		<span>Project</span>
	</h1>
	
	<nav>
		<a href="/toy/index.do">Home</a>
		<a href="/toy/board/list.do">Board</a>
		
		<c:if test="${empty id}">
			<a href="/toy/visitor/login.do">Login</a>
			<a href="/toy/visitor/register.do">Register</a>
		</c:if>
		<c:if test="${not empty id}">
			<a href="/toy/visitor/info.do">Info</a>
			<a href="/toy/visitor/logout.do">Logout</a>
			<a href="/toy/visitor/unregister.do">Unregister</a>
		</c:if>
	</nav>
</header>