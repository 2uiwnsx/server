<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
		<style>
			input[type="color"] {
				height: 40px;
			}
		</style>
	</head>
	<body>
		<h1>폼 컨트롤 + 전송</h1>
		
		<form method="POST" action="ex08_ok.jsp">
			<table class="vertical">
				<tr>
					<th>텍스트</th>
					
					<td><input type="text" name="txt1"></td>
				</tr>
				<tr>
					<th>텍스트</th>
					
					<td><textarea name="txt2"></textarea></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					
					<td><input type="password" name="pswd"></td>
				</tr>
				<tr>
					<th>체크박스</th>
					
					<td><input type="checkbox" name="cb1"></td>
				</tr>
				<tr>
					<th>체크박스</th>
					
					<td>
						<h3>취미를 선택하세요.</h3>
						
						<label><input type="checkbox" name="cb2" value="독서">독서</label>
						<label><input type="checkbox" name="cb2" value="운동">운동</label>
						<label><input type="checkbox" name="cb2" value="코딩">코딩</label>
					</td>
				</tr>
				<tr>
					<th>라디오 버튼</th>
					
					<td>
						<h3>성별을 선택하세요.</h3>
						
						<label><input type="radio" name="rb" value="남자">남자</label>
						<label><input type="radio" name="rb" value="여자">여자</label>
					</td>
				</tr>
				<tr>
					<th>셀렉트 박스</th>
					
					<td>
						<select name="sel1">
							<option value="1">사과</option>
							<option value="2">바나나</option>
							<option value="3">포도</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>셀렉트 박스</th>
					
					<td>
						<select name="sel2" multiple>
							<option value="1">사과</option>
							<option value="2">바나나</option>
							<option value="3">포도</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>숨겨진 요소</th>
					
					<td><input type="hidden" name="txt3" value="Hong"></td>
				</tr>
				<tr>
					<th>날짜</th>
					
					<td><input type="date" name="date"></td>
				</tr>
				<tr>
					<th>범위</th>
					
					<td><input type="range" name="range" min="10" max="1000" step="10"></td>
				</tr>
				<tr>
					<th>색상</th>
					
					<td><input type="color" name="color"></td>
				</tr>
			</table>
			
			<input type="hidden" name="count">
			
			<div>
				<input type="button" id="btn1" value="클릭">
				<input type="button" id="btn2" value="링크">
				<input type="submit" value="전송">
			</div>
		</form>
		
		<h1>링크</h1>
		
		<div><a href="ex08_ok.jsp?id=hong&password=1234">링크입니다.</a></div>
	
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
		<script>
			let count = 0;
			
			$('#btn1').click(function () {
				count++;
				
				$('input[name="count"]').val(count);
			});
			
			$('#btn2').click(function () {
				location.href = 'ex08_ok.jsp?id=test&password=1111';
			});
		</script>
	</body>
</html>