<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=GBK"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>病历管理</title>
<style type="text/css"></style>
<script src="../js/table.js" type=text/javascript></SCRIPT>
<script src="../js/connectionpool.js" type="text/javascript"></script>
<script src="../js/tools.js" type="text/javascript"></script>
<script src="../js/tabletools.js" type="text/javascript"></script>
<script src="../js/formtools.js" type="text/javascript"></script>
<script src="insertprint.js" type="text/javascript"></script>

<script language="JavaScript">
<!--
var ID="<%=request.getParameter("ID")%>";

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
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>ID:</td>
		<td  class="F"><div name="ID" id="ID"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>姓名:</td>
		<td  class="F"><div name="NAME" id="NAME"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>性别:</td>
		<td  class="F"><div name="SEX" id="SEX"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>年龄:</td>
		<td  class="F"><div name="AGE" id="AGE"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>疾病名称:</td>
		<td  class="F"><div name="DISEASE" id="DISEASE"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>症状描述:</td>
		<td  class="F"><div name="DISCRIBE" id="DISCRIBE"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>病历图片:</td>
		<td  class="F"><div name="case_imgs" id="case_imgs"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>分科:</td>
		<td  class="F"><div name="SECTION" id="SECTION"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>创建人:</td>
		<td  class="F"><div name="CREATE_USER_ID" id="CREATE_USER_ID"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>创建时间:</td>
		<td  class="F"><div name="CREATE_TIME" id="CREATE_TIME"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>流转状态:</td>
		<td  class="F"><div name="STATE" id="STATE"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>接收医生:</td>
		<td  class="F"><div name="RECIEVE_USER_ID" id="RECIEVE_USER_ID"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>诊断时间:</td>
		<td  class="F"><div name="SOLVE_TIME" id="SOLVE_TIME"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>诊断结果:</td>
		<td  class="F"><div name="SOLVE_CONTENT" id="SOLVE_CONTENT"></div></td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td  class="F" width=20% valign='top' bgcolor='#efefef'>越级:</td>
		<td  class="F"><div name="is_jump_ask" id="is_jump_ask"></div></td>
	</tr>

</table>
</td></tr>

</table>
</body>
</html>


