<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.adminmanager.power.actionbean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>权限管理</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script src="../css/tools.js" type="text/javascript"></script>
<script type="text/javascript" >
	function goto1(id,rname){
		document.location="../power_new/index2.jsp?act=index&roleid="+id+"&roleName="+rname;
	}
	function goto2(id,rname){
		document.location="../left/menutree_role.jsp?roleid="+id+"&roleName="+rname;
	}
</script>
<base target="_self" />
</head>
<%
	String roleId = (request.getAttribute("roleId") == null ? ""
			: request.getAttribute("roleId").toString());
	String roleName = (request.getAttribute("roleName") == null ? ""
			: request.getAttribute("roleName").toString());
	if (roleId == null || roleId.length() <= 0) {
		roleId = "0";
		roleName = "";
	}
%>

<body class="right_date_body">
<div class="bmgl_div">
<div class="right_date_top_nav">
	<ul>
     	<li class="new"><a href="powerinsertselect.do?roleid=<%=roleId %>">添加</a></li>
     	<li class="del"><a href="javascript:document.form1.submit()">删除</a></li>
	</ul>
</div>
<!--div class="yhgl_div">	
 您选择的角色是：<%=roleName%> &nbsp;
	<a href="powerinsertselect.do?roleid=<%=roleId %>">添加</a>&nbsp;|&nbsp;
	<a href="javascript:document.form1.submit()">删除</a>
</div-->
<form action="<%=request.getAttribute("url") %>" method="post" name="searchForm">
<span id="search"></span>
</form>
</div>
<div class="bmgl_div">
<form method="post" action="powerdelete.do?<%=request.getAttribute("query") %>" name="form1">
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
				<td height="25"><div align="center">选择</div></td>
				<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=role_name&ordertype=<%=request.getAttribute("ordertype") %>">角色名称</a><img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('role_name')" /></div></td>
				<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=module_name&ordertype=<%=request.getAttribute("ordertype") %>">模块名称</a><img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('module_name')" /></div></td>
				<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=operate_name&ordertype=<%=request.getAttribute("ordertype") %>">操作名称</a><img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('operate_name')" /></div></td>
				<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=datatype&ordertype=<%=request.getAttribute("ordertype") %>">类型</a><img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('datatype')" /></div></td>
				<td><div align="center">编辑</div></td>
			</tr>
			<%
				int flag = 0;
				ArrayList mylist = (ArrayList) request.getAttribute("powerList");
				Iterator it = mylist.iterator();
				while (it.hasNext()) {
					PowerSelectActionBean bean = (PowerSelectActionBean) it.next();
					if (flag == 1) {
			%>
			<tr bgcolor="#ffffff">
				<td width=10%><div align="center"><input type="checkbox" name="checkbox" value="<%=bean.getId() %>" /></div></td>
				<td><div align="center"><%=bean.getRolename()%></div></td>
				<td><div align="center"><%=bean.getModulename()%></div></td>
				<td><div align="center"><%=bean.getOperatename()%></div></td>
				<td><div align="center"><%=bean.getDatatype()%></div></td>
				<td><div align="center"><a href="powerupdateselect.do?updateid=<%=bean.getId() %>">编辑</a></div></td>
			</tr>
			<%
					flag = 0;
					} else {
			%>
			<tr bgcolor="#FFFFFF">
				<td width=10%><div align="center"><input type="checkbox" name="checkbox" value="<%=bean.getId() %>" /></div></td>
				<td><div align="center"><%=bean.getRolename()%></div></td>
				<td><div align="center"><%=bean.getModulename()%></div></td>
				<td><div align="center"><%=bean.getOperatename()%></div></td>
				<td><div align="center"><%=bean.getDatatype()%></div></td>
				<td><div align="center"><a href="powerupdateselect.do?updateid=<%=bean.getId() %>">编辑</a></div></td>
			</tr>
			<%
					flag = 1;
					}
				}
			%>
		</table>
</form>
</div>
<div style="text-align:right;padding:0 25px 0 0;"><%=request.getAttribute("toolBar")%></div>
</body>

</html>

