<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.genius.adminmanager.dataanalysis.actionbean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	DataAUpdateActionBean bean = (DataAUpdateActionBean) request.getAttribute("module");
	String showtype = "";
	if(bean!=null)showtype = bean.getShowtype();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>数据编辑</title>
<link href="../css/style.css" rel=stylesheet type=text/css />
<script type="text/javascript" src="../../js/connectionpool.js"></script>
<script language="JavaScript">
<!--
function submit(){
	document.form1.submit();
}
-->
</script>
<base target="_self"/>
</head>

<body class="right_date_body" >
<div class="bmgl_div">
<form method="post" action="dataupdate.do?act=tab" name="form1" >
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
	<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
    <td height="24" colspan="11" bgcolor="#DFEBF0"><div align="center">数据编辑</div></td>
  </tr>
  <input type="hidden" name="id" value="<%=bean.getId() %>" />
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">名称:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="name" value="<%=bean.getName() %>" /></td>
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

