<%@ page language="java" pageEncoding="GB2312" %>
<%@ page import="com.genius.BOSS.verify.actionbean.*" %>
<%@ page import="com.genius.BOSS.verify.*" %>

<html>
<%
	String formName = request.getParameter("formname");
	
	
	//VerifyExt verify=new VerifyExt();
	//SelectActionBean bean=verify.getWindowData("id");

	out.println("<script>");
	out.println("function select(){");
	
	out.println("window.close();");
	out.println("}");
	out.println("</script>");
%>

<body onLoad="select();">

</body>
</html>
