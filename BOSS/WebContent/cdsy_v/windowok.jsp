<%@ page language="java" pageEncoding="GB2312" %>
<%@ page import="com.genius.BOSS.cdsy_v.actionbean.*" %>
<%@ page import="com.genius.BOSS.cdsy_v.*" %>

<html>
<%
	String formName = request.getParameter("formname");
	
	
	//Cdsy_vExt cdsy_v=new Cdsy_vExt();
	//SelectActionBean bean=cdsy_v.getWindowData("id");

	out.println("<script>");
	out.println("function select(){");
	
	out.println("window.close();");
	out.println("}");
	out.println("</script>");
%>

<body onLoad="select();">

</body>
</html>
