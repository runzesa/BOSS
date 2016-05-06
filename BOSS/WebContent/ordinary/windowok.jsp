<%@ page language="java" pageEncoding="GB2312" %>
<%@ page import="com.genius.BOSS.ordinary.actionbean.*" %>
<%@ page import="com.genius.BOSS.ordinary.*" %>

<html>
<%
	String formName = request.getParameter("formname");
	
	
	//OrdinaryExt ordinary=new OrdinaryExt();
	//SelectActionBean bean=ordinary.getWindowData("id");

	out.println("<script>");
	out.println("function select(){");
	
	out.println("window.close();");
	out.println("}");
	out.println("</script>");
%>

<body onLoad="select();">

</body>
</html>
