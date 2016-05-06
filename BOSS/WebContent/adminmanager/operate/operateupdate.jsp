<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.genius.adminmanager.operate.actionbean.*"%>
<%
	OperateUpdateActionBean operateBean = (OperateUpdateActionBean) request.getAttribute("operate");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>数据编辑</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../css/style.css" rel=stylesheet type=text/css />
<script language="JavaScript">
<!--
function submit(){
	document.form1.action="operateupdate.do";
	document.form1.submit();
}
-->
</script>
<base target="_self" />
</head>

<body class="right_date_body">
<div class="bmgl_div">
	<form method="post" action="operateupdate.do" name="form1">
		<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
			<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
				<td height="24" colspan="11" bgcolor="#DFEBF0">
				<div align="center">数据编辑</div>
				</td>
			</tr>
				<input type="hidden" name="id" value="<%=operateBean.getId() %>" />
			<tr>
				<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">名称:&nbsp;</div></td>
				<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="name"
					value="<%=operateBean.getName() %>" /></td>
			</tr>
			<tr>
				<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">模块:&nbsp;</div></td>
				<td bgcolor="#FFFFFF">&nbsp;<select name="moduleid">
					<%
							{
							ArrayList list = (ArrayList) request.getAttribute("moduleidList");
							Iterator it = list.iterator();
							while (it.hasNext()) {
								ModuleidActionBean bean = (ModuleidActionBean) it.next();
					%>
					<option value="<%=bean.getId()%>"
						<%if(bean.getId().equals(operateBean.getModuleid())){out.print("selected");}%>><%=bean.getName()%>
					</option>
					<%
							}
						}
					%>
				</select></td>
			</tr>
			<tr>
				<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">类名:&nbsp;</div></td>
				<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="classname"	value="<%=operateBean.getClassname() %>" size="50" /></td>
			</tr>
			<tr>
				<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">方法名:&nbsp;</div></td>
				<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="methodname" value="<%=operateBean.getMethodname() %>" size="50" /></td>
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

