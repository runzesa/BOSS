<%@ page language="java" pageEncoding="GB2312"%>
<%@ page import="com.genius.adminmanager.department.*"%>
<html>
<%
	String formName = request.getParameter("formname");
	String nameInput = request.getParameter("nameinput");
	String idInput = request.getParameter("idinput");
	String[] departmentIds = request.getParameter("department").split(",");
	String[] departmentNames = new String[departmentIds.length];
	String name = new String();
	String id = new String();
	Department department=new Department();
	departmentNames=department.getNames(departmentIds);
	for (int i = 0; i < departmentIds.length; i++) {
		if(departmentNames[i]!=null && !departmentNames[i].equals("") && departmentIds[i]!=null
			&& !departmentIds[i].equals("")){
			if (i == 0) {
				name += departmentNames[i];
				id += departmentIds[i];
			} else {
				name += "," + departmentNames[i];
				id += "," + departmentIds[i];
			}
		}
	}
	out.println("<script>");
	out.println("function select(){");
	out.println("window.opener.document." + formName + "."
		+ nameInput + ".value='" + name + "';");
	out.println("window.opener.document." + formName + "."
		+ idInput + ".value='" + id + "';");
	out.println("window.close();");
	out.println("}");
	out.println("</script>");
%>
<body onLoad="select();">
</body>
</html>
