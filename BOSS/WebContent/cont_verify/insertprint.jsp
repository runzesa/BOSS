<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=GBK"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>医学联络员审核</title>
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
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>账号：:</td>
		<td  class="F"><div name="account" id="account"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>姓名：:</td>
		<td  class="F"><div name="name" id="name"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>email：:</td>
		<td  class="F"><div name="email" id="email"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>电话：:</td>
		<td  class="F"><div name="phone_no" id="phone_no"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>头像：:</td>
		<td  class="F"><div name="head_img" id="head_img"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>性别：:</td>
		<td  class="F"><div name="sex" id="sex"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>身份证图像：:</td>
		<td  class="F"><div name="idcard_img" id="idcard_img"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>身份证号：:</td>
		<td  class="F"><div name="id_card_no" id="id_card_no"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>生日：:</td>
		<td  class="F"><div name="birthday" id="birthday"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>角色：:</td>
		<td  class="F"><div name="role" id="role"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>注册时间：:</td>
		<td  class="F"><div name="register_time" id="register_time"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>认证情况：:</td>
		<td  class="F"><div name="is_identify" id="is_identify"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>状态:</td>
		<td  class="F"><div name="status" id="status"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>积分值：:</td>
		<td  class="F"><div name="point" id="point"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>学分值：:</td>
		<td  class="F"><div name="credit" id="credit"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>认证图片：:</td>
		<td  class="F"><div name="cert_img" id="cert_img"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>地区：:</td>
		<td  class="F"><div name="area" id="area"></div></td>
	</tr>

</table>
</td></tr>

</table>
</body>
</html>


