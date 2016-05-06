<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<%
if (session.getAttribute("login") == null
		|| (!session.getAttribute("login").equals("true"))) {
	response.sendRedirect("passwordupdate.jsp");
}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/<%=session.getAttribute("style").toString() %>" rel="stylesheet" type="text/css">
<title>帮助</title>

<script language="JavaScript">
<!--
function update()
{
	document.form1.action="passwordupdate.jsp";
	document.form1.submit();
}
-->
</script>
<script src="js/table.js" type=text/javascript></script>
</head>

<body class="help_body">
<div class="help_content">
<div class="help_div">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td class="help_title">&nbsp;</td>
    </tr>
    <tr>
      <td class="help_padding">&nbsp;</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td class="help_title">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td class="help_title">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</div>
</div>
</body>
</html>
