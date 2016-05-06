<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.adminmanager.logoperate.*"%>
<%@ page import="com.genius.adminmanager.logoperate.actionbean.*"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title>操作管理</title>
<link href="../css/style.css" rel=stylesheet type=text/css>
<script src="../css/tools.js" type="text/javascript"></script>

<base target="_self">
</head>

<body topmargin="0" leftmargin="0">
<br>


<table border="0" width="95%" cellspacing="0" cellpadding="0"
	bgcolor="#FFFFFF">
	<tr>
		<td valign="top">
		<center>

		<table width="95%" height="24" align="center">
			<tr>
				<form action="<%=request.getAttribute("url") %>" method="post" user_id="searchForm">
				<td id="search"></td>
				</form>
			</tr>
		</table>
		<table border="0" width="95%" cellspacing="0" cellpadding="0"
			background="../images/new_tu_02.gif">
			<tr>
				<td width="100%">&nbsp;</td>
			</tr>
		</table>
		</center>
		<div align="center">
		<center>
		<form method="post"
			action="roledelete.do?<%=request.getAttribute("query") %>"
			name="form1">
			<%
				LogoperateSelectActionBean bean = (LogoperateSelectActionBean)request.getAttribute("bean");
			%>
		<table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bordercolor="0" bgcolor="#CCCCCC">
  <tr>
    <td height="20" bgcolor="#DFEBF0"><div align="center">用户名</div></td>
    <td bgcolor="#FFFFFF"><div align="center"><%=bean.getUser_id()%></div></td>
  </tr>
  <tr>
    <td height="20" bgcolor="#DFEBF0"><div align="center">类型</div></td>
    <td bgcolor="#FFFFFF"><div align="center"><%=bean.getType()%></div></td>
  </tr>
  <tr>
    <td height="20" bgcolor="#DFEBF0"><div align="center">类名</div></td>
    <td bgcolor="#FFFFFF"><div align="center"><%=bean.getClass_name()%></div></td>
  </tr>
  <tr>
    <td height="20" bgcolor="#DFEBF0"><div align="center">方法名</div></td>
    <td bgcolor="#FFFFFF"><div align="center"><%=bean.getMethod_name()%></div></td>
  </tr>
  <tr>
    <td height="20" bgcolor="#DFEBF0"><div align="center">方法参数</div></td>
    <td bgcolor="#FFFFFF"><div align="center"><%=bean.getMethod_parameter()%></div></td>
  </tr>
  <tr>
    <td height="20" bgcolor="#DFEBF0"><div align="center">SQL语句</div></td>
    <td bgcolor="#FFFFFF"><div align="center"><%=bean.getOperate_sql()%></div></td>
  </tr>
  <tr>
    <td height="20" bgcolor="#DFEBF0"><div align="center">操作时间</div></td>
    <td bgcolor="#FFFFFF"><div align="center"><%=bean.getOperate_time() %></div></td>
  </tr>
</table>
	</form>
		</center>
		</div>
		</td>
	</tr>
	<tr>
		<td valign="top">
		</td>
	</tr>
</table>

</body>

</html>