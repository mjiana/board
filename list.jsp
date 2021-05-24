<%@page import="util.PagingCount"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, board.*"%>
<jsp:useBean id="boardQuery" class="board.BoardQuery"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>list</title>
<link rel="stylesheet" type="text/css" href="boardCSS.css">
<script type="text/javascript" src="boardScript.js"></script>
</head>
<body>
<%
//�� �Խñ� ��
int rcnt = boardQuery.boardCount();
//����¡ �غ�
int limit = 10;
int offset = 0;
int pagelink = 1;

String offset_get = request.getParameter("offset");
if(offset_get == null) offset = 0;
else offset = Integer.parseInt(offset_get);

String pagelink_get = request.getParameter("pagelink");
if(pagelink_get == null) pagelink = 1;
else pagelink = Integer.parseInt(pagelink_get);
%>
<table>
	<tr>
		<td colspan="2"><font>�Խ��� ����Ʈ</font></td>
	</tr>
	<tr>
		<td>�� �Խñ� �� : <%=rcnt %></td>
		<td>[<a href="write.jsp">�۾���</a>]</td>
	</tr>
</table>
<br>
<table>
	<tr>
		<td class="t1">��ȣ</td>
		<td class="t1">����</td>
		<td class="t1">����</td>
		<td class="t1">�̸�</td>
		<td class="t1">��ȸ</td>
	</tr>
	<% 
	//�����, �Խ��� ��� �ҷ�����
	Vector list = boardQuery.getBoardList(offset, limit);
	for(int i=0; i<list.size(); i++){
		BoardBean bb = (BoardBean)list.elementAt(i);
	%>
	<tr>
		<td><%=bb.getIdx() %></td>
		<td><%=bb.getWdate() %></td>
		<td><a href="content.jsp?idx=<%=bb.getIdx() %>"><%=bb.getTitle() %></a></td>
		<td><%=bb.getName() %></td>
		<td><%=bb.getHit() %></td>
	</tr>
	<%
	}//for end
	%>
</table>
<%
//����¡
PagingCount pc = new PagingCount(rcnt);
%>
<%=pc.showPaging(pagelink, "list.jsp") %>
<!-- �˻��� -->
<form method="post" name="sform" action="search.jsp">
<table>
	<tr>
		<td>
			<select name="find">
				<option value="name">�̸�</option>
				<option value="title" selected="selected">����</option>
				<option value="content">����</option>
			</select>
			<input type="text" name="search" class="txt1">
			<input type="button" value="�˻�" onclick="send(this.form)">
		</td>
	</tr>
</table>
</form>
</body>
</html>