<%@ page language="java" pageEncoding="GB2312"%>
<%@ page import="com.genius.adminmanager.userinfo.*"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%><html>
<%
	String formName = request.getParameter("formname");
	String nameInput = request.getParameter("nameinput");
	String idInput = request.getParameter("idinput");
	String[] userIds = request.getParameter("user").split(",");
	String[] userNames = new String[userIds.length];
	String userName = new String();
	String userId = new String();
	Userinfo userinfo=new Userinfo();
	userNames=userinfo.getNames(userIds);
	for (int i = 0; i < userIds.length; i++) {
		if(userNames[i]!=null && !userNames[i].equals("null")){
			if (i == 0) {
				userName += userNames[i];
				userId += userIds[i];
			} else {
				userName += "," + userNames[i];
				userId += "," + userIds[i];
			}
		}
	}
	out.println("<script>");
	out.println("function select(){");
	out.println("window.opener.document." + formName + "."
		+ nameInput + ".value='" + userName + "';");
	out.println("window.opener.document." + formName + "."
		+ idInput + ".value='" + userId + "';");
	out.println("window.close();");
	out.println("}");
	out.println("</script>");
%>
<body onLoad="select();">
</body>
</html>