<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.adminmanager.power_new.actionbean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>权限管理</title>
<link href="../css/style.css" rel=stylesheet type=text/css />
<script src="../css/tools.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript">
function callParentMethod(id){
	window.parent.getMoodule(id);
}
</script>
<base target="_self" />
</head>
<body class="right_date_body">
<form action="<%=request.getAttribute("url") %>" method="post" name="searchForm">
<span id="search"></span>
</form>

<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
	<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
		<td height="25"><div align="center"><a href="<%=request.getAttribute("url") %>&order=name&ordertype=<%=request.getAttribute("ordertype") %>">模块名称</a><img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('name')" /></div></td>
		<td width="100"><div align="center"><a href="<%=request.getAttribute("url") %>&order=moduletype&ordertype=<%=request.getAttribute("ordertype") %>">模块类型</a></div></td>
	</tr>
	<%
		int flag = 0;
		ArrayList<?> mylist = (ArrayList<?>) request.getAttribute("powerList");
		Iterator<?> it = mylist.iterator();
		while (it.hasNext()) {
			PowerSelectActionBean bean = (PowerSelectActionBean) it.next();
			if (flag == 1) {
	%>
	<tr bgcolor="#ffffff">
		<td height="20"><div align="center"><a href="javascript:void(0)" onclick="callParentMethod('<%=bean.getDatatype()!=null && bean.getDatatype().startsWith("普通")?bean.getId():""%>')"><%=bean.getName()%></a></div></td>
		<td><div align="center"><%=bean.getDatatype()%></div></td>
	</tr>
	<%
			flag = 0;
			} else {
	%>
	<tr bgcolor="#FFFFFF">
		<td height="20"><div align="center"><a href="javascript:void(0)" onclick="callParentMethod('<%=bean.getDatatype()!=null && bean.getDatatype().startsWith("普通")?bean.getId():""%>')"><%=bean.getName()%></a></div></td>
		<td><div align="center"><%=bean.getDatatype()%></div></td>
	</tr>
	<%
			flag = 1;
			}
		}
	%>
</table>

<div style="text-align:right;padding:0 25px 0 0;"><%=request.getAttribute("toolBar")%></div>
</body>
</html>

