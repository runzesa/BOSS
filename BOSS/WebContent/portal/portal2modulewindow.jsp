<%@ page language="java" pageEncoding="GB2312"%>
<html>

<%String name = request.getParameter("name");
			//byte [] tempb = name.getBytes("ISO8859-1");
			//name = new String(tempb);
			String link = request.getParameter("link");
			byte[] tempb1 = link.getBytes("ISO8859-1");
			link = new String(tempb1);
			out.println("<script>");
			out.println("function select(){");
			out
					.println("window.opener.document.getElementById('function').value='"
							+ name + "'");
			out
					.println("window.opener.document.getElementById('NewPassword').value='"
							+ link + "'");
			out
					.println("window.opener.document.getElementById('againNewPassword').value='"
							+ link + ".select'");

			out.println("window.close();");
			out.println("}");
			out.println("</script>");

		%>
<body onLoad="select();">
</body>
</html>
