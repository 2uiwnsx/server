<%@ page import="com.test.jsp.Score" %>
<%@ page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
	</head>
	<body>		
		<h1>Expression Language</h1>

		<h2>표현식</h2>
		
		<%
			int a = 10;
		
			pageContext.setAttribute("b", 20);
			
			request.setAttribute("c", 30);
		%>
		
		<div>a: <%= a %></div>
		<div>b: <%= pageContext.getAttribute("b") %></div>
		<div>c: <%= request.getAttribute("c") %></div>

		<h2>EL</h2>
		
		<div>a: ${a}</div>
		<div>b: ${b}</div>
		<div>c: ${c}</div>
		
		<hr>
		
		<h2>연산</h2>

		<div>b + 10 = ${b + 10}</div>
		
		<br>
		
		<div>b - 10 = ${b - 10}</div>
		
		<br>
		
		<div>b * 10 = ${b * 10}</div>
		
		<br>
		
		<div>b / 10 = ${b / 10}</div>
		
		<br>
		
		<div>b % 10 = ${b % 10}</div>
		<div>b % 10 = ${b mod 10}</div>
		
		<hr>
		
		<div>b &gt; 10 = ${b > 10}</div>
		<div>b &gt; 10 = ${b gt 10}</div>

		<br>
		
		<div>b &lt; 10 = ${b < 10}</div>
		<div>b &lt; 10 = ${b lt 10}</div>
		
		<br>
		
		<div>b &gt;= 10 = ${b >= 10}</div>
		<div>b &gt;= 10 = ${b ge 10}</div>

		<br>
		
		<div>b &lt;= 10 = ${b <= 10}</div>
		<div>b &lt;= 10 = ${b le 10}</div>
		
		<br>
		
		<div>b == 10 = ${b == 10}</div>
		<div>b == 10 = ${b eq 10}</div>

		<br>
		
		<div>b != 10 = ${b != 10}</div>
		<div>b != 10 = ${b ne 10}</div>
		
		<hr>

		<div>${true && true}</div>
		<div>${true and true}</div>
		
		<br>

		<div>${true || true}</div>
		<div>${true or true}</div>
		
		<br>
		
		<div>${!true}</div>
		<div>${not true}</div>
		
		<hr>
		
		<div>${(b > 0) ? "양수" : "음수"}</div>
		
		<hr>
		
		<div>${"문자열" == "문자열"}</div>
		<div>${"문자열" == '문자열'}</div>
		
		<hr>
		
		<h2>HashMap 객체</h2>
		
		<%
			HashMap<String, Integer> score1 = new HashMap<String, Integer>();
			
			score1.put("kor", 100);
			score1.put("eng", 90);
			score1.put("math", 80);
			
			pageContext.setAttribute("score1", score1);
		%>
		
		<div>국어: <%= score1.get("kor") %></div>
		<div>영어: <%= score1.get("eng") %></div>
		<div>수학: <%= score1.get("math") %></div>
		
		<br>
		
		<div>국어: ${score1.get("kor")}</div>
		<div>영어: ${score1["eng"]}</div>
		<div>수학: ${score1.math}</div>
		
		<br>
		
		<div>총점: ${score1.kor + score1.eng + score1.math}</div>
		
		<h2>일반 객체</h2>
		
		<%	
			Score score2 = new Score();
			
			score2.setKor(99);
			score2.setEng(88);
			score2.setMath(77);
			
			pageContext.setAttribute("score2", score2);
		%>

		<div>국어: <%= score2.getKor() %></div>
		<div>영어: <%= score2.getEng() %></div>
		<div>수학: <%= score2.getMath() %></div>
		
		<br>
		
		<div>국어: ${score2.getKor()}</div>
		<div>영어: ${score2["eng"]}</div>
		<div>수학: ${score2.math}</div>
		
		<br>
		
		<div>총점: ${score2.kor + score2.eng + score2.math}</div>
		
		<hr>
		
		<h2>내장 객체 간 우선순위</h2>
		
		<%
			pageContext.setAttribute("color", "tomato");
			
			request.setAttribute("color", "gold");
			
			session.setAttribute("color", "cornflowerblue");
			
			application.setAttribute("color", "yellowgreen");
		%>

		<div style="background-color: ${color};">${color}</div>
		<div style="background-color: ${requestScope.color};">${requestScope.color}</div>
		<div style="background-color: ${sessionScope.color};">${sessionScope.color}</div>
		<div style="background-color: ${applicationScope.color};">${applicationScope.color}</div>
	</body>
</html>