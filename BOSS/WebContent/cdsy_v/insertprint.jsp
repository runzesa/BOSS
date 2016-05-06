<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=GBK"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>传道授业审核</title>
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
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>作者:</td>
		<td  class="F"><div name="user_id" id="user_id"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>操作状态:</td>
		<td  class="F"><div name="operate_state" id="operate_state"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>公开状态:</td>
		<td  class="F"><div name="open_state" id="open_state"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>分数:</td>
		<td  class="F"><div name="score" id="score"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>类型:</td>
		<td  class="F"><div name="type" id="type"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>学术学分:</td>
		<td  class="F"><div name="academic" id="academic"></div></td>
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
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>学科:</td>
		<td  class="F"><div name="department" id="department"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>标题:</td>
		<td  class="F"><div name="title" id="title"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>联合作者:</td>
		<td  class="F"><div name="audior_name" id="audior_name"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>创建时间:</td>
		<td  class="F"><div name="create_time" id="create_time"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>来源:</td>
		<td  class="F"><div name="source" id="source"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>摘要:</td>
		<td  class="F"><div name="info" id="info"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>关键字:</td>
		<td  class="F"><div name="key_word" id="key_word"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>内容:</td>
		<td  class="F"><div name="content" id="content"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>图片显示:</td>
		<td  class="F"><div name="img_url" id="img_url"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>UCG类型:</td>
		<td  class="F"><div name="ucg" id="ucg"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>学分申请状态:</td>
		<td  class="F"><div name="apply_state" id="apply_state"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>RANK分类:</td>
		<td  class="F"><div name="rank_type" id="rank_type"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>封面图片:</td>
		<td  class="F"><div name="cover_img" id="cover_img"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>附件:</td>
		<td  class="F"><div name="attachment_id" id="attachment_id"></div></td>
	</tr>

</table>
</td></tr>

</table>
</body>
</html>


