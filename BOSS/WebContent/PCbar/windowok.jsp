<%@ page language="java" pageEncoding="GB2312" %>
<%@ page import="com.genius.BOSS.PCbar.actionbean.*" %>
<%@ page import="com.genius.BOSS.PCbar.*" %>

<html>
<%
	String formName = request.getParameter("formname");
	
	
	//PCbarExt PCbar=new PCbarExt();
	//SelectActionBean bean=PCbar.getWindowData("id");

	out.println("<script>");
	out.println("function select(){");
	
	out.println("window.close();");
	out.println("}");
	out.println("</script>");
%>

<body onLoad="select();">

</body>
</html>
