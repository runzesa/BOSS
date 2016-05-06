<%@ page language="java" pageEncoding="GB2312" %>
<%@ page import="com.genius.BOSS.card.actionbean.*" %>
<%@ page import="com.genius.BOSS.card.*" %>

<html>
<%
	String formName = request.getParameter("formname");
	
	
	//CardExt card=new CardExt();
	//SelectActionBean bean=card.getWindowData("id");

	out.println("<script>");
	out.println("function select(){");
	
	out.println("window.close();");
	out.println("}");
	out.println("</script>");
%>

<body onLoad="select();">

</body>
</html>
