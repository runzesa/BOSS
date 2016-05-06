<%@ page language="java" pageEncoding="GB2312"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.portal.shortcut.*"%>
<%@ page import="com.genius.portal.shortcut.actionbean.*"%>
<html>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"
	background=images/blue/e_p_bg.gif onLoad="select();">
<%String name = request.getParameter("name");
			String link = request.getParameter("link");
			//byte [] tempb1 = link.getBytes("ISO8859-1");
			//link = new String(tempb1);
			out.println("<script>");
			out.println("function select(){");
			out
					.println("window.opener.document.getElementById('function').value='"
							+ name + "'");
			out.println("window.opener.document.getElementById('link').value='"
					+ link + "'");
			out.println("window.close();");
			out.println("}");
			out.println("</script>");

		%>
</body>
</html>
