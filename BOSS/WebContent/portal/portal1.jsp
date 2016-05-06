<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="org.genius.data.*,java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.portal.shortcut.*"%>
<%@ page import="com.genius.portal.shortcut.actionbean.*"%>
<%@ page import="com.genius.adminmanager.userinfo.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<script language="JavaScript">
<!--
function refresh()
{
    this.location = this.location;
}
-->
</script>
<link href="../css/<%=session.getAttribute("style").toString() %>"rel="stylesheet" type="text/css">
</head>
<body scroll="no">
<table width="100%" height="80%" border="0" cellpadding="0" cellspacing="0">
	<br>
	<br>
	<br>
	<%Shortcut cut = new Shortcut();
			ArrayList list = cut.select(session.getAttribute("userId")
					.toString());
			int i = 0;
			while (i < list.size()) {

				%>
	<tr align="center" valign="middle" class="F-blue">
		<%int k = 0;
				while (k < 5) {
					ShortcutBean bean = new ShortcutBean();
					bean = (ShortcutBean) list.get(i);

					%>
		<td width="20%" align="center" valign="top" class="ajax-td"><a
			href="../<%=bean.getLink() %>/index.jsp" target="main" class="F"> <img
			src="../images/icon/<%=bean.getImage() %>" width="64" height="64"
			border=1></a><br>
		<br>
		<br>
		<%=bean.getName()%></td>
		<%if (i == list.size() - 1) {
						i++;
						k = 6;
					} else {
						i++;
						k++;
					}
				}
				int lineSize = list.size();
				for (int lineSizeNull = 5 - lineSize; lineSizeNull >= 1; lineSizeNull--) {

				%>
		<td align="center" valign="top" class="ajax-td" width="64" height="64"><br>
		<br>
		<br>
		&nbsp;</td>
		<%}%>
	</tr>
	<%}%>
	<br>
	<br>
	<%int number = (10 - i) / 2;
			for (int line = number; line >= 0; line--) {
%>
	<tr>
		<td valign="top" class="ajax-td">&nbsp;</td>
	</tr>
	<%}%>
</table>
</body>
</html>
