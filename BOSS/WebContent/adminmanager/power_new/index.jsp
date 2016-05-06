<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.adminmanager.role.actionbean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>角色管理</title>
<link href="../css/style.css" rel=stylesheet type=text/css />
<script src="../css/tools.js" type="text/javascript" />

<base target="_self" />
</head>

<body class="right_date_body">
<div class="bmgl_div">
<div class="right_date_top_nav">
	<ul>
     	<li class="new"><a href="#">权限管理</a></li>
	</ul>
</div>
<form action="<%=request.getAttribute("url") %>" method="post" name="searchForm">
<span id="search"></span>
</form>
</div>
<div class="bmgl_div">
<form method="post" action="roledelete.do?<%=request.getAttribute("query") %>" name="form1">
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
			<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
				<td height="25"><div align="center"><a href="<%=request.getAttribute("url") %>&order=name&ordertype=<%=request.getAttribute("ordertype") %>">角色名称</a><img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('name')" /></div></td>
				<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=remark&ordertype=<%=request.getAttribute("ordertype") %>">角色描述</a><img src="../images/search.png"style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('remark')" /></div></td>
			</tr>
			<%
				int flag = 0;

				ArrayList mylist = (ArrayList) request.getAttribute("roleList");
				Iterator it = mylist.iterator();
				while (it.hasNext()) {
					RoleSelectActionBean bean = (RoleSelectActionBean) it.next();
					if (flag == 1) {
			%>
			<tr bgcolor="#ffffff">
				<td height="20"><div align="center"><a href="select.do?act=index&roleid=<%=bean.getId() %>&roleName=<%=bean.getName()%>"><%=bean.getName()%></a></div></td>
				<td><div align="center"><%=bean.getRemark() %></div></td>
			</tr>
			<%
					flag = 0;
					} else {
			%>
			<tr bgcolor="#FFFFFF">
				<td height="20"><div align="center"><a href="select.do?act=index&roleid=<%=bean.getId() %>&roleName=<%=bean.getName()%>"><%=bean.getName()%></a></div></td>
				<td><div align="center"><%=bean.getRemark() %></div></td>
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

