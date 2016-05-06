<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.genius.adminmanager.power.actionbean.*"%>
<%
PowerUpdateActionBean powerBean = (PowerUpdateActionBean)request.getAttribute("power");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>数据编辑</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
<!--
function submit(){
	document.form1.action="powerupdate.do";
	document.form1.submit();
}
function openwindow(link){
	window.open(link,'menu','status=yes,width=400,height=600') 
}
-->
</script>
<base target="_self" />
</head>

<body class="right_date_body">
<div class="bmgl_div">
<form method="post" action="powerinsert.do" name="form1">
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
	<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
		<td height="24" colspan="11" bgcolor="#DFEBF0">
			<div align="center">数据编辑</div>
			<input type="hidden" name="id" value="<%=powerBean.getId() %>" />
		</td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">角色:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<select name="roleId">
			<%
				{
				ArrayList list = (ArrayList) request.getAttribute("rolenameList");
				Iterator it = list.iterator();
				while (it.hasNext()) {
					RolenameActionBean bean = (RolenameActionBean) it.next();
			%>
			<option value="<%=bean.getId()%>"
				<%if(bean.getId().equals(powerBean.getRoleId())){out.print("selected");}%>><%=bean.getName()%>
			</option>
			<%
				}
				}
			%>
		</select></td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">判断方法:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<input type=radio name="sidtype" value="0"
			<%if(powerBean.getSidtype().equals("0")){ %> checked <%} %> />用户<input
			type=radio name="sidtype" value="1"
			<%if(powerBean.getSidtype().equals("1")){ %> checked <%} %> />部门
		</td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">操作:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="operateName" size="80" value="<%=powerBean.getOperateName() %>" />
			<input type="hidden" name="operateId" value="<%=powerBean.getOperateId() %>" />
			<input type="button" name="nameselect" value="选择" onclick="openwindow('../operate/operatetree.jsp?formname=form1&nameinput=operateName&idinput=operateId')" />
		</td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">类型:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<select name="datatypeType">
			<%
				{
					ArrayList list = (ArrayList)request.getAttribute("datatypeList");
					Iterator it = list.iterator();
					while (it.hasNext()) {
						DatatypeActionBean bean = (DatatypeActionBean) it.next();
			%>
			<option value="<%=bean.getType()%>"
				<%if(bean.getType().equals(powerBean.getDatatypeType())){out.print("selected");}%>><%=bean.getRemark()%>
			</option>
			<%
				}
				}
			%>
		</select></td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">S_ID:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<input type="text" name="sid" size="80"
			value="<%=powerBean.getSid() %>" /></td>
	</tr>
	<tr>
		<td width="150" height="25" bgcolor="#FFFFFF"><div align="right">SQL:&nbsp;</div></td>
		<td bgcolor="#FFFFFF">&nbsp;<textarea name="sqlcontent" cols="80" rows="8" /><%=powerBean.getSqlcontent()%></textarea></td>
	</tr>
</table>
</form>
</div>
<p align="center">
	<a href="#" onclick="submit()"><img border="0" src="../images/button_b_bc.gif" width="77" height="21" /></a>
</p>
</body>
</html>