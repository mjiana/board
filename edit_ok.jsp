<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr");  %>    
<jsp:useBean id="bb" class="board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>
<jsp:useBean id="bq" class="board.BoardQuery"/>
<%
int idx = bb.getIdx();
boolean result = false;
result = bq.boardUpdate(bb);
//out.print(result);
if(result){
%>
	<script type="text/javascript">
		alert('���� �����Ǿ����ϴ�.');
		location.href='content.jsp?idx='+<%=idx%>;
	</script>
<%
}else{
%>
	<script type="text/javascript">
		alert('��ȣ�� ��ġ���� �ʽ��ϴ�.');
		history.back();
	</script>
<%
}
%>
