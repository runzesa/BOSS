<%@ page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>数据添加</title>
<link href="../css/style.css" rel=stylesheet type=text/css />
<link rel="stylesheet" type="text/css" media="all"
	href="../css/calendar-win2k-cold-1.css" title="win2k-cold-1" />
<link rel="stylesheet" type="text/css" media="all"
	href="../css/skins/aqua/theme.css" title="Aqua" />

<script type="text/javascript" src="../css/calendar.js"></script>
<script type="text/javascript" src="../css/calendar-cn.js"></script>
<script type="text/javascript" src="../css/calendar-setup.js"></script>
<script language="JavaScript">
<!--
function submit()
{
	document.form1.action="departmentinsert.do";
	document.form1.submit();
}
-->
</script>
<base target="_self" />
</head>

<body class="right_date_body">
<div class="bmgl_div">
<form method="post" action="departmentinsert.do" name="form1">
	<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
		<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
			<td colspan="2" height="25"><div align="center">数据录入</div></td>
		</tr>
		<tr>
			<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">您选择的父部门是:&nbsp;</div></td>
			<td height="25" bgcolor="#FFFFFF">&nbsp;<%=request.getAttribute("parentName") %></td>
		</tr>
		<tr>
			<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">部门名称:&nbsp;</div></td>
			<td height="25" bgcolor="#FFFFFF">&nbsp;<input type="text" name="name" /><input type="hidden" name="parentname" value="<%=request.getAttribute("parentId") %>" /></td>
		</tr>
		<tr>
			<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">部门电话:&nbsp;</div></td>
		  	<td height="25" bgcolor="#FFFFFF">&nbsp;<input type="text" name="bmPhone" /></td>
		</tr>
		<tr>
			<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">部门描述:&nbsp;</div></td>
		  	<td height="25" bgcolor="#FFFFFF">&nbsp;<textarea rows="3" cols="50" name="remark" id="remark"></textarea></td>
		</tr>
	</table>
</form>
</div>
<p align="center">
	<a href="#" onclick="submit()"><img border="0" src="../images/button_b_bc.gif" width="77" height="21" /></a>
	<a href="#" onclick="javascript:history.go(-1);return false;"><img border="0" src="../images/button_b_fh.gif" width="77" height="21" /></a>
</p>
</body>

</html>

