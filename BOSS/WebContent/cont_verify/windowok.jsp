<%@ page language="java" pageEncoding="GB2312" %>
<%@ page import="com.genius.BOSS.cont_verify.actionbean.*" %>
<%@ page import="com.genius.BOSS.cont_verify.*" %>

<html>
<%
	String formName = request.getParameter("formname");
	
	
	//Cont_verifyExt cont_verify=new Cont_verifyExt();
	//SelectActionBean bean=cont_verify.getWindowData("id");

	out.println("<script>");
	out.println("function select(){");
	
	out.println("window.close();");
	out.println("}");
	out.println("</script>");
%>

<body onLoad="select();">

</body>
</html>
