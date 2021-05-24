<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="board.*"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="boardBean" class="board.BoardBean"/>
<jsp:setProperty property="*" name="boardBean"/>
<jsp:useBean id="boardQuery" class="board.BoardQuery"/>
<% 
boardQuery.boardInsert(boardBean); 
%>
<script type="text/javascript">
document.location.href="list.jsp";
</script>