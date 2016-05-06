<%@ page language="java" pageEncoding="GB2312" %>
<%@ page import="com.genius.BOSS.b_user.actionbean.*" %>
<%@ page import="com.genius.BOSS.b_user.*" %>

<html>
<%
	String formName = request.getParameter("formname");
	
	
	//B_userExt b_user=new B_userExt();
	//SelectActionBean bean=b_user.getWindowData("id");

	out.println("<script>");
	out.println("function select(){");
	
	out.println("window.close();");
	out.println("}");
	out.println("</script>");
%>

<body onLoad="select();">

</body>
</html>
