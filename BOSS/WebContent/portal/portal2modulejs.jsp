<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="com.genius.portal.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.portal.actionbean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ޱ����ĵ�</title>
<script language="JavaScript">
	function  session(){ 
		if(<%=session.getAttribute("login")%> ==null){
			alert("�Բ���ϵͳ�ѳ�ʱ����ע�������µ�½��");
			window.close(); 
		}else{
			self.window.location = "portal2module.jsp";
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
