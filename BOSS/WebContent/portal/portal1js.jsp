<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="org.genius.data.*,java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.portal.shortcut.*"%>
<%@ page import="com.genius.portal.shortcut.actionbean.*"%>
<%@ page import="com.genius.adminmanager.userinfo.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ޱ����ĵ�</title>
<script language="JavaScript">
	function  session(){ 
		if(<%=session.getAttribute("login")%> ==null){
			alert("�Բ���ϵͳ�ѳ�ʱ�����Զ��˳���");
			window.top.location.href = "../login.jsp"; 
		}else{
			self.window.location = "portal1.jsp";
		}
	}
	window.onload = session;
</script>
<script language="JavaScript">
<!--
function refresh()
{
    this.location = this.location;
}
-->
</script>
</head>
<body scroll="no">
</body>
</html>
