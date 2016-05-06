<%@ page language="java" pageEncoding="GB2312"%>

<%@page import="java.net.URLDecoder"%><html>
<%
			String formName = request.getParameter("formname");
			String nameInput = request.getParameter("nameinput");
			String idInput = request.getParameter("idinput");

			String userName = request.getParameter("name");
			String userId = request.getParameter("id");
			userName = new String(userName.getBytes("iso-8859-1"),"gbk");
			out.println("<script>");
			out.println("function select(){");
			out.println("window.opener.document." + formName + "." + idInput + ".value='" + userId + "';");
			out.println("window.opener.document." + formName + "." + nameInput + ".value='" + userName + "';");
			out.println("window.close();");
			out.println("}");
			out.println("</script>");
%>

<body onLoad="select();">

</body>
</html>