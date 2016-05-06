<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="org.genius.data.*,java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.portal.shortcut.*"%>
<%@ page import="com.genius.portal.shortcut.actionbean.*"%>
<%if (session.getAttribute("login") == null
					|| (!session.getAttribute("login").equals("true"))) {
				response.sendRedirect("portal1addtagdelok.jsp");
			}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>删除标签</title>
<style type="text/css"></style>
<script language="JavaScript">
<!--
function update()
{
	document.form1.action="portal1addtagdelok.jsp";
	document.form1.submit();
}
-->
</script>

<link href="../css/<%=session.getAttribute("style").toString() %>"
	rel="stylesheet" type="text/css">

</head>

<body class="scbq_body">
<div class="scbq_content">
<div class="scbq_div">
<TABLE height="20">
  <TBODY>
  <TR>
    <TH>请选择所要删除的标签：</TH>
  </TR>	
  <TR>	
  <TD height="170" valign="top">
  <TABLE>
  <TBODY>
  		<form method="post" action="" name="form1">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<%Shortcut cut = new Shortcut();
			ArrayList list = cut.delSelect(session.getAttribute("userId")
					.toString());
			int i = 0;
			while (i < list.size()) {
%>
			<tr>
				<%
				int k = 0;
				while (k < 2) {
					ShortcutBean bean = new ShortcutBean();
					bean = (ShortcutBean) list.get(i);
%>
				<td width="10%" height="30">
				<div align="right"><input type="checkbox" value="<%=bean.getId() %>"
					name="id"></div>
				</td>
				<td width="40%" height="30"><%=bean.getName()%></td>
				<%if (i == list.size() - 1) {
						i++;
						k = 3;
					} else {
						i++;
						k++;
					}
				}

			%>
			</tr>
			<%}
			int number = (10 - i) / 2;
			for (int line = number; line >= 0; line--) {
%>
			<tr>
				<td width="10%" height="30">&nbsp;</td>
			</tr>
			<%}%>
			<tr>
				<td height="30" colspan="4">
				<div align="center"><input name="change" type="button"
					class="Gpbutton" value="删除" onClick="update()"> <input
					name="Submit" type="button" class="Gpbutton" value="关闭"
					onclick="window.close()"></div>
				</td>
			</tr>
		</table>
		</form>
  </TBODY>
 </TABLE>
	</TD>
  </TR>
  </TBODY>
 </TABLE>
</div>
</div>
</body>
</html>
