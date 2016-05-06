<%@ page contentType="text/html; charset=GBK"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.genius.search.searchtype.actionbean.SelectActionBean"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>查询类型管理</title>

<link href="../adminmanager/css/style.css" rel=stylesheet type=text/css />
<script src="../adminmanager/css/tools.js" type="text/javascript"></script>
</head>

<body class="right_date_body">
<div class="bmgl_div">
<div class="right_date_top_nav">
	<ul>
      <%
		int flag = 0;
		List mylist = (ArrayList)request.getAttribute("dataList");
		Iterator it = mylist.iterator();
      %>
		<li class="new"><a href="st_insertselectnew.do">添加</a></li>
		<li class="del"><a href="javascript:document.form1.submit()">删除</a></li>
		<li class="new"><a href="typelist.jsp">返回</a></li>
	</ul>
</div>
<form action="<%=request.getAttribute("url") %>" method="post" name="searchForm">
<span id="search"></span>
</form>
</div>
<div class="bmgl_div">
<form method="post"	action="st_delete.do?<%=request.getAttribute("query") %>" name="form1">
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
			<tr style="background:url(../adminmanager/images/title_bg.gif) repeat-x;font-weight:bold;">
				<td height="25"><div align="center">选择</div></td>
				<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=searchname&ordertype=<%=request.getAttribute("ordertype") %>">类型名称</a><img src="../adminmanager/images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('searchname')" /></div></td>
				<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=searchparentid&ordertype=<%=request.getAttribute("ordertype") %>">所属类型</a><img src="../adminmanager/images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('searchparentid')" /></div></td>
				<td><div align="center">编辑</div></td>
			</tr>
			<%
				while (it.hasNext()) {
					SelectActionBean bean = (SelectActionBean)it.next();
					if (flag == 1) {
			%>
			<tr bgcolor="#F2F9FD">
				<td width=10%><div align="center">
				  <input type="checkbox" name="checkbox" value="<%=bean.getSearchid() %>" />
			  </div></td>
				<td><div align="center"><%=bean.getSearchname()%></div></td>
				<td><div align="center"><%=bean.getSearchparentid()%></div></td>
				<td><div align="center"><a href="st_insertselectedit.do?id=<%=bean.getSearchid() %>">编辑</a></div></td>
			</tr>
			<%
						flag = 0;
					} else {
			%>
			<tr bgcolor="#FFFFFF">
				<td width=10%><div align="center">
				  <input type="checkbox" name="checkbox" value="<%=bean.getSearchid() %>" />
			  </div></td>
				<td><div align="center"><%=bean.getSearchname()%></div></td>
				<td><div align="center"><%=bean.getSearchparentid()%></div></td>
				<td><div align="center"><a href="st_insertselectedit.do?id=<%=bean.getSearchid() %>">编辑</a></div></td>
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
