<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 글쓰기</title>
<link rel="stylesheet" type="text/css" href="boardCSS.css">
<script type="text/javascript" src="boardScript.js"></script>
</head>
<body onload="wform.name.focus()">
<table>
	<tr>
		<td><font>일반형 게시판</font></td>
	</tr>
</table>
<br>
<form method="post" action="write_ok.jsp" name="wform">
<table>
	<tr>
		<td colspan="2">새 글 쓰기</td>
	</tr>
	<tr>
		<td class="t1">이름</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td class="t1">이메일</td>
		<td><input type="text" name="email"></td>
	</tr>
	<tr>
		<td class="t1">홈페이지</td>
		<td><input type="text" name="homepage"></td>
	</tr>
	<tr>
		<td class="t1">제목</td>
		<td><input type="text" name="title"></td>
	</tr>
	<tr>
		<td class="t1">내용</td>
		<td><textarea name="content"></textarea></td>
	</tr>
	<tr>
		<td class="t1">암호</td>
		<td><input type="password" name="pwd"></td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="button" value="업로드" onclick="trans(this.form)">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value="다시쓰기">
		</td>
	</tr>
</table>
</form>
<br>
<table>
	<tr>
		<td>[<a href="./list.jsp">리스트</a>]</td>
	</tr>
</table>
</body>
</html>