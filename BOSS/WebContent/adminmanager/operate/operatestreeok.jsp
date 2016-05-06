<%@ page language="java" pageEncoding="GB2312"%>
<%@ page import="com.genius.adminmanager.operate.*"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="java.util.List"%>
<html>
<%
	String[] operateIds = request.getParameter("operate").split(",");
	String formName = request.getParameter("formname");
	String operateNameInput = request.getParameter("nameinput");
	String operateIdInput = request.getParameter("idinput");
	String[] operateNames = new String[operateIds.length];
	String operateName = new String();
	String operateId = new String();
	Operate operate = new Operate();
	operateNames = operate.getOperateNames(operateIds);
	for (int i = 0; i < operateIds.length; i++) {
		if(operateNames[i]!=null && !operateNames[i].equals("null")){
			if (i == 0) {
				operateName += operateNames[i];
				operateId += operateIds[i];
			} else {
				operateName += "," + operateNames[i];
				operateId += "," + operateIds[i];
			}
		}
	}
	out.println("<script>");
	out.println("function select(){");
	out.println("window.opener.document." + formName + "."
		+ operateNameInput + ".value='" + operateName + "';");
	out.println("window.opener.document." + formName + "."
		+ operateIdInput + ".value='" + operateId + "';");
	out.println("window.close();");
	out.println("}");
	out.println("</script>");
%>
<body onLoad="select();">
</body>
</html>
