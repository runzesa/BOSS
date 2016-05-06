<%@ page language="java" pageEncoding="GB2312" %>
<%@ page import="com.genius.BOSS.medical_j.actionbean.*" %>
<%@ page import="com.genius.BOSS.medical_j.*" %>

<html>
<%
	String formName = request.getParameter("formname");
	
	
	//Medical_jExt medical_j=new Medical_jExt();
	//SelectActionBean bean=medical_j.getWindowData("id");

	out.println("<script>");
	out.println("function select(){");
	
	out.println("window.close();");
	out.println("}");
	out.println("</script>");
%>

<body onLoad="select();">

</body>
</html>
