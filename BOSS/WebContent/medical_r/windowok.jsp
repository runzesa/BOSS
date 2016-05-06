<%@ page language="java" pageEncoding="GB2312" %>
<%@ page import="com.genius.BOSS.medical_r.actionbean.*" %>
<%@ page import="com.genius.BOSS.medical_r.*" %>

<html>
<%
	String formName = request.getParameter("formname");
	
	
	//Medical_rExt medical_r=new Medical_rExt();
	//SelectActionBean bean=medical_r.getWindowData("id");

	out.println("<script>");
	out.println("function select(){");
	
	out.println("window.close();");
	out.println("}");
	out.println("</script>");
%>

<body onLoad="select();">

</body>
</html>
