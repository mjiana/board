<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr");  %>  
<jsp:useBean id="bq" class="board.BoardQuery"/>
<%
int idx = Integer.parseInt(request.getParameter("idx"));
String pwd = request.getParameter("pwd");
boolean result = false;
result = bq.boardDelete(idx, pwd);
if(result){
%>
	<script type="text/javascript">
		alert("���� �����Ǿ����ϴ�.");
		location.href="list.jsp";
	</script>
<%
}else{
%>
	<script type="text/javascript">
		alert("��ȣ�� ��ġ���� �ʽ��ϴ�.");
		history.back();
	</script>
<%
}
%>
