<%@ page language="java" pageEncoding="GB2312" %>
<%@ page import="com.genius.BOSS.hospital_m.actionbean.*" %>
<%@ page import="com.genius.BOSS.hospital_m.*" %>

<html>
<%
	String formName = request.getParameter("formname");
	
	
	//Hospital_mExt hospital_m=new Hospital_mExt();
	//SelectActionBean bean=hospital_m.getWindowData("id");

	out.println("<script>");
	out.println("function select(){");
	
	out.println("window.close();");
	out.println("}");
	out.println("</script>");
%>

<body onLoad="select();">

</body>
</html>
