<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.genius.adminmanager.loglogin.actionbean.*"%>
<%@ page import="com.genius.adminmanager.useronline.action.*" %>
<%@ page import="com.genius.adminmanager.useronline.actionbean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>登陆用户</title>
<link href="../css/style.css" rel=stylesheet type=text/css />
<script src="../css/tools.js" type="text/javascript"></script>
<base target="_self" />
</head>
<%
	Map appMap = (HashMap)request.getAttribute("appMap");
%>
<body class="right_date_body">
<div class="bmgl_div">
<div class="right_date_top_nav">
      <ul>
      <li class="del"><a href="select.do">刷新</a></li>
      </ul>
</div>
</div>		
<div class="bmgl_div">
<form name='useronlineform' action=''>
<table  width="100%" cellpadding="0" cellspacing="1" bgcolor="#9dabb6">
<tr style="background:url(../images/title_bg.gif) repeat-x;font-weight:bold;">
			<td height="25"><div align="center">用户id</div></td>
		<td><div align="center">用户名</div></td>
			<td><div align="center">用户IP</div></td>
			<td><div align="center">登录时间</div></td>
		</tr>
			<%
			if(appMap!=null)
				for(Object o:appMap.keySet()){
					UserOnLine user= (UserOnLine)appMap.get(o);
				%>
		<tr bgcolor="#FFFFFF">	
		  <td height="25"><div align="center"><%=user.getUserid() %></div></td>
		  <td><div align="center"><%=user.getUsername() %></div></td>
		  <td><div align="center"><%=user.getUserip() %></div></td>
		  <td><div align="center"><%=user.getLogindate() %></div></td>
	  </tr>
			<%
				}
			%>
</table>
</form>
</div>
</body>
</html>

