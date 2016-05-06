<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.genius.adminmanager.module2.actionbean.*" %>
<%@ page import="com.genius.adminmanager.module.actionbean.ModuleDataAUpdateActionBean" %>
<%
	ModuleUpdateActionBean bean = (ModuleUpdateActionBean) request.getAttribute("module");
	ModuleDataAUpdateActionBean bean2 = (ModuleDataAUpdateActionBean) request.getAttribute("dataA");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>数据编辑</title>
<link href="../css/style.css" rel=stylesheet type=text/css />
<script type="text/javascript" src="../../js/connectionpool_jquery.js"></script>
<script type="text/javascript" src="moduleupdate.js"></script>
<script language="JavaScript">

</script>
<base target="_self" />
</head>

<body class="right_date_body">
<div class="bmgl_div">
<form method="post" action="moduleupdate.do" name="form1" >
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
	<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
    <td height="24" colspan="11" bgcolor="#DFEBF0">
    	<div align="center">数据编辑</div>
  		<input type="hidden" name="id" value="<%=bean.getId() %>"/>
		<input type="hidden" name="dataid" value="<%=bean2!=null && bean2.getId()!=null?bean2.getId():"" %>"/>
    </td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">名称:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="name" value="<%=bean!=null && bean.getName()!=null?bean.getName():"" %>" /></td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">模块地址:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="path" style="width:400px" value="<%=bean!=null && bean.getLink()!=null?bean.getLink():"" %>" /></td>
	</tr>
		<tr>
			<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">是否对管理员开放:&nbsp;</div></td>
			<td bgcolor="#FFFFFF">&nbsp;<select name="is_open">
					<%String isopen = bean.getIs_open();%>
					<option value="0" <%=bean!=null && bean.getIs_open()!=null && bean.getIs_open().equals("0")?"selected":"" %>>可见</option>
					<option value="1" <%=bean!=null && bean.getIs_open()!=null && bean.getIs_open().equals("1")?"selected":"" %>>不可见</option>
				</select>
			</td>
		</tr>
		
		<!---------------------------------- s t a r t --------------------------------------------------->
		<tr>
			<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">设置为门户模块:&nbsp;</div></td>
			<td bgcolor="#FFFFFF">&nbsp;<select name="portal" onchange="getPortalOptions()">
						<option value="0" <%=bean.getPortal()!=null && bean.getPortal().equals("0")?"selected":"" %>>是</option>
						<option value="1" <%=bean.getPortal()==null || bean.getPortal().equals("1")?"selected":"" %>>否</option></select></td>
		</tr>
		
		<tr id="tr0" style="display:<%=bean.getPortal()!=null && bean.getPortal().equals("0")?"":"none" %>">
			<td width="150" height="25" bgcolor="#FFFFFF">
				<div align="right">链接对应地址:&nbsp;</div>
				<input type="hidden" name="field" id="field"/>
			</td>
			<td bgcolor="#FFFFFF">
				&nbsp;<input type="text" id="urlx2" name="urlx2" style="width:350px" value="<%=bean2!=null && bean2.getFields()!=null?bean2.getFields():"" %>"/>
			</td>
		</tr>
		<!----------------------------------- e n d -------------------------------------------------->
	</table>
</form>
</div>
<p align="center"> 
	<a href="#"  onclick="submit()"><img border="0" src="../images/button_b_bc.gif" width="77" height="21" /></a> 
	<a href="#"  onclick="javascript:history.go(-1);return false;"><img border="0" src="../images/button_b_fh.gif" width="77" height="21" /></a>
</p>
</body>

</html>

