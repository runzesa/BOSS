<%@ page language="java" pageEncoding="GB2312"%>
<html>
<%
			String formName = request.getParameter("formname");
			String nameInput = request.getParameter("nameinput");
			String idInput = request.getParameter("idinput");

			String userName = request.getParameter("username");
			String userId = request.getParameter("userid");

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