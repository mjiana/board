<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� �۾���</title>
<link rel="stylesheet" type="text/css" href="boardCSS.css">
<script type="text/javascript" src="boardScript.js"></script>
</head>
<body onload="wform.name.focus()">
<table>
	<tr>
		<td><font>�Ϲ��� �Խ���</font></td>
	</tr>
</table>
<br>
<form method="post" action="write_ok.jsp" name="wform">
<table>
	<tr>
		<td colspan="2">�� �� ����</td>
	</tr>
	<tr>
		<td class="t1">�̸�</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td class="t1">�̸���</td>
		<td><input type="text" name="email"></td>
	</tr>
	<tr>
		<td class="t1">Ȩ������</td>
		<td><input type="text" name="homepage"></td>
	</tr>
	<tr>
		<td class="t1">����</td>
		<td><input type="text" name="title"></td>
	</tr>
	<tr>
		<td class="t1">����</td>
		<td><textarea name="content"></textarea></td>
	</tr>
	<tr>
		<td class="t1">��ȣ</td>
		<td><input type="password" name="pwd"></td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="button" value="���ε�" onclick="trans(this.form)">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value="�ٽþ���">
		</td>
	</tr>
</table>
</form>
<br>
<table>
	<tr>
		<td>[<a href="./list.jsp">����Ʈ</a>]</td>
	</tr>
</table>
</body>
</html>