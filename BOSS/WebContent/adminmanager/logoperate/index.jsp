<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.adminmanager.logoperate.actionbean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>操作日志</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../css/style.css" rel=stylesheet type=text/css />
<script src="../css/tools.js" type="text/javascript"></script>
<base target="_self" />
</head>

<body topmargin="0" leftmargin="0">
<br />
<body class="right_date_body">
<div class="bmgl_div">
<form action="<%=request.getAttribute("url") %>" method="post" name="searchForm">
<span id="search"></span>
</form>
<form method="post" action="roledelete.do?<%=request.getAttribute("query") %>" name="form1">
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
			<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
				<td height="25"><div align="center"><a href="<%=request.getAttribute("url") %>&order=user_id&ordertype=<%=request.getAttribute("ordertype") %>">用户名</a><img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('user_id')" /></div></td>
				<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=type&ordertype=<%=request.getAttribute("ordertype") %>">类型</a><img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('type')" /></div></td>
				<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=class_name&ordertype=<%=request.getAttribute("ordertype") %>">类名</a><img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('class_name')" /></div></td>
				<td><div align="center"><a href="<%=request.getAttribute("url") %>&order=operate_time&ordertype=<%=request.getAttribute("ordertype") %>">操作时间</a><img src="../images/search.png" style="cursor:hand;vertical-align:middle;margin:0 0 0 5px;" onclick="search('operate_time')" /></div></td>
			</tr>
			<%
				int flag = 0;

				ArrayList mylist = (ArrayList) request.getAttribute("roleList");
				Iterator it = mylist.iterator();
				while (it.hasNext()) {
					LogoperateSelectActionBean bean = (LogoperateSelectActionBean) it.next();
					if (flag == 1) {
			%>
			<tr bgcolor="#fffcea">
				<td height="25"><div align="center"><%=bean.getUser_id()%></div></td>
				<td><div align="center"><a href="../logoperate/selectmore.do?roleid=<%=bean.getId() %>"><%=bean.getType()%></a></div></td>
				<td><div align="center"><%=bean.getClass_name() %></div></td>
				<td><div align="center"><%=bean.getOperate_time() %></div></td>
			</tr>
			<%
					flag = 0;
					} else {
			%>
			<tr bgcolor="#FFFFFF">
				<td height="25"><div align="center"><%=bean.getUser_id()%></div></td>
				<td><div align="center"><a href="../logoperate/selectmore.do?roleid=<%=bean.getId() %>"><%=bean.getType() %></a></div></td>
				<td><div align="center"><%=bean.getClass_name() %></div></td>
				<td><div align="center"><%=bean.getOperate_time() %></div></td>
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

