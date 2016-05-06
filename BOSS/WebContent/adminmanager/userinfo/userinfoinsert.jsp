<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.adminmanager.userinfo.actionbean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>数据添加</title>
<link href="../css/style.css" rel=stylesheet type=text/css />
<script language="JavaScript">
<!--
var nameerror=<%=request.getParameter("ne")%>
if(nameerror==null ||nameerror==""){
	
}else{
	alert("用户ID已存在");
}
function submit(){
	if(document.form1.username.value==""){
		alert("用户ID不能为空");
		return;
	}
	if(document.form1.password.value==""){
		alert("密码不能为空");
		return;
	}
	if(document.form1.name.value==""){
		alert("姓名不能为空");
		return;
	}
	document.form1.action="userinfoinsert.do";
	document.form1.submit();
}
-->
</script>
<base target="_self" />
</head>

<body class="right_date_body">
<div class="bmgl_div">
<form method="post" action="userinfoinsert.do" name="form1">
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
			<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
				<td height="25" colspan="2" bgcolor="#DFEBF0"><div align="center">数据录入</div></td>
			</tr>
			<tr>
				<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">用户ID:&nbsp;</div></td>
			  <td bgcolor="#FFFFFF">&nbsp;<input type="text" name="username" /></td>
			</tr>
			<tr>
				<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">密码:&nbsp;</div></td>
			  <td bgcolor="#FFFFFF">&nbsp;<input type="text" name="password" /></td>
			</tr>
			<tr>
				<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">姓名:&nbsp;</div></td>
			  <td bgcolor="#FFFFFF">&nbsp;<input type="text" name="name" /></td>
			</tr>
			<tr>
				<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">部门:&nbsp;</div></td>
			  <td bgcolor="#FFFFFF">&nbsp;<input type="text" name="departmentname"
					value="<%=request.getAttribute("departmentName") %>" /> <input
					type="hidden" name="departmentId"
					value="<%=request.getAttribute("departmentId") %>" /></td>
			</tr>
			<tr>
				<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">角色:&nbsp;</div></td>
				<td bgcolor="#FFFFFF">&nbsp;<select name="rolename">
					<%
						ArrayList list = (ArrayList) request.getAttribute("rolenameList");
						Iterator it = list.iterator();
						while (it.hasNext()) {
							RolenameActionBean bean = (RolenameActionBean) it.next();
					%>
					<option value="<%=bean.getId() %>"><%=bean.getName()%></option>
					<%
					}
					%>
			  </select></td>
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

