<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link type="text/css" rel="stylesheet" href="css/xtree2.css">
<script type="text/javascript" src="js/xtree2.js"></script>
<script type="text/javascript" src="js/xloadtree2.js"></script>

</head>
<body>


<table border="0" width="95%" cellspacing="0" cellpadding="0"
	bgcolor="#FFFFFF">
	<tr>
		<td valign="top">
		<center>
		<table border="0" width="95%" cellspacing="0" cellpadding="0">
			<tr>
				<td width="100%">&nbsp;</td>
			</tr>
		</table>
		</center>
		<div align="center">
		
		<form method="post" name="form1">
		<table border="1" width="95%" cellspacing="1" cellpadding="0" bordercolor="#7BABC1">
			<tr bgcolor="#DFEBF0" align="left">
				<td>
				
	<script type="text/javascript">

	var tree = new WebFXLoadTree("/用户列表", "xtreeuser.do?pid=0&formname=<%=request.getParameter("formname")%>&nameinput=<%=request.getParameter("nameinput")%>&idinput=<%=request.getParameter("idinput")%>","","","images/users2.gif","images/users2.gif");
	tree.write();

	</script>		
				
			</td>
			</tr>
		</table>
		</form>
		
		</div>
		</td>
	</tr>
	<tr>
		<td valign="top">
		<div align="center"><br>
		<p>&nbsp;</p>
		</div>
		</td>
	</tr>
</table>

</body>
</html>
