<%@ page language="java" pageEncoding="GB2312" %>
<%@ page import="com.genius.BOSS.contact.actionbean.*" %>
<%@ page import="com.genius.BOSS.contact.*" %>

<html>
<%
	String formName = request.getParameter("formname");
	
	
	//ContactExt contact=new ContactExt();
	//SelectActionBean bean=contact.getWindowData("id");

	out.println("<script>");
	out.println("function select(){");
	
	out.println("window.close();");
	out.println("}");
	out.println("</script>");
%>

<body onLoad="select();">

</body>
</html>
