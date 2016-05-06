<%@ page language="java" pageEncoding="GB2312" %>
<%@ page import="com.genius.BOSS.cdsy.actionbean.*" %>
<%@ page import="com.genius.BOSS.cdsy.*" %>

<html>
<%
	String formName = request.getParameter("formname");
	
	
	//CdsyExt cdsy=new CdsyExt();
	//SelectActionBean bean=cdsy.getWindowData("id");

	out.println("<script>");
	out.println("function select(){");
	
	out.println("window.close();");
	out.println("}");
	out.println("</script>");
%>

<body onLoad="select();">

</body>
</html>
