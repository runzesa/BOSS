<%@ page contentType="text/html; charset=GBK" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>�������</title>
<link href="../css/style.css" rel=stylesheet type=text/css />
<script type="text/javascript" src="../../js/connectionpool_jquery.js"></script>
<script type="text/javascript" src="moduleinsert.js"></script>
<script language="JavaScript">

</script>
<base target="_self" />
</head>

<body class="right_date_body">
<div class="bmgl_div">
<form method="post" action="moduleinsert.do" name="form1">
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
	<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
		<td height="24" colspan="11" bgcolor="#DFEBF0">
			<div align="center">����¼��</div>
		</td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">����:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="name"/></td>
	</tr>
		<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">ģ���ַ:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="path" style="width:400px"/></td>
	</tr>
		<tr>
			<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">�Ƿ�Թ���Ա����:&nbsp;</div></td>
			<td bgcolor="#FFFFFF">&nbsp;<select name="is_open">
					<option value="0">�ɼ�</option>
					<option value="1">���ɼ�</option>
				</select>
			</td>
		</tr>
		
		<!---------------------------------- s t a r t --------------------------------------------------->
		<tr>
			<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">����Ϊ�Ż�ģ��:&nbsp;</div></td>
			<td bgcolor="#FFFFFF">&nbsp;<select name="portal" onchange="getPortalOptions()">
						<option value="0">��</option>
						<option value="1" selected="selected">��</option></select></td>
		</tr>
		
		<tr id="tr0" style="display:none">
			<td width="150" height="25" bgcolor="#FFFFFF">
				<div align="right">���Ӷ�Ӧ��ַ:&nbsp;</div>
				<input type="hidden" name="field" id="field"/>
			</td>
			<td bgcolor="#FFFFFF">
				&nbsp;<input type="text" id="urlx2" name="urlx2" style="width:350px"/>
			</td>
		</tr>
		<!----------------------------------- e n d -------------------------------------------------->
		
    </table>
  </form>
</div>
<p align="center"> 
    <a href="#"  onclick="submit()"><img border="0" src="../images/button_b_bc.gif" width="77" height="21"/></a> 
    <a href="#"  onclick="javascript:history.go(-1);return false;"><img border="0" src="../images/button_b_fh.gif" width="77" height="21"/></a>
</p>
 </body>

</html>

