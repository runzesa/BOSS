<%@ page language="java" contentType="text/html; charset=gbk"%>

<%@page import="java.lang.reflect.Method"%><html>
<%
	String formName = request.getParameter("formname");
	String operateNameInput = request.getParameter("nameinput");
	String operateIdInput = request.getParameter("idinput");
	String operateName = request.getParameter("name");
	String operateId = request.getParameter("id");
	if(operateName!=null){
		//operateName = new String(operateName.getBytes("iso-8859-1"),"gbk");
	}
	out.println("<script>");
	out.println("function select(){");
	out.println("window.opener.document." + formName + "."
		+ operateNameInput + ".value=decodeURI(decodeURI('" + operateName + "'));");
	out.println("window.opener.document." + formName + "."
		+ operateIdInput + ".value='" + operateId + "';");
	out.println("window.close();");
	out.println("}");
	out.println("</script>");
%>
<body onLoad="select();">
</body>
</html>
