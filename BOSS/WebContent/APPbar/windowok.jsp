<%@ page language="java" pageEncoding="GB2312" %>
<%@ page import="com.genius.BOSS.APPbar.actionbean.*" %>
<%@ page import="com.genius.BOSS.APPbar.*" %>

<html>
<%
	String formName = request.getParameter("formname");
	
	
	//APPbarExt APPbar=new APPbarExt();
	//SelectActionBean bean=APPbar.getWindowData("id");

	out.println("<script>");
	out.println("function select(){");
	
	out.println("window.close();");
	out.println("}");
	out.println("</script>");
%>

<body onLoad="select();">

</body>
</html>
