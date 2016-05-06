<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.adminmanager.operate.actionbean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>操作管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../css/style.css" rel=stylesheet type=text/css />
<script src="../css/tools.js" type="text/javascript"></script>
<base target="_self" />
</head>

<body class="right_date_body">
<div class="bmgl_div">
<%
	String moduleId = (request.getAttribute("moduleId") == null ? ""
		: request.getAttribute("moduleId").toString());
	String moduleName = (request.getAttribute("moduleName") == null ? ""
		: request.getAttribute("moduleName").toString());
	if (moduleId == null || moduleId.length() <= 0) {
		moduleId = "0";
		moduleName = "";
	}
	boolean isShow = false;
	ArrayList showList = (ArrayList) request.getAttribute("operateList");
	if(showList.size() ==0)
		isShow = false;
	else
		isShow = true;
%>
<div class="right_date_top_nav">
	<ul>
		<li class="new"><a href="operateinsertselect.do?moduleid=<%=moduleId %>">添加</a></li>
		<li class="del"><a href="javascript:document.form1.submit()">删除</a></li>
		<%if(moduleId !="0" && isShow ){ %>
		<li class="new"><a href = "operatepowerinit.do?moduleid=<%=moduleId %>">权限管理</a></li>
		<%} %>
		<li><span>您选择的模块是：<%=moduleName%></span></li>
	</ul>
</div>

<form action="<%=request.getAttribute("url") %>" method="post" name="searchForm">
<span id="search"></span>
</form>
</div>
<div class="bmgl_div">
<form method="post" action="operatedelete.do?<%=request.getAttribute("query") %>" name="form1">
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
     <tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
				<td height="25"><div align="center">选择</div></td>
				<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=name&ordertype=<%=request.getAttribute("ordertype") %>">名称</a><img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('name')" /></div></td>
				<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=module_name&ordertype=<%=request.getAttribute("ordertype") %>">模块名称</a><img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('module_name')" /></div></td>
				<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=class_name&ordertype=<%=request.getAttribute("ordertype") %>">类名</a><img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('class_name')" /></div></td>
				<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=method_name&ordertype=<%=request.getAttribute("ordertype") %>">方法名</a><img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('method_name')" /></div></td>
				<td><div align="center">编辑</div></td>
			</tr>
			<%
				int flag = 0;

				ArrayList mylist = (ArrayList) request.getAttribute("operateList");
				Iterator it = mylist.iterator();
				while (it.hasNext()) {
					OperateSelectActionBean bean = (OperateSelectActionBean) it
					.next();
					if (flag == 1) {
			%>
			<tr bgcolor="#F2F9FD">
				<td width=10%><div align="center"><input type="checkbox" name="checkbox" value="<%=bean.getId() %>" /></div></td>
				<td><div align="center"><%=bean.getName()%></div></td>
				<td><div align="center"><%=bean.getModulename()%></div></td>
				<td><div align="center"><%=bean.getClassname()%></div></td>
				<td><div align="center"><%=bean.getMethodname()%></div></td>
				<td><div align="center"><a href="operateupdateselect.do?updateid=<%=bean.getId() %>">编辑</a></div></td>
			</tr>
			<%
					flag = 0;
					} else {
			%>
			<tr bgcolor="#FFFFFF">
				<td width=10%><div align="center"><input type="checkbox" name="checkbox" value="<%=bean.getId() %>" /></div></td>
				<td><div align="center"><%=bean.getName()%></div></td>
				<td><div align="center"><%=bean.getModulename()%></div></td>
				<td><div align="center"><%=bean.getClassname()%></div></td>
				<td><div align="center"><%=bean.getMethodname()%></div></td>
				<td><div align="center"><a href="operateupdateselect.do?updateid=<%=bean.getId() %>">编辑</a></div></td>
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

