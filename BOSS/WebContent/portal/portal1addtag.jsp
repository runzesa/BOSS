<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<%
if (session.getAttribute("login") == null
		|| (!session.getAttribute("login").equals("true"))) {
	response.sendRedirect("portal1addtagok.jsp");
}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>标签管理</title>
<script src="js/tmpng.js" type=text/javascript></script>
<style type="text/css"></style>
<script language="JavaScript">
<!--
function update()
{
	document.form1.action="portal1addtagok.jsp";
	document.form1.submit();
}

function link2() { //v2.0
window.open('portal1modulejs.jsp','','width=336,height=524,left='+(screen.width-506)/2+',top='+(screen.height-600)/2);
}
-->
</script>
<link href="../css/<%=session.getAttribute("style").toString() %>" rel="stylesheet" type="text/css">
</head>

<body class="bqgl_body">
<form method="post" action="" name="form1">
<div class="bqgl_content">
<div class="bqgl_div">
<TABLE>
  <TR>
    <TD width="300" height="55"></TD>
	<TD width="90" style=" color:#FFF"><a href="portal1addtagdel.jsp">删除标签管理</a></TD>
  </TR>
</TABLE> 
<table>
  <tbody>
  <TR>
    <TH>输入您所要填充的标签文字：</TH>
    <TD><input name="name" type="text"/></TD>
	<TD width="90"></TD>
  </TR>
  <TR>
    <TH>请添加您所要的模块：</TH>
    <TD><input name="function" type="text"/></TD>
	<TD><input type="button"  value="模块.." class="button"
	onClick="link2('portal1module.jsp','','width=436,height=324,left='+(screen.width-436)/2+',top='+(screen.height-324))"></TD>
  </TR>
  <TR>
    <TH>模块路径：</TH>
    <TD><input name="link" type="text"/></TD>
	<TD></TD>
  </TR>
  <TR>
    <TH>请选择您所要的标签图标：</TH>
	<TD></TD>
	<TD></TD>
  </TR>
  </tbody>
</table>
<table>
  <TBODY>
   <TR>
	<TD><input name="image" type="radio" value="Bookmark.png" class="radio" /></TD>
    <TD><img src="../images/icon/Bookmark.png" /></TD>
    <TD><input name="image" type="radio" value="Char.png" class="radio" /></TD>
    <TD><img src="../images/icon/Char.png" /></TD>
    <TD><input name="image" type="radio" value="Documents.png" class="radio" /></TD>
    <TD><img src="../images/icon/Documents.png" /></TD>
    <TD><input name="image" type="radio" value="Download.png" class="radio" /></TD>
    <TD><img src="../images/icon/Download.png" /></TD>
    <TD><input name="image" type="radio" value="Home.png" class="radio" /></TD>
    <TD><img src="../images/icon/Home.png" /></TD>
   </TR>
   <TR>
	<TD><input name="image" type="radio" value="Mail.png" class="radio" /></TD>
    <TD><img src="../images/icon/Mail.png" /></TD>
    <TD><input name="image" type="radio" value="Refresh.png" class="radio" /></TD>
    <TD><img src="../images/icon/Refresh.png" /></TD>
    <TD><input name="image" type="radio" value="Stats.png" class="radio" /></TD>
    <TD><img src="../images/icon/Stats.png" /></TD>
    <TD><input name="image" type="radio" value="Upload.png" class="radio" /></TD>
    <TD><img src="../images/icon/Upload.png" /></TD>
    <TD><input name="image" type="radio" value="Web.png" class="radio" /></TD>
    <TD><img src="../images/icon/Web.png" /></TD>
   </TR>
  </TBODY>
</table>
<div class="bqgl_btns">
<input name="change" type="button"  value="保存" class="button" onClick="update()">
<input name="close" type="button"  value="关闭" class="button"  onClick="window.close()">
</div>
</div>
</div>
</form>
</body>
</html>
