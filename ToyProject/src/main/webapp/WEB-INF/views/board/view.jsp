<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
		<style>
			#post tr:nth-child(4) {
				height: 100px;
			}
			#addCmt {
				text-align: center;
			}
			#addCmt td:first-child {
				width: auto;
			}
			#addCmt td:last-child {
				width: 110px;
			}
			#cmtList td:first-child {
				width: auto;
			}
			#cmtList td:last-child {
				width: 170px;
				text-align: center;
			}
			#cmtList td:first-child > div {
				display: flex;
				justify-content: space-between;
			}
			#cmtList td:first-child > div > div:last-child {
				font-size: 12px;
				color: #777;
			}
			#cmtList td:last-child > div:last-child {
				margin-top: 5px;
			}
		</style>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/inc/menu.jsp" %>
		
		<main id="main">
			<h1 class="sub">게시판 <small>상세</small></h1>
			
			<table id="post" class="vertical">
				<tr>
					<th>번호</th>
					
					<td>${dto.seq}</td>
				</tr>
				<tr>
					<th>이름</th>
					
					<td>${dto.name}(${dto.id})</td>
				</tr>
				<tr>
					<th>제목</th>
					
					<td>${dto.subject}</td>
				</tr>
				<tr>
					<th>내용</th>
					
					<td>${dto.content}</td>
				</tr>
				<tr>
					<th>날짜</th>
					
					<td>${dto.regdate}</td>
				</tr>
				<tr>
					<th>조회수</th>
					
					<td>${dto.readCount}</td>
				</tr>
			</table>

			<c:if test="${not empty id}">
				<table id="addCmt">
					<tr>
						<td><input type="text" name="cmt" id="cmt" class="full"></td>
						<td><button type="button" id="addCmtBtn" class="comment">댓글 등록</button></td>
					</tr>
				</table>
			</c:if>
			
			<table id="cmtList">
				<tbody>
				</tbody>
			</table>
			
			<div>
				<button type="button" class="back" onclick="location.href='/toy/board/list.do';">이전</button>
				
				<c:if test="${(dto.id == id) || (lv == 2)}">
					<button type="button" class="edit" onclick="location.href='/toy/board/edit.do?seq=${dto.seq}';">수정</button>
					<button type="button" class="del" onclick="location.href='/toy/board/del.do?seq=${dto.seq}';">삭제</button>
				</c:if>
			</div>
		</main>
		
		<script>
			function load() {
				$.ajax({
					type: 'GET',
					url: '/toy/board/comment.do',
					dataType: 'json',
					data: 'seq=${dto.seq}',
					success: function (response) {
						$('#cmtList tbody').html('');
						
						$(response).each((index, cmt) => {
							let temp = `
								<tr>
									<td>
										<div>
											<div>\${cmt.content}</div>
											<div>\${cmt.regdate}</div>
										</div>
									</td>
									<td>
										<div>\${cmt.name}(\${cmt.id})</div>
							`;
										
							if (cmt.id == '${id}') {
								temp += `
									<c:if test="${not empty id}">
										<div>
											<button type="button" class="edit" onclick="editCmt(\${cmt.seq});">수정</button>
											<button type="button" class="del" onclick="deleteCmt(\${cmt.seq});">삭제</button>
										</div>
									</c:if>
								`;
							}
							
							temp += `
									</td>
								</tr>
							`;
							
							$('#cmtList tbody').append(temp);
						});
					},
					error: function (jqXHR, textStatus, errorThrown) {
						console.log(jqXHR, textStatus, errorThrown);
					}
				});
			}
			
			load();
			
			function editCmt(seq) {
				let val = $(event.target).parent().parent().prev().children().eq(0).children().eq(0).text();
				
				$('.editCmt').remove();
				
				let temp = `
					<tr class="editCmt">
						<td><input type="text" name="ecomment" id="modifiedCmt" class="long" value="\${val}"></td>
						<td>
							<button type="button" class="edit" onclick="editCmtOk(\${seq});">완료</button>
							<button type="button" class="cancel" onclick="$('.editCmt').remove();">취소</button>
						</td>
					</tr>
				`;
				
				$(event.target).parent().parent().parent().after(temp);
			}
			
			function editCmtOk(seq) {
				$.ajax({
					type: 'POST',
					url: '/toy/board/edit_comment.do',
					dataType: 'json',
					data: {
						seq: seq,
						content: $('#modifiedCmt').val()
					},
					success: function (response) {
						if (response.result == 1) {
							load();
						}
					},
					error: function (jqXHR, textStatus, errorThrown) {
						console.log(jqXHR, textStatus, errorThrown);
					}
				});
			}

			function deleteCmt(seq) {
				if (confirm('삭제하시겠습니까?')) {
					$.ajax({
						type: 'POST',
						url: '/toy/board/del_comment.do',
						dataType: 'json',
						data: 'seq=' + seq,
						success: function (response) {
							if (response.result == 1) {
								load();
							}
						},
						error: function (jqXHR, textStatus, errorThrown) {
							console.log(jqXHR, textStatus, errorThrown);
						}
					});
				}
			}
			
			$('#cmt').keydown(function () {
				if (event.keyCode == 13) {
					$('#addCmtBtn').click();
				}
			});
			
			$('#addCmtBtn').click(function () {
				$.ajax({
					type: 'POST',
					url: '/toy/board/comment.do',
					dataType: 'json',
					data: {
						seq: ${dto.seq},
						content: $('#cmt').val()
					},
					success: function (response) {
						$('#cmt').val('');
						
						if (response.result == 1) {
							load();
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