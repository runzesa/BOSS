<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="com.genius.adminmanager.userinfo.*"%>
<%@ page import="com.genius.portal.shortcut.*"%>
<%@ page import="com.genius.portal.shortcut.actionbean.*"%>
<%@ page import="java.util.*"%>

<%String info = "��ӱ�ǩ�ɹ���";
			boolean update = false;
			String css = "";
			if (session.getAttribute("login") == null
					|| (!session.getAttribute("login").equals("true"))) {
				info = "ϵͳ�ѳ�ʱ�������µ�½��";
				css = "Gp_blue.css";

			} else {
				css = session.getAttribute("style").toString();
				String name = request.getParameter("name");
				String link = request.getParameter("link");
				String image = request.getParameter("image");

				Shortcut cut = new Shortcut();
				//if(�鿴���ݿⱾ�û��ĸ���������10�����򲻽����������)

				ArrayList list = new ArrayList();
				list = cut.selectCount(session.getAttribute("userId")
						.toString());

				for (int i = 0; i < list.size(); i++) {
					ShortcutBean bean = (ShortcutBean) list.get(i);
					String allCount = bean.getCount();
					int amount = 0;
					amount = Integer.valueOf(allCount).intValue();

					if (name == null || link == null || image == null) {
						info = "��Ӵ�����������ӣ�";
					} else {
						if (link.equals("") || name.equals("")
								|| image.equals("")) {
							info = "��Ӵ�����������ӣ�";
						} else {

							if (amount <= 9) {
								if (cut.insert(session.getAttribute("userId")
										.toString(), name, link, image)) {
									info = "��ӱ�ǩ�ɹ���";
									update = true;

								} else {
									info = "��Ӵ�����������ӣ�";
								}
							} else {
								info = "��ǩ�������10�����ѵ���������ޣ�";
							}
						}
					}
				}
			}
			%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ǩ����</title>
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

			%> <input name="Submit" type="button" class="Gpbutton" value="�ر�"
					onclick="refresh()"> <%} else {%> <input name="Submit"
					type="button" class="Gpbutton" value="����" onClick="history.go(-1)">
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
