<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
int idx = Integer.parseInt(request.getParameter("idx"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>delete</title>
<link rel="stylesheet" type="text/css" href="boardCSS.css">
</head>
<body>
<form method="post" name="dform" action="del_ok.jsp?idx=<%=idx %>">
<table>
	<tr>
		<td class="t1">�Խñ��� ��ȣ�� �Է��ϼ���</td>
	</tr>
	<tr>
		<td><input type="password" class="txt2" name="pwd"></td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="����">
			<input type="button"value="���ư���" onclick="history.back()">
		</td>
	</tr>
</table>
</form>
</body>
</html>