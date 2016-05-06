<%@ page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>数据编辑</title>
<link href="../css/style.css" rel=stylesheet type=text/css />
<script language="JavaScript">
<!--
function submit(){
	document.form1.action="passwordupdate.do";
	document.form1.submit();
}
function checkinfo(){
	var info = '<%=request.getAttribute("info")%>';
	if(info!=null && info!="" && info!="null"){
		alert(info);
	}
}
-->
</script>
<base target="_self" />
</head>

<body class="right_date_body" onload="checkinfo()">
<div class="bmgl_div">
	<form method="post" action="moduleupdate.do" name="form1">
		<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
			<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
				<td height="24" colspan="11" bgcolor="#DFEBF0">
				<div align="center">密码修改</div>
				</td>
			</tr>
			<tr>
				<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">请输入旧密码:&nbsp;</div></td>
				<td bgcolor="#FFFFFF">&nbsp;<input type="password" name="oldPassword" value="" /></td>
			</tr>
			<tr>
				<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">请输入新密码:&nbsp;</div></td>
				<td bgcolor="#FFFFFF">&nbsp;<input type="password" name="newPassword" value="" /></td>
			</tr>
			<tr>
				<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">请确认新密码:&nbsp;</div></td>
				<td bgcolor="#FFFFFF">&nbsp;<input type="password" name="againNewPassword" value="" /></td>
			</tr>
		</table>
	</form>
	</div>
	<p align="center">
		<a href="#" onclick="submit()"><img border="0" src="../images/button_b_bc.gif" width="77" height="21" /></a>
		<a href="#" onclick="javascript:history.go(-1)"><img border="0" src="../images/button_b_fh.gif" width="77" height="21" /></a>
	</p>

</body>

</html>

