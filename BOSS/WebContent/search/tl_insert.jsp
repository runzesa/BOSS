<%@ page contentType="text/html; charset=GBK"%>
<%@page import="com.genius.search.tablelist.actionbean.InsertActionBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>数据编辑</title>
<style type="text/css"></style>
<link href="../adminmanager/css/style.css" rel=stylesheet type=text/css />
<link rel="stylesheet" type="text/css" media="all" href="../adminmanager/css/calendar-win2k-cold-1.css" title="win2k-cold-1" />
<link rel="stylesheet" type="text/css" media="all" href="../adminmanager/css/skins/aqua/theme.css" title="Aqua" />
<script language="JavaScript">
<!--
var act = "<%=request.getParameter("acttype") %>";
function submit(){
	if(act=="insert" || act==""){
		document.form1.action="tl_insertnew.do";
		document.form1.submit();
	}else if(act=="update"){
		var id = "<%=request.getParameter("id") %>";
		document.form1.action="tl_insertedit.do?id="+id;
		document.form1.submit();
	}
}
-->
</script>
<base target="_self" />
</head>
<%
InsertActionBean bean = (InsertActionBean)request.getAttribute("bean");
%>
<body class="right_date_body">
<div class="bmgl_div">
<form method="post" action="insert.do" name="form1">
<input type="hidden" name="id" id="id" value="<%=request.getAttribute("updateid") %>"/>
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
	<tr style="background:url(../adminmanager/images/title_bg.gif) repeat-x;font-weight:bold;">
  		<td height="24" colspan="11" bgcolor="#DFEBF0"><div align="center">数据录入</div></td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">数据表名称:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="tablevalue" value="<%=bean==null?"":bean.getTablevalue() %>"/></td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">显示名称:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="tabletext" value="<%=bean==null?"":bean.getTabletext() %>"/></td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">备注:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="bz" value="<%=bean==null?"":bean.getBz() %>"/></td>
	</tr>
</table>
</form>
</div>
<p align="center"> 
	<a href="#" onclick="submit()"><img border="0" src="../adminmanager/images/button_b_bc.gif" width="77" height="21" /></a> 
	<a href="#" onclick="javascript:history.go(-1)"><img border="0" src="../adminmanager/images/button_b_fh.gif" width="77" height="21" /></a>
</p>
</body>
</html>

