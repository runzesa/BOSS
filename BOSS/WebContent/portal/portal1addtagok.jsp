<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="com.genius.adminmanager.userinfo.*"%>
<%@ page import="com.genius.portal.shortcut.*"%>
<%@ page import="com.genius.portal.shortcut.actionbean.*"%>
<%@ page import="java.util.*"%>

<%String info = "添加标签成功！";
			boolean update = false;
			String css = "";
			if (session.getAttribute("login") == null
					|| (!session.getAttribute("login").equals("true"))) {
				info = "系统已超时，请重新登陆！";
				css = "Gp_blue.css";

			} else {
				css = session.getAttribute("style").toString();
				String name = request.getParameter("name");
				String link = request.getParameter("link");
				String image = request.getParameter("image");

				Shortcut cut = new Shortcut();
				//if(查看数据库本用户的个数，超过10个，则不进行下面操作)

				ArrayList list = new ArrayList();
				list = cut.selectCount(session.getAttribute("userId")
						.toString());

				for (int i = 0; i < list.size(); i++) {
					ShortcutBean bean = (ShortcutBean) list.get(i);
					String allCount = bean.getCount();
					int amount = 0;
					amount = Integer.valueOf(allCount).intValue();

					if (name == null || link == null || image == null) {
						info = "添加错误，请重新添加！";
					} else {
						if (link.equals("") || name.equals("")
								|| image.equals("")) {
							info = "添加错误，请重新添加！";
						} else {

							if (amount <= 9) {
								if (cut.insert(session.getAttribute("userId")
										.toString(), name, link, image)) {
									info = "添加标签成功！";
									update = true;

								} else {
									info = "添加错误，请重新添加！";
								}
							} else {
								info = "标签最多可添加10个，已到达添加上限！";
							}
						}
					}
				}
			}
			%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>标签管理</title>
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

<body>
<table width="436" height="324" border="0" align="center"
	cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="bqglok_div">
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
