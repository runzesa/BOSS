<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="com.genius.adminmanager.userinfo.*"%>
<%@ page import="com.genius.portal.shortcut.*"%>

<%String info;
			boolean update = false;
			String css = "";
			if (session.getAttribute("login") == null
					|| (!session.getAttribute("login").equals("true"))) {
				info = "ϵͳ�ѳ�ʱ�������µ�½��";
				css = "Gp_blue.css";
			} else {
				css = session.getAttribute("style").toString();
				String id[] = request.getParameterValues("id");

				Shortcut cut = new Shortcut();
				if (id != null && id.length > 0) {
					if (cut.delete(id)) {
						info = "ɾ����ǩ�ɹ���";
						update = true;
					} else {
						info = "ɾ��ʧ�ܣ���������ӣ�";
					}
				} else {
					info = "��ѡ��Ҫɾ���ı�ǩ�";
				}
			}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>ɾ����ǩ</title>
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
	cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="scbqok_div">
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
				<td height="15">&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</body>
</html>
