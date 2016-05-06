<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=GBK"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>PC栏目管理</title>
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
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>资源ID:</td>
		<td  class="F"><div name="resource_id" id="resource_id"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>栏目图片:</td>
		<td  class="F"><div name="img_url" id="img_url"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>目标跳转类型:</td>
		<td  class="F"><div name="dest_type" id="dest_type"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>跳转地址:</td>
		<td  class="F"><div name="reource_param" id="reource_param"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>显示排序:</td>
		<td  class="F"><div name="resource_order" id="resource_order"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>正常使用:</td>
		<td  class="F"><div name="is_delete" id="is_delete"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>系统类型:</td>
		<td  class="F"><div name="show_type" id="show_type"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>栏目名称:</td>
		<td  class="F"><div name="resource_name" id="resource_name"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>展示位置:</td>
		<td  class="F"><div name="show_position" id="show_position"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>资源类型:</td>
		<td  class="F"><div name="resource_type" id="resource_type"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>创建时间:</td>
		<td  class="F"><div name="crreate_time" id="crreate_time"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>创建人:</td>
		<td  class="F"><div name="create_user" id="create_user"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>修改时间:</td>
		<td  class="F"><div name="modify_time" id="modify_time"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>修改人:</td>
		<td  class="F"><div name="modify_user" id="modify_user"></div></td>
	</tr>

</table>
</td></tr>

</table>
</body>
</html>


