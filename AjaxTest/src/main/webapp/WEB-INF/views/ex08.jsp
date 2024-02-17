<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
		<style>
			#tbl1 th:first-child {
				width: 60px;
			}
			#tbl1 th:nth-child(2) {
				width: 50px;
			}
			#tbl1 th:nth-child(3) {
				width: 50px;
			}
			#tbl1 th:nth-child(4) {
				width: auto;
			}
			#tbl1 th:nth-child(5) {
				width: 120px;
			}
			#tbl1 th:last-child {
				width: 60px;
			}
			#tbl1 td {
				text-align: center;
			}
			#tbl1 td:nth-child(4) {
				text-align: left;
			}
			#tbl2 {
				display: none;
			}
			#addBtn {
				display: none;
			}
		</style>
	</head>
	<body>
		<table id="tbl1">
			<thead>
				<tr>
					<th>이름</th>
					<th>나이</th>
					<th>성별</th>
					<th>주소</th>
					<th>날짜</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		
		<div><button type="button" id="toggleBtn" class="out">펼치기</button></div>
		
		<form id="form">
			<table id="tbl2" class="vertical">
				<tr>
					<th>이름</th>
					
					<td><input type="text" name="name" id="name" class="short"></td>
				</tr>
				<tr>
					<th>나이</th>
					
					<td><input type="number" name="age" id="age" min="1" max="100"></td>
				</tr>
				<tr>
					<th>성별</th>
					
					<td>
						<select name="gender" id="gender">
							<option value="m">남자</option>
							<option value="f">여자</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					
					<td><input type="text" name="address" id="address" class="full"></td>
				</tr>
			</table>
		</form>
		
		<div id="addBtn"><button type="button" class="add">등록</button></div>
		
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
		<script>
			function load() {
				$('#tbl1 tbody').html('');
				
				$.ajax({
					type: 'GET',
					url: '/ajax/list.do',
					dataType: 'json',
					success: function (response) {
						$(response).each((index, item) => {
							$('#tbl1 tbody').append(`
								<tr>
									<td>\${item.name}</td>
									<td>\${item.age}</td>
									<td>\${(item.gender == 'm') ? '남자' : '여자'}</td>
									<td>\${item.address}</td>
									<td>\${item.regdate}</td>
									<td>
										<span class="material-symbols-outlined" style="cursor: pointer;" onclick="edit(\${item.seq});">edit</span>
										<span class="material-symbols-outlined" style="cursor: pointer;" onclick="del(\${item.seq});">delete</span>
									</td>
								</tr>
							`);
						});
					},
					error: function (jqXHR, textStatus, errorThrown) {
						console.log(jqXHR, textStatus, errorThrown);
					}
				});
			}
			
			load();
			
			function edit(seq) {
				let name = $(event.target).parents('tr').children().eq(0).text();
				let age = $(event.target).parents('tr').children().eq(1).text();
				let gender = $(event.target).parents('tr').children().eq(2).text();
				let address = $(event.target).parents('tr').children().eq(3).text();
				
				$(event.target).parents('tr').children().eq(0).html(`<input type="text" class="short" value="\${name}" style="width: 50px; text-align: center;" onblur="editName(\${seq});">`);
				$(event.target).parents('tr').children().eq(1).html(`<input type="number" class="short" min="1" max="100" value="\${age}" style="width: 50px; text-align: center;" onblur="editAge(\${seq});">`);
				$(event.target).parents('tr').children().eq(2).html(`
					<select onblur="editGender(\${seq});">
						<option value="m" \${(gender == '남자') ? 'selected' : ''}>남자</option>
						<option value="f" \${(gender == '여자') ? 'selected' : ''}>여자</option>
					</select>
				`);
				$(event.target).parents('tr').children().eq(3).html(`<input type="text" class="short" value="\${address}" style="width: 310px;" onblur="editAddress(\${seq})">`);
			}
			
			function editName(seq) {
				const temp = $(event.target);
				
				$.ajax({
					type: 'POST',
					url: '/ajax/edit.do',
					dataType: 'json',
					data: {
						seq: seq,
						column: 'name',
						value: $(event.target).val()
					},
					success: function (response) {
						if (response.result) {
							temp.parent().text(temp.val());
						} else {
							alert('수정에 실패했습니다.');
						}
					},
					error: function (jqXHR, textStatus, errorThrown) {
						console.log(jqXHR, textStatus, errorThrown);
					}
				});
			}
			
			function editAge(seq) {
				const temp = $(event.target);
				
				$.ajax({
					type: 'POST',
					url: '/ajax/edit.do',
					dataType: 'json',
					data: {
						seq: seq,
						column: 'age',
						value: $(event.target).val()
					},
					success: function (response) {
						if (response.result) {
							temp.parent().text(temp.val());
						} else {
							alert('수정에 실패했습니다.');
						}
					},
					error: function (jqXHR, textStatus, errorThrown) {
						console.log(jqXHR, textStatus, errorThrown);
					}
				});
			}
			
			function editGender(seq) {
				const temp = $(event.target);
				
				$.ajax({
					type: 'POST',
					url: '/ajax/edit.do',
					dataType: 'json',
					data: {
						seq: seq,
						column: 'gender',
						value: $(event.target).val()
					},
					success: function (response) {
						if (response.result) {
							temp.parent().text((temp.val() == 'm') ? '남자' : '여자');
						} else {
							alert('수정에 실패했습니다.');
						}
					},
					error: function (jqXHR, textStatus, errorThrown) {
						console.log(jqXHR, textStatus, errorThrown);
					}
				});
			}
			
			function editAddress(seq) {
				const temp = $(event.target);
				
				$.ajax({
					type: 'POST',
					url: '/ajax/edit.do',
					dataType: 'json',
					data: {
						seq: seq,
						column: 'address',
						value: $(event.target).val()
					},
					success: function (response) {
						if (response.result) {
							temp.parent().text(temp.val());
						} else {
							alert('수정에 실패했습니다.');
						}
					},
					error: function (jqXHR, textStatus, errorThrown) {
						console.log(jqXHR, textStatus, errorThrown);
					}
				});
			}
			
			function del(seq) {
				if (confirm('삭제하시겠습니까?')) {
					$.ajax({
						type: 'POST',
						url: '/ajax/del.do',
						dataType: 'json',
						data: 'seq=' + seq,
						success: function (response) {
							if (response.result) {
								load();
							} else {
								alert('삭제에 실패했습니다.');
							}
						},
						error: function (jqXHR, textStatus, errorThrown) {
							console.log(jqXHR, textStatus, errorThrown);
						}
					});
				}
			}
			
			$('#toggleBtn').click(function () {
				if ($('#tbl2').css('display') == 'none') {
					$(this).removeClass('out');
					$(this).addClass('in');
					$(this).text('접기');
					
					$('#tbl2').css('display', 'table');
					
					$('#addBtn').css('display', 'block');
					
					$("#name").focus();
				} else {
					$(this).removeClass('in');
					$(this).addClass('out');
					$(this).text('펼치기');
					
					$('#tbl2').css('display', 'none');
					
					$('#addBtn').css('display', 'none');
				}
			});
			
			$('#addBtn > button').click(function () {
				$.ajax({
					type: 'POST',
					url: '/ajax/add.do',
					dataType: 'json',
					data: $("#form").serialize(),
					success: function (response) {
						if (response.result) {
							$("#name").val('');
							
							$("#age").val('');
							
							$("#gender").val('m');
							
							$("#address").val('');
							
							load();
						} else {
							alert('등록에 실패했습니다.');
						}
					},
					error: function (jqXHR, textStatus, errorThrown) {
						console.log(jqXHR, textStatus, errorThrown);
					}
				});
			});
		</script>
	</body>
</html>