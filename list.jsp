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
//총 게시글 수
int rcnt = boardQuery.boardCount();
//페이징 준비
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
		<td colspan="2"><font>게시판 리스트</font></td>
	</tr>
	<tr>
		<td>총 게시글 수 : <%=rcnt %></td>
		<td>[<a href="write.jsp">글쓰기</a>]</td>
	</tr>
</table>
<br>
<table>
	<tr>
		<td class="t1">번호</td>
		<td class="t1">일자</td>
		<td class="t1">제목</td>
		<td class="t1">이름</td>
		<td class="t1">조회</td>
	</tr>
	<% 
	//뷰로직, 게시판 목록 불러오기
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
//페이징
PagingCount pc = new PagingCount(rcnt);
%>
<%=pc.showPaging(pagelink, "list.jsp") %>
<!-- 검색폼 -->
<form method="post" name="sform" action="search.jsp">
<table>
	<tr>
		<td>
			<select name="find">
				<option value="name">이름</option>
				<option value="title" selected="selected">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="search" class="txt1">
			<input type="button" value="검색" onclick="send(this.form)">
		</td>
	</tr>
</table>
</form>
</body>
</html>