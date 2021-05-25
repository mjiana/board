<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, board.*,util.PagingCount"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="boardQuery" class="board.BoardQuery"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>search</title>
<link rel="stylesheet" type="text/css" href="boardCSS.css">
<script type="text/javascript" src="boardScript.js"></script>
</head>
<body>
<%
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

//�˻���
String find = request.getParameter("find");
String search = request.getParameter("search");

//�˻��Խñ� ��
int rcnt = boardQuery.boardCount(find,search);
PagingCount pc = new PagingCount(rcnt);
%>
<table>
	<tr>
		<td colspan="2"><font>�Խ��� ����Ʈ</font></td>
	</tr>
	<tr>
		<td><font>�˻� ���</font></td>
		<td>�� �Խñ� �� : <%=rcnt %></td>
	</tr>
</table>
<br>
<table>
	<tr>
		<td class="t1">��ȣ</td>
		<td class="t1">����</td>
		<td class="t2">����</td>
		<td class="t1">�̸�</td>
		<td class="t1">��ȸ</td>
	</tr>
	<% 
	//�����, �Խ��� ��� �ҷ�����
	Vector list = boardQuery.getSearchList(offset, limit, find, search);
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
<%=pc.showPaging(pagelink, "search.jsp", find, search) %>
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
			<input type="text" name="search" class="txt1" value=<%=search %>>
			<input type="button" value="�˻�" onclick="send(this.form)">
		</td>
	</tr>
</table>
</form>
<table>
	<tr>
		<td>[<a href="list.jsp">�������</a>]</td>
	</tr>
</table>
</body>
</html>