<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GB2312" language="java"
	import="java.sql.*" errorPage=""%>
<%if (session.getAttribute("login") == null
					|| (!session.getAttribute("login").equals("true"))) {
				response.sendRedirect("portal2openok.jsp");
			}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>模块管理</title>
<style type="text/css"></style>
<script src="portal2openwindow.js" type="text/javascript"></script>

<link href="../css/<%=session.getAttribute("style").toString() %>"
	rel="stylesheet" type="text/css">
<script language="JavaScript">
<!--
window.onload=pageLoad;
var portal = "<%=request.getParameter("portal") %>";
-->
</script>
</head>

<body class="mkgl_body">
<form method="post" action="portal2openok.jsp" name="form1">
<input type="hidden" name="portal" id="portal" />
<div class="mkgl_content">
<div class="mkgl_div">
<TABLE>
  <TBODY>
  <TR>
    <TD>请选择您需要的模块：</TD>
	<TD width="90"></TD>
  </TR>
  <TR>
    <TH><span>*</span>模块名称：</TH>
    <TD><input name="oldPassword" type="text"/></TD>
	<TD></TD>
  </TR>
  </TBODY>
</TABLE>
<hr />
<TABLE>
  <TBODY>
  <TR>
    <TH><span>*</span>选择功能模块：</TH>
    <TD><input name="function" id="function" type="text"/></TD>
	<TD width="90"><input name="button" id="button" type="button"  value="模块.." class="button" 
	onClick="window.open('portal2modulejs.jsp','portal2module','width=336,height=524,left='+(screen.width-506)/2+',top='+(screen.height-600)/2)"></TD>
  </TR>
  <TR>
    <TH><span>*</span>模块路径：</TH>
	<TD><input name="againNewPassword" id="againNewPassword" type="text"/></TD>
	<input name="NewPassword" id="NewPassword" type="hidden" class="Gp-pwd-input" />
	<TD></TD>
  </TR>
  <TR>
    <TH><span>*</span>模块类型：</TH>
	<TD style="padding:4px 0 0 0;">数据<input name="modtype" checked="checked"  onclick="chosetype('select')" type="radio" value="数据" class="radio" />
	    图表<input name="modtype" onclick="chosetype('chart')" type="radio" value="图表" class="radio" /></TD>
	<TD></TD>
  </TR>
  </TBODY>
 </TABLE>
<hr />
<div class="mkgl_btns">
<input name="change" type="submit"  value="保存" class="button">
<input name="close" type="button"  value="关闭"  onClick="window.close()" class="button">
</div>
</div>
</div>
</form>
</body>
</html>