<%@ page contentType="text/html; charset=GBK"%>
<%@page import="com.genius.search.tablelist.actionbean.SelectActionBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���ݱ����</title>
<style type="text/css"></style>

<link href="../adminmanager/css/style.css" rel=stylesheet type=text/css />
<script src="../adminmanager/css/tools.js" type="text/javascript"></script>

</head>

<body class="right_date_body">
<div class="bmgl_div">
<div class="right_date_top_nav">
	<ul>
      <%
		int flag = 0;
		List mylist = (ArrayList)request.getAttribute("titleLinkList");
		Iterator it = mylist.iterator();
      %>
		<li class="new"><a href="tl_insert.jsp?acttype=insert">���</a></li>
		<li class="del"><a href="javascript:document.form1.submit()">ɾ��</a></li>
		<li class="new"><a href="typelist.jsp">����</a></li>
	</ul>
</div>
<form action="<%=request.getAttribute("url") %>" method="post" name="searchForm">
<span id="search"></span>
</form>
</div>
<div class="bmgl_div">
<form method="post"	action="tl_delete.do?<%=request.getAttribute("query") %>" name="form1">
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
			<tr style="background:url(../adminmanager/images/title_bg.gif) repeat-x;font-weight:bold;">
				<td height="25"><div align="center">ѡ��</div></td>
				<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=tablevalue&ordertype=<%=request.getAttribute("ordertype") %>">���ݱ�����</a><img src="../adminmanager/images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('tablevalue')" /></div></td>
				<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=tabletext&ordertype=<%=request.getAttribute("ordertype") %>">��ʾ����</a><img src="../adminmanager/images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('tabletext')" /></div></td>
				<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=bz&ordertype=<%=request.getAttribute("ordertype") %>">��ע</a><img src="../adminmanager/images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('bz')" /></div></td>
				<td><div align="center">�༭</div></td>
			</tr>
			<%
				while (it.hasNext()) {
					SelectActionBean bean = (SelectActionBean)it.next();
					if (flag == 1) {
			%>
			<tr bgcolor="#F2F9FD">
				<td width=10%><div align="center">
				  <input type="checkbox" name="checkbox" value="<%=bean.getId() %>" />
			  </div></td>
				<td><div align="center"><%=bean.getTablevalue()%></div></td>
				<td><div align="center"><%=bean.getTabletext()%></div></td>
				<td><div align="center"><%=bean.getBz() %> </div></td>
				<td><div align="center"><a href="tl_insertselectedit.do?id=<%=bean.getId() %>">�༭</a></div></td>
			</tr>
			<%
					flag = 0;
					} else {
			%>
			<tr bgcolor="#FFFFFF">
				<td width=10%><div align="center">
				  <input type="checkbox" name="checkbox" value="<%=bean.getId() %>" />
			  </div></td>
				<td><div align="center"><%=bean.getTablevalue()%></div></td>
				<td><div align="center"><%=bean.getTabletext()%></div></td>
				<td><div align="center"><%=bean.getBz() %></div></td>
				<td><div align="center"><a href="tl_insertselectedit.do?id=<%=bean.getId() %>">�༭</a></div></td>
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


