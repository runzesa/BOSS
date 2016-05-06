<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=GBK"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>病历交流管理</title>
<style type="text/css"></style>
<script src="../js/table.js" type=text/javascript></SCRIPT>
<script src="../js/connectionpool.js" type="text/javascript"></script>
<script src="../js/tools.js" type="text/javascript"></script>
<script src="../js/tabletools.js" type="text/javascript"></script>
<script src="../js/formtools.js" type="text/javascript"></script>
<script src="insertprint.js" type="text/javascript"></script>

<script language="JavaScript">
<!--
var id="<%=request.getParameter("id")%>";

window.onload=pageLoad;
var url="<%=request.getQueryString()%>";
-->
</script>
</head>

<body scroll="no">
<table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
<tr><td width="25">&nbsp;</td></tr>
<tr><td>
<table width="100%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#cccccc">
	
	<tr bgcolor="#FFFFFF"  style="display: none;">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>id:</td>
		<td  class="F"><div name="id" id="id"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>case_id:</td>
		<td  class="F"><div name="case_id" id="case_id"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>留言人:</td>
		<td  class="F"><div name="user_id" id="user_id"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>内容:</td>
		<td  class="F"><div name="content" id="content"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>创建时间:</td>
		<td  class="F"><div name="create_time" id="create_time"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>修改时间:</td>
		<td  class="F"><div name="modify_time" id="modify_time"></div></td>
	</tr>

</table>
</td></tr>

</table>
</body>
</html>


