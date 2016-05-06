<%@ page language="java" pageEncoding="GB2312"%>
<html>
<%
			String formName = request.getParameter("formname");
			String nameInput = request.getParameter("nameinput");
			String idInput = request.getParameter("idinput");

			String name = request.getParameter("name");
			String id = request.getParameter("id");

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
