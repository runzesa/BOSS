<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page
	import="java.io.IOException,java.sql.ResultSet,java.sql.SQLException,java.util.*,org.genius.data.*,org.genius.util.*,java.sql.*"%>
<%@ page import="com.genius.portal.actionbean.*"%>
<%@ page import="com.genius.portal.*"%>
<%			String info;
			boolean update = false;
			String css = "";
			if (session.getAttribute("login") == null
					|| (!session.getAttribute("login").equals("true"))) {
				info = "系统已超时，请重新登陆！";
				css = "Gp_blue.css";
			} else {
				css = session.getAttribute("style").toString();
				String portal = request.getParameter("portal");
				String name = request.getParameter("oldPassword");
				String link = request.getParameter("againNewPassword");
				String userId = (String) session.getAttribute("userId");

				Portal2 portal2 = new Portal2();
				boolean checkUpdate = false;
				String checkUser = portal2.check(userId);
				if (checkUser.equals("xinzeng")) {
					info = "模块更新成功！";
					update = true;
					checkUpdate = portal2.insert(userId, portal, name, link);
				} else if (checkUser.equals("gengxin")) {
					info = "模块更新成功！";
					update = true;
					checkUpdate = portal2.update(userId, portal, name, link);
				} else {
					checkUpdate = false;
					info = "用户判定程序错误！";
				}
			}
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>模块管理</title>
<style type="text/css"></style>

<link href="../css/<%=css %>" rel="stylesheet" type="text/css">
<script language="JavaScript">
<!--
function refresh()
{
self.opener.location.reload();
window.close()
}
-->
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"
	background=../images/blue/e_p_bg.gif>
<table width="436" height="324" border="0" align="center"
	cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="mkglok_div">
	<tr>
		<td height="50">
		<p>&nbsp;</p>
		</td>
	</tr>
	<tr>
		<td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin:15px 0 0 0;">
			<tr>
				<td width="" height="140" class="Ffb">
				<div align="center"><%if (update) {

			%> <img src="../images/blue/suc.jpg" width="80" height="80"> <%} else {

			%> <img src="../images/blue/error.jpg" width="80" height="80"> <%}

			%></div>
				</td>
				<td width="236" height="140" style="font-weight:bold;padding:0 0 0 35px;">
				<%=info%>
				</td>
			</tr>
			<tr>
				<td colspan="3">
				
				</td>
			</tr>
			<tr>
				<td height="30" colspan="2">
				<div align="center"><%if (update || session.getAttribute("login") == null
					|| (!session.getAttribute("login").equals("true"))) {

			%> <input name="Submit" type="button" class="Gpbutton" value="关闭"
					onclick="refresh()"> <%} else {%> <input name="Submit"
					type="button" class="Gpbutton" value="返回" onClick="history.go(-1)">
				<%}

		%></div>
				</td>
			</tr>
			<tr>
				<td height="15" colspan="2">&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</body>
</html>
